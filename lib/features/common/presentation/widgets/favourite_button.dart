import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      color: AppColors.themeColor,
      child: Icon(Icons.favorite_outline, size: 20, color: Colors.white,),
    );
  }
}
