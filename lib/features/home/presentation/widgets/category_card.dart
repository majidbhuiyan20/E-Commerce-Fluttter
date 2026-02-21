import 'package:crafty_bey/features/category/data/models/category_model.dart';
import 'package:crafty_bey/features/product/presentation/screens/product_list_by_category_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key, required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListByCategoryScreen.routeName);
      },
      child: Container(
        height:60,
        child: Column(
          children: [
            Card(
              elevation: 0,
              color: AppColors.themeColor.withAlpha(30),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(categoryModel.icon)
              ),
            ),
            Text(categoryModel.title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.themeColor, fontWeight: .w500),)
          ],
        ),
      ),
    );
  }
}