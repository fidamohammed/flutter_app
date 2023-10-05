
import 'package:first_app/model/category.dart';
import 'package:first_app/navigation/routes.dart';
import 'package:first_app/screens/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ItemTap = Function(Category category);

class CategoryGridItem extends StatelessWidget{
  const CategoryGridItem({
    super.key,
    required this.category, this.onItem
  });

  final Category category;
  final ItemTap? onItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onItem?.call(category);
      },
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: LinearGradient(
            colors: [
              Colors.green.withOpacity(0.40),
              Colors.green.withOpacity(0.95),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.name,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground)
        ),
      ),
    );
  }

}