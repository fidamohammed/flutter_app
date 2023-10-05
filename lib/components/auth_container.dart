
import 'dart:ui';

import 'package:first_app/components/my_text_field.dart';
import 'package:first_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthContainer extends StatelessWidget{
  const AuthContainer({super.key, required this.children});

  final List<Widget>  children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [

            Image.network(
              bgUrl,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            // ImageFiltered(
            //     imageFilter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
            //   child: Container(
            //     child: MyTextField(),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),


          ],
        ),
      )

    );
  }

}