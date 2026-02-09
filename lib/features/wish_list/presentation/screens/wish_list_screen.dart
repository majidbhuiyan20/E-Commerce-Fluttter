import 'package:crafty_bey/features/common/presentation/provider/main_nav_container_provider.dart';
import 'package:crafty_bey/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../home/presentation/widgets/product_card.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (_, __){
        context.read<MainNavContainerProvider>().changeToHome();
      },
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Wishlist"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: GridView.builder(
              itemCount: 30,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8) , itemBuilder: (context, index){
            return FittedBox(child: ProductCard());
          }),
        ),
      ),
    );
  }
}
