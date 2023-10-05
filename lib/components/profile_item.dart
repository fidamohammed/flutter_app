
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget{
  const ProfileItem({
    super.key,
    required this.icon,
    required this.text});

  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,padding: EdgeInsets.symmetric(horizontal: 50),
      child: ListTile(
        onTap: (){},
        leading: Container(
          decoration: BoxDecoration(),
          child: icon,
        ),
        title: Text(text),

      ),
    );


  }

}