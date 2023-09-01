import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class myRoOfficePage extends StatefulWidget {
  const myRoOfficePage({Key? key}) : super(key: key);

  @override
  _myRoOfficePageState createState() => _myRoOfficePageState();
}

class _myRoOfficePageState extends State<myRoOfficePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _voterID;
  bool _showBoothsInfo = false;
  final List<Booth> _booths = [
    Booth(
      name: 'Your RO Office',
      address: 'KVS RO BHOPAL',
      latitude: 23.243824079520305,
      longitude: 77.42770113876986,
    ),
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _showBoothsInfo = true;
      });
    }
  }

  void _openGoogleMaps(
      double latitude, double longitude, String address) async {
    final mapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(mapsUrl)) {
      await launch(mapsUrl);
    } else {
      throw 'Could not launch $mapsUrl';
    }
  }

  void _makePhoneCall(String phoneNumber) async {
    final phoneUrl = 'tel:$phoneNumber';
    if (await canLaunch(phoneUrl)) {
      await launch(phoneUrl);
    } else {
      throw 'Could not launch $phoneUrl';
    }
  }

  List<String> buttonNames = [
    'बैरसिया ',
    'दक्षिण-पश्चिम',
    'मध्य',
    'उत्तर',
    'गोविंदपुरा',
    'हुजूर',
    'नरेला'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('My RO Office Information'),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(26),
                  child: _showBoothsInfo
                      ? _buildBoothsInfo()
                      : _buildVoterIDForm(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVoterIDForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Enter Voter ID',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Voter ID',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your voter ID';
              }
              return null;
            },
            onSaved: (value) {
              _voterID = value;
            },
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Submit'),
          ),
          const SizedBox(height: 50),
          const Text(
            '    Bhopal RO Office',
            style: TextStyle(
              fontSize: 34,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 7,
            runSpacing: 26,
            children: List.generate(7, (index) {
              final buttonNumber = index + 149;
              final buttonName = buttonNames[index];
              return SizedBox(
                width: 96, // Adjust the width of the button card
                height: 108, // Adjust the height of the button card
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _showBoothsInfo = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.2),
                          blurRadius: 6.0,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_forward, // Add a navigation icon
                          size: 30, // Increase the icon size
                          color: Colors.blue, // Set the icon color
                        ),
                        SizedBox(
                            height:
                                8), // Adjust the spacing between the icon and number
                        Text(
                          buttonNumber.toString(),
                          style: TextStyle(
                            fontSize: 20, // Increase the number font size
                            fontWeight: FontWeight.bold, // Make the number bold
                          ),
                        ),
                        SizedBox(
                            height:
                                7), // Adjust the spacing between the number and name
                        Text(
                          buttonName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14, // Increase the name font size
                            fontWeight: FontWeight.bold, // Make the name bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildBoothsInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '     Your RO Office',
          style: TextStyle(
            fontSize: 35,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 56),
        ListView.builder(
          shrinkWrap: true,
          itemCount: _booths.length,
          itemBuilder: (context, index) {
            return BoothCard(
              booth: _booths[index],
              onNavigate: () {
                _openGoogleMaps(
                  _booths[index].latitude,
                  _booths[index].longitude,
                  _booths[index].address,
                );
              },
            );
          },
        ),
        const SizedBox(height: 25),
        // Text(
        //   'Contacts',
        //   style: TextStyle(
        //     fontSize: 30,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        // const SizedBox(height: 18),
        // ContactCard(
        //   title: 'BRO',
        //   name: 'Dummy Name',
        //   phoneNumber: '+911234567890',
        //   onCall: _makePhoneCall,
        // ),
        // ContactCard(
        //   title: 'ERO',
        //   name: 'Dummy Name',
        //   phoneNumber: '+911234567890',
        //   onCall: _makePhoneCall,
        // ),
        // ContactCard(
        //   title: 'DEO',
        //   name: 'Dummy Name',
        //   phoneNumber: '+911234567890',
        //   onCall: _makePhoneCall,
        // ),
      ],
    );
  }
}

class Booth {
  final String name;
  final String address;
  final double latitude;
  final double longitude;

  Booth({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
  });
}

class BoothCard extends StatelessWidget {
  final Booth booth;
  final VoidCallback onNavigate;

  const BoothCard({Key? key, required this.booth, required this.onNavigate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(26),
      ),
      child: InkWell(
        onTap: onNavigate,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                booth.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 22),
              Text(
                booth.address,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 12),
              // Text(
              //   'Date: ${booth.date}',
              //   style: TextStyle(
              //     fontSize: 16,
              //     color: Colors.grey[600],
              //   ),
              // ),
              // const SizedBox(height: 12),
              // Text(
              //   'Timing: ${booth.timing}',
              //   style: TextStyle(
              //     fontSize: 16,
              //     color: Colors.grey[600],
              //   ),
              // ),
              // const SizedBox(height: 12),
              // const Text(
              //   'Instructions:',
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              const SizedBox(height: 8),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: booth.instructions
              //       .asMap()
              //       .entries
              //       .map(
              //         (entry) => Padding(
              //           padding: const EdgeInsets.symmetric(vertical: 4.0),
              //           child: Row(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 '${entry.key + 1}.',
              //                 style: const TextStyle(
              //                   fontSize: 14,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //               const SizedBox(width: 8),
              //               Expanded(
              //                 child: Text(
              //                   entry.value,
              //                   style: TextStyle(
              //                     fontSize: 14,
              //                     color: Colors.grey[600],
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       )
              //       .toList(),
              // ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.navigation,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Navigate',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
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

class ContactCard extends StatelessWidget {
  final String title;
  final String name;
  final String phoneNumber;
  final Function(String) onCall;

  const ContactCard({
    Key? key,
    required this.title,
    required this.name,
    required this.phoneNumber,
    required this.onCall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: InkWell(
        onTap: () => _makePhoneCall(),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Name:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Mobile Number:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                phoneNumber,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.phone,
                    color: Colors.green,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Call',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
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

  void _makePhoneCall() {
    onCall(phoneNumber);
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Booth Info Page',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: const myRoOfficePage(),
  ));
}
