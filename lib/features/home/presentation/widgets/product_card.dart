import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/asset_paths.dart';
import '../../../../app/constants.dart';
import '../../../product/presentation/screens/product_details_screen.dart';
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsScreen.routeName);
      },
      child: SizedBox(
        width: 170,
        child: Card(
          elevation: 3,
          shadowColor: AppColors.themeColor.withAlpha(40),
          color: Colors.white,
          child: Column(
            spacing: 6,
            children: [
              Container(
                width: 180,
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withAlpha(30),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    AssetPaths.shoeImage,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Nike Shoe RG3434 - New Arrival", maxLines: 1,style: TextStyle(overflow: .ellipsis),),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text('${Constants.takaSign}290', style: TextStyle(fontWeight: .w700, fontSize: 16, color: AppColors.themeColor),),
                        Wrap(children: [Icon(Icons.star, color: Colors.amber,size: 20,), Text("4.9")]),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          color: AppColors.themeColor,
                          child: Icon(Icons.favorite_outline, size: 20, color: Colors.white,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}