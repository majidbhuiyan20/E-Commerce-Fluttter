import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          color: AppColors.themeColor.withAlpha(30),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.computer, size: 32, color: AppColors.themeColor,),
          ),
        ),
        Text("Computer", style: TextStyle(fontWeight: .bold, color: AppColors.themeColor, letterSpacing: .6),)
      ],
    );
  }
}