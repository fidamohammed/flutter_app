
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/components/my_text_field.dart';
import 'package:first_app/dialog/dialog_util.dart';
import 'package:first_app/navigation/routes.dart';
import 'package:first_app/screens/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class CreateCategory extends StatelessWidget{
   CreateCategory({super.key});

  final nameController = TextEditingController();
  final idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Plant Category'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 40,),
            MyTextField(
              hintText: 'Plant Category id',
              myController: idController,
            ),
            const SizedBox(height: 8,),
            MyTextField(
              hintText: 'Plant Category Name',
              myController: nameController,
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  createCategory(context);
                },
                child: Text('Create Category')
            )
          ],
        ),
      ),
    );
  }

  void createCategory(BuildContext context) async{
    DialogUtil.showLoading(context);
    final user = FirebaseAuth.instance.currentUser;
    CollectionReference categoryRef = FirebaseFirestore.instance.collection('plantCategories-${user?.uid}');
    categoryRef.add({
      'name': nameController.text,
      'id': idController.text
    }).then((value) {
      navService.goBack();
      // navService.navigateTo(Routes.home.name);
      // navService.replaceToByClearingStackTill(Routes.home.name, (route) => route.currentResult == Routes.home);
    }).catchError((error){
      navService.goBack();
    });
  }

}