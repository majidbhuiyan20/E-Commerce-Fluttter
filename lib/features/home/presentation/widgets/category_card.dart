import 'package:crafty_bey/features/product/presentation/screens/product_list_by_category_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListByCategoryScreen.routeName);
      },
      child: Container(
        height: 48,
        child: Column(
          children: [
            Card(
              elevation: 0,
              color: AppColors.themeColor.withAlpha(30),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.computer, size: 32, color: AppColors.themeColor,),
              ),
            ),
            Text("Computer", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.themeColor, fontWeight: .w500),)
          ],
        ),
      ),
    );
  }
}