import 'package:crafty_bey/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ProductListByCategoryScreen extends StatefulWidget {
  const ProductListByCategoryScreen({super.key});
  static const String routeName = "/product-list-by-category";

  @override
  State<ProductListByCategoryScreen> createState() =>
      _ProductListByCategoryScreenState();
}

class _ProductListByCategoryScreenState
    extends State<ProductListByCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Electronics")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return FittedBox(child: PopularCard());
          },
        ),
      ),
    );
  }
}
