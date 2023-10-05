
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/dialog/dialog_util.dart';
import 'package:first_app/model/category.dart';
import 'package:first_app/navigation/routes.dart';
import 'package:first_app/providers/selected_category_provider.dart';
import 'package:first_app/screens/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/my_text_field.dart';

class EditCategory extends ConsumerWidget{
   EditCategory({super.key, required this.category});

  final nameController = TextEditingController();
  final idController = TextEditingController();
  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
nameController.text = category.name;
idController.text = category.id;
    // final args = ModalRoute.of(context)?.settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Category'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 40,),
            MyTextField(
              hintText: category.id,
              myController: idController,
            ),
            const SizedBox(height: 8,),
            MyTextField(
              hintText: category.name,
              myController: nameController,
            ),
            const SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      deleteCategory();
                    },
                    child: Text('Delete Category')
                ),
                ElevatedButton(
                    onPressed: () {
                      updateCategory(context,ref);
                    },
                    child: Text('Update Category')
                )
              ],
            )
          ],
        ),
      ),
    );
  }

   void deleteCategory() async{
     final user = FirebaseAuth.instance.currentUser;
     CollectionReference categoryRef = FirebaseFirestore.instance.collection('plantCategories-${user?.uid}');
     await categoryRef.doc('${category.id}')
         .delete()
         .then((value) {
           navService.replaceTo(Routes.home);
         }).catchError((error){
           print(error);
         });

   }

   void updateCategory(BuildContext context, WidgetRef ref) async{
     DialogUtil.showLoading(context);
     final user = FirebaseAuth.instance.currentUser;
     CollectionReference categoryRef = FirebaseFirestore.instance.collection('plantCategories-${user?.uid}');
     categoryRef.doc(category.docId).update({
       'name': nameController.text,
       'id': idController.text
     }).then((value) {
       print("Category Updated");
       navService.goBack();
       DialogUtil.showSnackBar(context, 'Category updated successfully');
       }).catchError((error){
       print("Failed to add user: $error");
     });
     
     ref.read(selectedCategoryProvider.notifier).updateCategory(Category(id: idController.text, name: nameController.text, docId: category.docId));
   }

}