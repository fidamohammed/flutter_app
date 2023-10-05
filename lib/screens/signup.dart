
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/components/auth_container.dart';
import 'package:first_app/di/locator.dart';
import 'package:first_app/navigation/navigation_service.dart';
import 'package:first_app/navigation/routes.dart';
import 'package:first_app/screens/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/my_text_field.dart';

class SignUp extends StatelessWidget{
  const SignUp({super.key});



  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final auth = FirebaseAuth.instance;
    final NavigationService navService = locator<NavigationService>();

    return AuthContainer(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.40,),
          const Text("Sign Up", style: TextStyle( fontSize: 25, color: Colors.blueGrey)),
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
                          MyTextField(hintText: 'First Name',),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                          MyTextField(hintText: 'Last Name', ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                          MyTextField(hintText: 'Email',myController: emailController),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                          MyTextField(hintText: 'Password',obscure: true, showToggleIcon: true,myController: passwordController),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                          ElevatedButton(
                              onPressed: () async {
                                if(_formKey.currentState!.validate()){
                                  try {
                                    final credential = await auth.createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                    if (credential.user != null) {
                                      navService.replaceToByClearingStack(Routes.home);
                                    }
                                    else{
                                      _showDialog(
                                        context,
                                        "Error in registering",
                                        "Please check the details entered",
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
                                  } catch (e) {
                                    _showDialog(
                                      context,
                                      "Error in registering",
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
                                    print(e);
                                  }

                                  //     showDialog(
                                  //     context: context,
                                  //     builder: (ctx) => AlertDialog(
                                  //       title: const Text('Sign Up'),
                                  //       content: const Text('Successfully Registered'),
                                  //       actions: [
                                  //         TextButton(
                                  //             onPressed: ()  {
                                  //
                                  //               Navigator.of(ctx).pop();
                                  //
                                  //             },
                                  //             child: Text('Ok')
                                  //         )
                                  //       ],
                                  //     )
                                  // );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 50),
                                  backgroundColor: Colors.teal,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                              ),
                              child: Text('SignUp')
                          ),
                        ],
                      ),
                    )
                  )
              )

          )

        ]
    );
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