import 'package:crafty_bey/app/app_colors.dart';
import 'package:crafty_bey/app/constants.dart';
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
              SizedBox(height: 16),
              ProductSearchField(),
              SizedBox(height: 16),
              HomeCarouselWidgets(),
              SectionHeader(
                title: 'Categories',
                onTapSeeAll: () {
                  context.read<MainNavContainerProvider>().changToCategories();
                },
              ),
              _buildCategoryList(),

              //============Popular section bellow===============
              SectionHeader(title: 'Popular', onTapSeeAll: () {}),
              SizedBox(
                height: 180,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: .horizontal,
                    itemBuilder: (context, index){
                  return Padding(
                    padding:  EdgeInsets.only(right: 8),
                    child: PopularCard(),
                  );
                }),
              ),
              //============Special section bellow===============
              SectionHeader(title: 'Special', onTapSeeAll: () {}),
              SizedBox(
                height: 180,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: .horizontal,
                    itemBuilder: (context, index){
                  return Padding(
                    padding:  EdgeInsets.only(right: 8),
                    child: PopularCard(),
                  );
                }),
              ),
              //============New section bellow===============
              SectionHeader(title: 'New', onTapSeeAll: () {}),
              SizedBox(
                height: 180,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: .horizontal,
                    itemBuilder: (context, index){
                  return Padding(
                    padding:  EdgeInsets.only(right: 8),
                    child: PopularCard(),
                  );
                }),
              ),

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
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryCard();
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 8);
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: SvgPicture.asset(AssetPaths.navLogoSvg, height: 24),
      actions: [
        CircleIconButton(icon: Icons.person, onTap: () {}),
        SizedBox(width: 4),
        CircleIconButton(icon: Icons.call, onTap: () {}),
        SizedBox(width: 4),
        CircleIconButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
        SizedBox(width: 16),
      ],
    );
  }
}

class PopularCard extends StatelessWidget {
  const PopularCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
