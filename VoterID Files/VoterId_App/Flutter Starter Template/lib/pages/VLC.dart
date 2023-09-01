import 'package:flutter/material.dart';
import 'package:startertemplate/pages/sveep.dart';
import 'package:url_launcher/url_launcher.dart';

import '../drawer_pages/new_voter_registration_page.dart';
import 'BoothInfo.dart';
import 'elcPage.dart';
import 'evm.dart';
import 'gallery.dart';
import 'VedoPage.dart';

void main() {
  runApp(vlcPage());
}

class vlcPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Handles the back button press
            },
          ),
          title: Text('VLC'), // Add a title for the app bar
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFFFF9933)
                    .withOpacity(0.7), // Saffron with opacity
                const Color(0xFFFFFFFF).withOpacity(0.7), // White with opacity
                const Color(0xFF128807).withOpacity(0.7), // Green with opacity
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.2, 0.5, 0.9],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 15.0), // Add top padding to shift cards downward
            child: Center(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(16.0),
                children: [
                  ServiceCard(
                    title: 'SVEEP',
                    icon: Icons.polyline,
                    onTap: () {
                      // Navigate to booth information page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => sveepPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    title: 'Vedo',
                    icon: Icons.assignment_turned_in,
                    onTap: () {
                      // Navigate to booth information page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VedoPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    title: 'EVM',
                    icon: Icons.how_to_vote_sharp,
                    onTap: () {
                      // Navigate to booth information page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EvmPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    title: 'ELC',
                    icon: Icons.menu_book_sharp,
                    onTap: () {
                      // Navigate to booth information page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => elcPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    title: 'Gallery',
                    icon: Icons.photo,
                    onTap: () {
                      // Navigate to booth information page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => galleryPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    title: 'SVEEP',
                    icon: Icons.polyline,
                    onTap: () {
                      // Navigate to booth information page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => sveepPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  ServiceCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 64.0,
                color: Colors.blue,
              ),
              SizedBox(height: 8.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
