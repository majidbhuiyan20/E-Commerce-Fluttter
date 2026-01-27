import 'package:crafty_bey/features/auth/presentation/providers/main_nav_container_provider.dart';
import 'package:crafty_bey/features/common/presentation/widgets/cateogry_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __){
        context.read<MainNavContainerProvider>().backToHomeButton();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
          centerTitle: false,
          leading: IconButton(onPressed: () {
            context.read<MainNavContainerProvider>().backToHomeButton();
          }, icon: Icon(Icons.arrow_back_ios)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount: 60,
            itemBuilder: (context, index) {
              return CategoryCard();
            },
          ),
        ),
      ),
    );
  }
}
