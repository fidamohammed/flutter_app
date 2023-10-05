
import 'package:first_app/model/category.dart';
import 'package:first_app/navigation/routes.dart';
import 'package:first_app/screens/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/selected_category_provider.dart';

class CategoryDetails extends ConsumerStatefulWidget{
  const CategoryDetails({super.key, this.showAppBar = true});

  final bool showAppBar;

  @override
  ConsumerState<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends ConsumerState<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    Category? category = ref.watch(selectedCategoryProvider);
    print('Category detail called');
    var body = Center(
        child: Column(
          children: [
            Text(
              category?.name ?? 'No Category Selected',
              style: Theme.of(context).textTheme.bodyMedium
                  ?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            ElevatedButton(
                onPressed: (){
                  navService.navigateTo(Routes.updateCategory,arguments: category);
                },
                child: const Text('Update'))
          ],
        )
    );
    if(!widget.showAppBar) {
      return body;
    }else{
      return Scaffold(
          appBar: AppBar(
            title: const Text('Category detail'),
          ),
          body:body
      );
    }


  }
}