

import 'package:first_app/model/category.dart';
import 'package:first_app/providers/category_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedCategoryNotifier extends StateNotifier<Category?>{

  late StateNotifierProviderRef<SelectedCategoryNotifier, Category?> ref;

  SelectedCategoryNotifier(this.ref) : super(null);

  void selectCategory(String id){
    state = ref.read(categoryListProvider).firstWhere((element) => element.id == id);
  }

  void updateCategory(Category category){
    ref.read(categoryListProvider.notifier).updateCategory(category);
    state = category;

  }

}

var selectedCategoryProvider = StateNotifierProvider<SelectedCategoryNotifier, Category?>((ref) => SelectedCategoryNotifier(ref));