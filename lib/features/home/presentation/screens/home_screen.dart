import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bey/features/auth/presentation/providers/main_nav_container_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/asset_paths.dart';
import '../../../common/presentation/widgets/cateogry_card.dart';
import '../widgets/circle_icon_button.dart';
import '../widgets/home_carousel_slider.dart';
import '../widgets/product_search_field.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
            spacing: 8,
            children: [
              SizedBox(height: 0,),
              ProductSearchField(),
              HomeCarouselSlider(),
              SectionHeader(title: 'Categories', onTap: () {
                context.read<MainNavContainerProvider>().changeToCategories();
              },),
              _buildCategoryList()
            ],
          ),
        ),
      ),
    );
  }

  // Bellow code is Category List View
  Widget _buildCategoryList() {
    return SizedBox(
              height: 95,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index){
                    return CategoryCard();

                  },
                  separatorBuilder: (context, index) => SizedBox(width: 8,),
              ),
            );
  }


  // This is App Bar method
  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        spacing: 8,
        children: [
          SvgPicture.asset(AssetPaths.navLogoSvg, height: 24),
          Spacer(),
          CircleIconButton(icon: Icons.person, onTap:(){},),
          CircleIconButton(icon: Icons.call, onTap:(){},),
          CircleIconButton(icon: Icons.notifications_active_outlined, onTap:(){},),
        ],
      ),
    );
  }
}







