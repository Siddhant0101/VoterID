import 'package:flutter/material.dart';
import 'package:startertemplate/pages/login_page.dart';
import '../drawer_pages/new_voter_registration_page.dart';
import '../pages/about_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  void logUserOut(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  void navigateToPage(BuildContext context, String page) {
    Navigator.pop(context);
    if (page == 'About') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AboutPage(),
        ),
      );
    } else if (page == 'New Voter Registration') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VoterRegistrationPage(),
        ),
      );
    } else if (page == 'Deletion') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VoterRegistrationPage(),
        ),
      );
    } else if (page == 'Correction for Entries') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VoterRegistrationPage(),
        ),
      );
    } else if (page == 'Status of Application') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VoterRegistrationPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          const DrawerHeader(
            child: Center(
              child: Icon(
                Icons.phone_iphone_rounded,
                size: 64,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Voter Service',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select an option',
                    labelStyle: TextStyle(color: Colors.grey[700]),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[700]!),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'New Voter Registration',
                      child: Text('New Voter Registration'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Deletion',
                      child: Text('Deletion'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Correction for Entries',
                      child: Text('Correction for Entries'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Status of Application',
                      child: Text('Status of Application'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      navigateToPage(context, value);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
