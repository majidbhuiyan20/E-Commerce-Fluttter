import 'package:crafty_bey/features/cart/presentation/widgets/inc_dec_button.dart';
import 'package:crafty_bey/features/product/presentation/widgets/color_picker.dart';
import 'package:crafty_bey/features/product/presentation/widgets/product_image_slider.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/constants.dart';
import '../../../common/presentation/widgets/favourite_button.dart';
import '../../../common/presentation/widgets/rating_view.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const routeName = "/product-details";

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageSlider(),
                  SizedBox(height: 12),
                  Padding(
                    padding: .symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: .start,
                      crossAxisAlignment: .start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Nike Shoe A3434 - All New Edition 2026",
                                style: textTheme.titleMedium?.copyWith(
                                  fontWeight: .w600,
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            IncDecButton(),
                          ],
                        ),
                        Row(
                          children: [
                            RatingView(),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Review",
                                style: TextStyle(color: AppColors.themeColor),
                              ),
                            ),
                            FavouriteButton(),
                          ],
                        ),
                        Text(
                          "Color",
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: .w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        ColorPicker(
                          Colors: ["Black", "Blue", "Green", "White"],
                          onChange: (String selectedColor) {},
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Size",
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: .w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        ColorPicker(
                          Colors: ["S", "M", "L", "XL", "XXL"],
                          onChange: (String selectedColor) {},
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Description",
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: .w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Its purpose is provide an illusion of content so the viewer focuses on the layout rather than the text. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Its purpose is provide an illusion of content so the viewer focuses on the layout rather than the text",
                        style: TextStyle(color: Colors.grey),

                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildPriceAndAddToCartSection(textTheme),
          ),
        ],
      ),
    );
  }

  Container _buildPriceAndAddToCartSection(TextTheme textTheme) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withAlpha(20),
        borderRadius: .only(topLeft: .circular(16), topRight: .circular(16)),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                "Total",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: .w500),
              ),
              Text(
                '${Constants.takaSign}2000',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: .w700,
                  color: AppColors.themeColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: 130,
            child: FilledButton(onPressed: () {}, child: Text("Add to Cart")),
          ),
        ],
      ),
    );
  }
}
