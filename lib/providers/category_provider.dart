import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/model/category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryListNotifier extends StateNotifier<List<Category>> {
  CategoryListNotifier() : super([]);

  void fetchData() {
    final user = FirebaseAuth.instance.currentUser;
    CollectionReference categoryRef =
        FirebaseFirestore.instance.collection('plantCategories-${user?.uid}');
    List<Category> categories = [];
    categoryRef.get().then((value) {
      for (var doc in value.docs) {
        categories.add(Category(docId:doc.id , id: doc.get('id'), name: doc.get('name')));
      }
      state = categories;
    });
    // categoryRef.snapshots().listen((event) {
    //   setState(() {
    //     isLoading = false;
    //     categories.clear();
    //     for (var value in event.docs) {
    //       print("TESTNG FIRESTORE: ${value.data()}");
    //       final category =
    //       Category(id: value.get('id'), name: value.get('name'));
    //       categories.add(category);
    //     }
    //   });
    // });
  }

  void updateCategory(Category category) {
    Category? cat = state.firstWhere((element) => element.id == category.id);
    final index = state.indexOf(cat);
    if (index >= 0) {
      final copy = List.of(state);
      copy[index].name = category.name;
      state = copy;
    }
  }
}

var categoryListProvider =
    StateNotifierProvider<CategoryListNotifier, List<Category>>(
        (ref) => CategoryListNotifier());
