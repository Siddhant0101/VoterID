import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

/*

B O T T O M N A V B A R

This is the Bottom Navigation Bar from Google. 
It gives a sleek modern look and feel.
You can change up the style to fit your preference,
but I like this modern look with the nice little animations!

Here you can create your buttons that should correspond to the pages.

*/

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: GNav(
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.grey.shade800,
        padding: const EdgeInsets.all(5),
        gap: 4,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.newspaper,
            text: 'Notifications',
          ),
          // GButton(
          //   icon: Icons.pages,
          //   text: 'Forms',
          // ),
          // GButton(
          //   icon: Icons.support,
          //   text: 'EVM',
          // ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
        ],
      ),
    );
  }
}
