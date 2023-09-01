import 'package:flutter/material.dart';

class CandidateInfoPage extends StatefulWidget {
  const CandidateInfoPage({super.key});

  @override
  _CandidateInfoPageState createState() => _CandidateInfoPageState();
}

class _CandidateInfoPageState extends State<CandidateInfoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _voterID;
  bool _showCandidatesInfo = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _showCandidatesInfo = true;
      });
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
        title: const Text('My Candidates'),
      ),
      body: SingleChildScrollView(
        child: Container(
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
            padding: const EdgeInsets.all(30),
            child: _showCandidatesInfo
                ? _buildCandidatesInfo()
                : _buildVoterIDForm(),
          ),
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
            'Bhopal Vidhan Sabha',
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
                width: 92, // Adjust the width of the button card
                height: 108, // Adjust the height of the button card
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _showCandidatesInfo = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(26.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.2),
                          blurRadius: 8.0,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height:
                                6), // Adjust the spacing between the icon and number
                        Text(
                          buttonNumber.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue, // Increase the number font size
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

  Widget _buildCandidatesInfo() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CandidateCard(
          candidateName: 'Narendra Modi',
          partyName: 'Bharatiya Janata Party (BJP)',
          education: 'Bachelor\'s Degree',
          experience: 'Prime Minister of India',
          achievements: '• Implemented major economic reforms\n'
              '• Launched Swachh Bharat Abhiyan',
          imagePath: 'assets/images/bjp.png',
        ),
        SizedBox(height: 16),
        CandidateCard(
          candidateName: 'Rahul Gandhi',
          partyName: 'Indian National Congress (INC)',
          education: 'Master\'s Degree',
          experience: 'Member of Parliament',
          achievements: '• Promoted social welfare initiatives\n'
              '• Advocated for rural development',
          imagePath: 'assets/images/congress.jpg',
        ),
      ],
    );
  }
}

class CandidateCard extends StatelessWidget {
  final String candidateName;
  final String partyName;
  final String education;
  final String experience;
  final String achievements;
  final String imagePath;

  const CandidateCard({
    super.key,
    required this.candidateName,
    required this.partyName,
    required this.education,
    required this.experience,
    required this.achievements,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Candidate Name',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        candidateName,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Party Name',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        partyName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Education',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              education,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Experience',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              experience,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Achievements',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              achievements,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'Candidate Info Page',
    home: CandidateInfoPage(),
  ));
}
