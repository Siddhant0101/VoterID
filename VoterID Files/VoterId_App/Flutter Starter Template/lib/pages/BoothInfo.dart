import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BoothInfoPage extends StatefulWidget {
  const BoothInfoPage({Key? key}) : super(key: key);

  @override
  _BoothInfoPageState createState() => _BoothInfoPageState();
}

class _BoothInfoPageState extends State<BoothInfoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _voterID;
  bool _showBoothsInfo = false;
  final List<Booth> _booths = [
    Booth(
      name: 'Vidhan Sabha Elections 2023',
      address: 'Sheel Public School, Gulmohar Colony, Bhopal, Madhya Pradesh',
      latitude: 23.190931595424136,
      longitude: 77.43784884876284,
      timing: '8:00 AM - 6:00 PM',
      date: 'August 5, 2023',
      instructions: [
        'Carry your Voter ID Card.',
        'Follow the instructions.',
        'Maintain social distancing.',
        'Wear a face mask.',
      ],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Booth Information'),
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
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Submit'),
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
          '      Your Polling Booth',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 18),
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
        const SizedBox(height: 20),
        Text(
          '              Contacts',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        ContactCard(
          title: 'BLO',
          name: 'Dummy Name',
          phoneNumber: '+911234567890',
          onCall: _makePhoneCall,
        ),
        ContactCard(
          title: 'ERO',
          name: 'Dummy Name',
          phoneNumber: '+911234567890',
          onCall: _makePhoneCall,
        ),
        ContactCard(
          title: 'DEO',
          name: 'Dummy Name',
          phoneNumber: '+911234567890',
          onCall: _makePhoneCall,
        ),
      ],
    );
  }
}

class Booth {
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final String timing;
  final String date;
  final List<String> instructions;

  Booth({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.timing,
    required this.date,
    required this.instructions,
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
          padding: const EdgeInsets.all(32.0),
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
              Text(
                'Date: ${booth.date}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Timing: ${booth.timing}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Instructions:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: booth.instructions
                    .asMap()
                    .entries
                    .map(
                      (entry) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${entry.key + 1}.',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                entry.value,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
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
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: InkWell(
        onTap: () => _makePhoneCall(),
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
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
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                phoneNumber,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
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
    home: const BoothInfoPage(),
  ));
}
