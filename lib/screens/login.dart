
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/components/auth_container.dart';
import 'package:first_app/components/my_text_field.dart';
import 'package:first_app/di/locator.dart';
import 'package:first_app/navigation/navigation_service.dart';
import 'package:first_app/navigation/routes.dart';
import 'package:first_app/screens/forgot_password.dart';
import 'package:first_app/screens/categories.dart';
import 'package:first_app/screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../dialog/dialog_util.dart';



class LoginScreen extends StatelessWidget{
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final NavigationService navService = locator<NavigationService>();

  final User? currentUser = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {

     return AuthContainer(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.40,),
        const Text("Login", style: TextStyle( fontSize: 25, color: Colors.blueGrey)),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.02,
                  vertical: MediaQuery.of(context).size.height * 0.02
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyTextField(
                      hintText: 'Email',
                      myController: emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                    MyTextField(
                      hintText: 'Password',
                      obscure: true,
                      showToggleIcon: true,
                      myController: passwordController,
                      textInputAction: TextInputAction.done,
                      onSubmitted: () => signUserIn(context, emailController.text, passwordController.text),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                    ElevatedButton(
                        onPressed: () => signUserIn(context,emailController.text, passwordController.text),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                        ),
                        child: Text('Login')
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPassword()));
                      },
                      child: Align(child: Text('Forgot Password?', style: TextStyle(color: Colors.teal,)),alignment: Alignment.bottomRight, ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(text: 'Don\'t have an account? ',style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: 'Sign up',
                                style: const TextStyle(color: Colors.teal),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
                                  }
                            )
                          ]
                        ),
                      ),

                    )
                  ],
                ),
              )

            )
          )
        )

      ],
    );
  }



  void signUserIn(BuildContext context, String email, String password) async {
    if (_formKey.currentState!.validate()) {
      DialogUtil.showLoading(context);
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: email,
            password: password
        );
        if (credential.user != null) {
          String? result = await _showDialog(
            context,
            "Login Successful",
            "Congratulations, you are successfully logged in ",
            [
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, "Okay");
                },
                child: const Text('OK'),
              ),
            ],
          );
          if (result == 'Okay') {
            navService.replaceToByClearingStack(Routes.home, arguments: email);
            //Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(email: emailController.text,)));
          }
          print(' valid');
        } else {
           _showDialog(
          context,
          "Login Error",
          "Something went wrong ",
          [
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, "Okay");
              },
              child: const Text('OK'),
            ),
          ],
          );
          print('not valid');
        }
      } catch (e) {
        _showDialog(
          context,
          "Error logging in",
          "$e",
          [
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, "Okay");
              },
              child: const Text('OK'),
            ),
          ],
        );
      }
    }
  }

  Future<String?> _showDialog(BuildContext context, String title, String content, List<Widget> actions) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: actions,
      ),
    );
  }
}