import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FormsPage(),
  ));
}

class FormsPage extends StatelessWidget {
  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Handles the back button press
          },
        ),
        title: Text('Forms'), // Add a title for the app bar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFFF9933).withOpacity(0.7), // Saffron with opacity
              const Color(0xFFFFFFFF).withOpacity(0.7), // White with opacity
              const Color(0xFF128807).withOpacity(0.7), // Green with opacity
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.2, 0.5, 0.9],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    _buildFormCard(
                      title: 'New Registration for General Electors',
                      onFillFormPressed: () {
                        const url = 'https://voters.eci.gov.in/login';
                        launchURL(url);
                      },
                      onwebsitePressed: () {
                        const url = 'https://voters.eci.gov.in/';
                        launchURL(url);
                      },
                      onGuidelinesPressed: () {
                        const url =
                            'https://voters.eci.gov.in/guidelines/Form-6_en.pdf';
                        launchURL(url);
                      },
                    ),
                    SizedBox(height: 16.0),
                    _buildFormCard(
                      title: 'New Registration for Overseas (NRI) Electors',
                      onFillFormPressed: () {
                        const url = 'https://voters.eci.gov.in/login';
                        launchURL(url);
                        // Handle button press
                      },
                      onwebsitePressed: () {
                        const url = 'https://voters.eci.gov.in/';
                        launchURL(url);
                        // Handle button press
                      },
                      onGuidelinesPressed: () {
                        const url =
                            'https://voters.eci.gov.in/guidelines/Form-6a_en.pdf';
                        launchURL(url);
                        // Handle button press
                      },
                    ),
                    SizedBox(height: 16.0),
                    _buildFormCard(
                      title:
                          'Objection for Proposed Inclusion/Deletion of Name',
                      onFillFormPressed: () {
                        const url = 'https://voters.eci.gov.in/login';
                        launchURL(url);
                        // Handle button press
                      },
                      onwebsitePressed: () {
                        const url = 'https://voters.eci.gov.in/';
                        launchURL(url);
                        // Handle button press
                      },
                      onGuidelinesPressed: () {
                        const url =
                            'https://voters.eci.gov.in/guidelines/Form-7_en.pdf';
                        launchURL(url);
                        // Handle button press
                      },
                    ),
                    SizedBox(height: 16.0),
                    _buildFormCard(
                      title: 'Shifting of Residence/Correction of Entries',
                      onFillFormPressed: () {
                        const url = 'https://voters.eci.gov.in/login';
                        launchURL(url);
                        // Handle button press
                      },
                      onwebsitePressed: () {
                        const url = 'https://voters.eci.gov.in/';
                        launchURL(url);
                        // Handle button press
                      },
                      onGuidelinesPressed: () {
                        const url =
                            'https://voters.eci.gov.in/guidelines/Form-8_en.pdf';
                        launchURL(url);
                        // Handle button press
                      },
                    ),
                    // SizedBox(height: 16.0),
                    // _buildFormCard(
                    //   title: 'Replacement of EPIC/Marking of PwD',
                    //   onFillFormPressed: () {
                    //     // Handle button press
                    //   },
                    //   onwebsitePressed: () {
                    //     // Handle button press
                    //   },
                    //   onGuidelinesPressed: () {
                    //     // Handle button press
                    //   },
                    // ),
                    SizedBox(height: 16.0),
                    _buildFormCard(
                      title: 'Aadhaar Collection',
                      onFillFormPressed: () {
                        const url = 'https://voters.eci.gov.in/login';
                        launchURL(url);
                        // Handle button press
                      },
                      onwebsitePressed: () {
                        const url = 'https://voters.eci.gov.in/';
                        launchURL(url);
                        // Handle button press
                      },
                      onGuidelinesPressed: () {
                        const url =
                            'https://voters.eci.gov.in/guidelines/Form-6B_en.pdf';
                        launchURL(url);
                        // Handle button press
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormCard({
    required String title,
    required VoidCallback onFillFormPressed,
    required VoidCallback onwebsitePressed,
    required VoidCallback onGuidelinesPressed,
  }) {
    return Card(
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      color: Colors.white,
      child: InkWell(
        onTap: onFillFormPressed,
        borderRadius: BorderRadius.circular(16.0),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Tap here to access the form',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton.icon(
                      onPressed: onFillFormPressed,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 9.0),
                        minimumSize: Size(120.0, 0.0),
                      ),
                      icon: Icon(
                        Icons.edit,
                        size: 20.0,
                      ),
                      label: Text(
                        'Fill Form',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton.icon(
                      onPressed: onwebsitePressed,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 9.0),
                        minimumSize: Size(120.0, 0.0),
                      ),
                      icon: Icon(
                        Icons.trending_up_sharp,
                        size: 20.0,
                      ),
                      label: Text(
                        'Website',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton.icon(
                      onPressed: onGuidelinesPressed,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        minimumSize: Size(120.0, 0.0),
                      ),
                      icon: Icon(
                        Icons.info,
                        size: 20.0,
                      ),
                      label: Text(
                        'Guidelines',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
