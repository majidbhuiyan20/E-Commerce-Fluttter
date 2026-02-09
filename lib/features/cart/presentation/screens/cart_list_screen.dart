import 'package:crafty_bey/app/app_colors.dart';
import 'package:crafty_bey/app/constants.dart';
import 'package:crafty_bey/features/cart/presentation/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../app/asset_paths.dart';
import '../../../common/presentation/provider/main_nav_container_provider.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (_,__){
        context.read<MainNavContainerProvider>().changeToHome();
      },
      canPop: false,
      child: Scaffold(
        appBar: AppBar(title: Text("Carts")),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      shadowColor: AppColors.themeColor.withAlpha(50),
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                           Image.asset( AssetPaths.shoeImage, height: 80,),
                            Expanded(child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 12,),
                                    Column(
                                      crossAxisAlignment: .start,
                                      children: [
                                        Text("New Year Special Shoe",maxLines: 1, style: TextStyle(overflow: .ellipsis, fontSize: 16, fontWeight: .w600),),
                                        Text("Color: Red, Size: X", style: TextStyle(color: Colors.grey, fontSize: 14),)
                                      ],
                                    ),
                                    Spacer(),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.grey,))
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 12,),
                                    Text('${Constants.takaSign}100', style: TextStyle(color: AppColors.themeColor, fontWeight: .w600, fontSize: 16),),
                                    Spacer(),
                                    IncDecButton(),
                                    SizedBox(width: 8,),



                                  ],
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              _buildTotalPriceAndCheckOutSection(context)
            ],
          ),
        ),
      ),
    );
  }

  Container _buildTotalPriceAndCheckOutSection(BuildContext context) {
    return Container(
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
          );
  }
}
