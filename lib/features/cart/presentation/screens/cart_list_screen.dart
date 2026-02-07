import 'package:crafty_bey/app/app_colors.dart';
import 'package:crafty_bey/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app/asset_paths.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carts")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  shadowColor: AppColors.themeColor.withAlpha(50),
                  color: Colors.white,
                  child: Row(
                    children: [
                     Image.asset( AssetPaths.shoeImage, height: 50, width: 60,)
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withAlpha(20),
              borderRadius: .only(topLeft: .circular(16), topRight: .circular(16))

            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text("Total", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: .w500),),
                    Text('${Constants.takaSign}2000', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: .w700,color: AppColors.themeColor, fontSize: 20),)
                  ],
                ),
                Spacer(),
                SizedBox(
                    width: 130,
                    child: FilledButton(onPressed: (){}, child: Text("Checkout")))
              ],
            ),
          )
        ],
      ),
    );
  }
}
