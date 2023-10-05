
import 'package:first_app/components/auth_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/my_text_field.dart';

class ForgotPassword extends StatelessWidget{
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthContainer(
        children:[
          SizedBox(height: MediaQuery.of(context).size.height * 0.40,),
          const Text("Forgot Password?", style: TextStyle( fontSize: 25, color: Colors.blueGrey)),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
          MyTextField(hintText: 'Email'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
          ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
              ),
              child: Text('Reset Password')
          ),
        ]
    );
  }

}