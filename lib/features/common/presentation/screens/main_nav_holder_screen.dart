import 'package:crafty_bey/features/auth/presentation/providers/main_nav_container_provider.dart';
import 'package:crafty_bey/features/category/presentation/screens/category_list_screen.dart';
import 'package:crafty_bey/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';

class MainNavHolderScreen extends StatefulWidget {
  const MainNavHolderScreen({super.key});
static const String routeName = '/MainNavHolderScreen';
  @override
  State<MainNavHolderScreen> createState() => _MainNavHolderScreenState();
}

class _MainNavHolderScreenState extends State<MainNavHolderScreen> {

  final List<Widget> _screens = [
    HomeScreen(),
    CategoryListScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavContainerProvider>(
      builder: (context, mainNavContainerProvider, child) {
        return Scaffold(
          body: _screens[mainNavContainerProvider.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: AppColors.themeColor,
              unselectedItemColor: Colors.grey,
              currentIndex: mainNavContainerProvider.selectedIndex,
              onTap: mainNavContainerProvider.changeItem,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard_customize), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Carts"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_outlined), label: "Wishlist"),
          ]),
        );
      }
    );
  }
}
