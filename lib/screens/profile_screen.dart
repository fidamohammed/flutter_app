import 'package:first_app/components/my_text_field.dart';
import 'package:first_app/components/profile_item.dart';
import 'package:first_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/leaves.jpg'),fit: BoxFit.fitWidth),
                    ),
                    )

                  ],
                ),

                Container(
                  alignment: Alignment.bottomCenter,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height *0.1,),
            ProfileItem(icon: Icon(Icons.person), text: 'User Name'),
            ProfileItem(icon: Icon(Icons.phone_android), text: 'Phone number'),
            ProfileItem(icon: Icon(Icons.email), text: 'Email'),
            ProfileItem(icon: Icon(Icons.calendar_month), text: 'Birthday'),
              ],
            ),

    );
  }

}