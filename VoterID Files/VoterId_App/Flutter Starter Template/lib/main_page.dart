import 'package:flutter/material.dart';
import 'package:startertemplate/pages/loadingScreen.dart';
import 'package:startertemplate/pages/notificationPage.dart';
import 'components/my_bottom_nav_bar.dart';
import 'components/my_drawer.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/login_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    NotificationPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu_rounded,
              size: 30,
              color: Colors.grey.shade800,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.notifications,
          //     size: 30,
          //     color: Colors.grey.shade800,
          //   ),
          //   onPressed: () {
          //     // Navigate to the notification page
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => NotificationPage(),
          //       ),
          //     );
          //   },
          // ),
          IconButton(
            icon: Icon(
              Icons.logout,
              size: 25,
              color: Colors.grey.shade800,
            ),
            onPressed: () {
              // Log out and navigate back to the login page
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoadingPage(),
                ),
                (route) => false, // Remove all existing routes from the stack
              );
            },
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}
