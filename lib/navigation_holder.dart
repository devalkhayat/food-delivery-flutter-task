import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/feature/favorites/ui/screens/favorites_screen.dart';
import 'package:food_delivery_app/feature/home/ui/screens/home_screen.dart';
import 'package:food_delivery_app/feature/profile/ui/screens/profile_screen.dart';
import 'package:food_delivery_app/core/theme/util/colors.dart' as colors;

import 'feature/cart/ui/screens/cart_screen.dart';
class navigation_holder extends StatefulWidget {
  const navigation_holder({super.key});

  @override
  State<navigation_holder> createState() => _NavigationHolderState();
}

class _NavigationHolderState extends State<navigation_holder> {
  int _selectedIndex=0;
  void _navigationBottomBar(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

  final List<Widget> _pages=[const home_screen(),const favorites_screen(),CartScreen(),const profile_screen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: bottomBar(),
      body:_pages[_selectedIndex],
    );
  }


  Widget bottomBar(){
    return  BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _navigationBottomBar,  
      type: BottomNavigationBarType.fixed,

      items: [
        BottomNavigationBarItem(icon: SizedBox(height: 24,width: 24,child: SvgPicture.asset("assets/images/ic_nav_home.svg",colorFilter: ColorFilter.mode(_selectedIndex == 0 ? colors.primaryColor : colors.gray8, BlendMode.srcATop))),label: "Home"),
        BottomNavigationBarItem(icon: SizedBox(height: 24,width: 24,child: SvgPicture.asset("assets/images/ic_nav_favorites.svg",colorFilter: ColorFilter.mode(_selectedIndex == 1 ? colors.primaryColor : colors.gray8, BlendMode.srcATop))),label: "Favorites"),
        BottomNavigationBarItem(icon: SizedBox(height: 24,width: 24,child: SvgPicture.asset("assets/images/ic_nav_cart.svg",colorFilter: ColorFilter.mode(_selectedIndex == 2 ? colors.primaryColor : colors.gray8, BlendMode.srcATop))),label: "Cart"),
        BottomNavigationBarItem(icon: SizedBox(height: 24,width: 24,child: SvgPicture.asset("assets/images/ic_nav_profile.svg",colorFilter: ColorFilter.mode(_selectedIndex == 3 ? colors.primaryColor : colors.gray8, BlendMode.srcATop))),label: "Profile"),
      ],
    );
  }


}

