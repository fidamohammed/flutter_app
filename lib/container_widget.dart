



import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

class ContainerWidget extends StatelessWidget{

  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //
    //   child: Column(
    //     children: [
    //       Container(
    //         width: 150,
    //         height: 150,
    //         decoration: const BoxDecoration(
    //           shape: BoxShape.circle,
    //           image: DecorationImage(alignment: Alignment.center,
    //             fit: BoxFit.fill,
    //             image: AssetImage('assets/images/logo.jpg'),
    //           ),
    //         ),
    //       ),
    //       const Text("Welcome Back!",
    //         style: TextStyle(fontSize: 30),textAlign: TextAlign.start,
    //       ),
    //     ],
    //   ),
    // );

    return Center(
        child: Padding(padding: EdgeInsets.all(20),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/logo.jpg'),
                        ),
                      ),
                    ),
                    const Text("Welcome Back!",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                          labelText: 'Username',
                          hintText: 'Enter your username'
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password'
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(10),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // RichText(
                      //     text: TextSpan(text: 'Forgot Password?',
                      //         recognizer:TapGestureRecognizer()..onTap= (){} )
                      // ),
                      InkWell(
                        onTap: (){},
                        child: Text('Forgot Password?', style: TextStyle(color: Colors.blueAccent),),
                      ),
                      ElevatedButton(
                          onPressed: () {  },
                          child: Text("Login")
                      )
                    ],
                  ),
                ),

                // ElevatedButton(
                //   onPressed: () {  },
                //   child: Text("Login"),style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity,40)),
                // ),

                Padding(padding: EdgeInsets.all(20),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlutterSocialButton(
                        onTap: (){},
                        buttonType: ButtonType.google,
                        mini: true,),
                      FlutterSocialButton(
                        onTap: (){},
                        buttonType: ButtonType.facebook,
                        mini: true,),
                      FlutterSocialButton(
                        onTap: (){},
                        buttonType: ButtonType.twitter,
                        mini: true,),

                      // SocialLoginButton(
                      //     buttonType: SocialLoginButtonType.facebook,
                      //     mode: SocialLoginButtonMode.single,
                      //     onPressed: (){}),
                      // SocialLoginButton(
                      //     buttonType: SocialLoginButtonType.google,
                      //     mode: SocialLoginButtonMode.single,
                      //     onPressed: (){}),
                      // SocialLoginButton(
                      //     buttonType: SocialLoginButtonType.twitter,
                      //     mode: SocialLoginButtonMode.single,
                      //     onPressed: (){})
                    ],
                  ),
                ),
              ],
            )
        )
    );
  }

}