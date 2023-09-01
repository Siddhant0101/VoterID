import 'package:flutter/material.dart';
import 'package:startertemplate/pages/pwdr.dart';
import 'package:startertemplate/pages/result.dart';
import 'package:startertemplate/pages/services.dart';

import '../drawer_pages/new_voter_registration_page.dart';
import 'BoothInfo.dart';
import 'ElectionPage.dart';
import 'VLC.dart';
import 'bag.dart';
import 'candidate_info.dart';
import 'chatbot.dart';
import 'complaintPage.dart';
import 'evm.dart';
import 'package:url_launcher/url_launcher.dart';

import 'myBlo.dart';
import 'myRoOffice.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFFFF9933)
                    .withOpacity(0.9), // Saffron with opacity
                const Color(0xFFFFFFFF).withOpacity(0.8), // White with opacity
                const Color(0xFF128807).withOpacity(0.9), // Green with opacity
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.2, 0.4, 0.9],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Align(
                //   alignment: Alignment.topCenter,
                //   child: Padding(
                //     padding: const EdgeInsets.only(top: 0.0, bottom: 0),
                //     child: Image.asset(
                //       'assets/images/votepic.jpg',
                //       width: 150,
                //       height: 100,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 15,
                ),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  // ignore: sort_child_properties_last
                  children: [
                    ActionCard(
                      icon: Icons.location_city,
                      title: 'My Booth ',
                      onTap: () {
                        // Navigate to booth information page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BoothInfoPage()),
                        );
                      },
                    ),
                    ActionCard(
                      icon: Icons.people,
                      title: 'My Candidates ',
                      onTap: () {
                        // Navigate to booth information page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CandidateInfoPage()),
                        );
                      },
                    ),
                    ActionCard(
                      icon: Icons.maps_home_work_outlined,
                      title: 'My RO Office',
                      onTap: () {
                        // Navigate to booth information page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => myRoOfficePage()),
                        );
                      },
                    ),
                    ActionCard(
                      icon: Icons.person_pin_outlined,
                      title: 'My BLO ',
                      onTap: () {
                        // Navigate to booth information page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const bloPage()),
                        );
                      },
                    ),
                    ActionCard(
                      icon: Icons.view_column_sharp,
                      title: 'VLC',
                      onTap: () {
                        // Navigate to booth information page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => vlcPage()),
                        );
                      },
                    ),
                    ActionCard(
                      icon: Icons.checklist_rtl_rounded,
                      title: 'My Complaint',
                      onTap: () {
                        // Navigate to booth information page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ComplaintPage()),
                        );
                      },
                    ),
                    ActionCard(
                      icon: Icons.webhook_rounded,
                      title: 'Services',
                      onTap: () {
                        // Navigate to booth information page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ServicesPage()),
                        );
                      },
                    ),
                    ActionCard(
                      icon: Icons.connect_without_contact_rounded,
                      title: 'My Chat Bot (FAQ)',
                      onTap: () {
                        // Navigate to booth information page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatBotPage()),
                        );
                      },
                    ),
                    ActionCard(
                      icon: Icons.poll,
                      title: 'BAG',
                      onTap: () {
                        // Navigate to booth information page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const bagPage()),
                        );
                      },
                    ),
                    ActionCard(
                      icon: Icons.badge_rounded,
                      title: 'Voter \'s Pledge',
                      onTap: () {
                        // Navigate to booth information page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const bagPage()),
                        );
                      },
                    ),
                  ],
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 30,
                  childAspectRatio: 1.2,
                ),
                // SizedBox(height: 20),
                // BoothCard(
                //   boothName: 'Booth 1',
                //   location: 'Example Location 1',
                //   status: 'Open',
                //   onTap: () {
                //     // Handle booth card onTap logic
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ActionCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: Offset(0, 2),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              child: Icon(
                icon,
                size: 52,
                color: Colors.blue.shade600,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
