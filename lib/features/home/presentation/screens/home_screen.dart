import 'package:crafty_bey/app/app_colors.dart';
import 'package:crafty_bey/features/common/presentation/provider/main_nav_container_provider.dart';
import 'package:crafty_bey/features/home/presentation/widgets/home_carousel_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../app/asset_paths.dart';
import '../widgets/category_card.dart';
import '../widgets/circle_icon_button.dart';
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
            children: [
              SizedBox(height: 16,),
              ProductSearchField(),
              SizedBox(height: 16,),
              HomeCarouselWidgets(),
              SectionHeader(title: 'Categories', onTapSeeAll: (){
                context.read<MainNavContainerProvider>().changToCategories();
              },),
              _buildCategoryList()

            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildCategoryList() {
    return SizedBox(
              height: 90,
              child: ListView.separated(
                  itemCount: 10,
                  scrollDirection:Axis.horizontal,
                  itemBuilder: (context, index){
                return CategoryCard();
              },
                  separatorBuilder: (context, index){
                    return SizedBox(width: 8,);
                  }
              ),
            );
  }







  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: SvgPicture.asset(
        AssetPaths.navLogoSvg,
        height: 24,
      ),
      actions: [
        CircleIconButton(icon: Icons.person, onTap: () {  },),
        SizedBox(width: 4,),
        CircleIconButton(icon: Icons.call, onTap: () {  },),
        SizedBox(width: 4,),
        CircleIconButton(icon: Icons.notifications_active_outlined, onTap: () {  },),
        SizedBox(width: 16,),

      ],
    );
  }
}




