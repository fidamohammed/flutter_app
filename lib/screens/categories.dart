
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/components/category_grid_item.dart';
import 'package:first_app/model/category.dart';
import 'package:first_app/navigation/navigation_service.dart';
import 'package:first_app/providers/category_provider.dart';
import 'package:first_app/providers/selected_category_provider.dart';
import 'package:first_app/screens/home/screen_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../di/locator.dart';

final NavigationService navService = locator<NavigationService>();
final user = FirebaseAuth.instance.currentUser?.email;

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({
    super.key,
  });


  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  bool isLoading = true;

  List<String> drawerItems = [];

  @override
  void initState() {
    ref.read(categoryListProvider.notifier).fetchData();
    super.initState();
  }

  // final db= FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    List<Category> categories = ref.watch(categoryListProvider);
    final drawerItems = [
      'Profile',
      'Home',
      'Settings',
      "${AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light ? "Dark" : "Light"} Theme",
      'SignOut'
    ];
    return Scaffold(
      body: GridView.builder(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: ScreenBreakPoints.isTablet(context) ? 1 : 2,
              childAspectRatio: 5 / 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryGridItem(
              category: categories[index],
              onItem: (item) => ref.read(selectedCategoryProvider.notifier).selectCategory(item.id),
            );
          }),
      // body:GridView(
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     childAspectRatio: 5/3,
      //     crossAxisSpacing: 16,
      //     mainAxisSpacing: 16
      //   ),
      //   children: [
      //     for(final category in categories) CategoryGridItem(category: category)
      //   ],
      //
      // )
    );
  }
  //
  // void fetchCategories() async {
  //   final user = FirebaseAuth.instance.currentUser;
  //   CollectionReference categoryRef =
  //       FirebaseFirestore.instance.collection('plantCategories-${user?.uid}');
  //   categoryRef.snapshots().listen((event) {
  //     setState(() {
  //       isLoading = false;
  //       categories.clear();
  //       for (var value in event.docs) {
  //         print("TESTNG FIRESTORE: ${value.data()}");
  //         final category =
  //             Category(id: value.get('id'), name: value.get('name'));
  //         categories.add(category);
  //       }
  //     });
  //   });
  // }
}

class DrawerList extends StatelessWidget {
  const DrawerList({super.key, required this.items, required this.onItemTap});

  final List<String> items;
  final void Function(int) onItemTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return DrawerListItem(
              title: items[index],
              onTap: () {
                onItemTap(index);
              });
        });
  }
}

class DrawerListItem extends StatelessWidget {
  const DrawerListItem({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navService.goBack();
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
