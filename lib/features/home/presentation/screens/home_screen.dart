import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/asset_paths.dart';
import '../widgets/circle_icon_button.dart';
import '../widgets/product_search_field.dart';

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
              ProductSearchField()

            ],
          ),
        ),
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
