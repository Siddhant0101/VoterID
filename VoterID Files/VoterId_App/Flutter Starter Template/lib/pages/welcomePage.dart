import 'package:flutter/material.dart';
import 'package:startertemplate/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set your desired primary color
      ),
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  final List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      title: 'Welcome to Voter ID App',
      description: 'Your one-stop solution for all things election-related.',
      imagePath: 'assets/images/namaste.png',
      backgroundColor: Colors.white,
    ),
    OnboardingItem(
      title: 'Find Your Polling Booth',
      description: 'Easily locate your designated polling booth.',
      imagePath: 'assets/images/location.png',
      backgroundColor: Colors.white,
    ),
    OnboardingItem(
      title: 'Check Your Candidates',
      description: 'Explore and learn about the candidates in your area.',
      imagePath: 'assets/images/candidate.png',
      backgroundColor: Colors.white,
    ),
    OnboardingItem(
      title: 'Access Convenient Services',
      description: 'Get access to a range of convenient election services.',
      imagePath: 'assets/images/services.png',
      backgroundColor: Colors.white,
    ),
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingItems.length,
            itemBuilder: (context, index) {
              return OnboardingSlide(onboardingItems[index]);
            },
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
          Positioned(
            left: 36,
            right: 14,
            bottom: 30, // Shift the page dots to the bottom
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageDots(),
            ),
          ),
          Positioned(
            left: 26,
            right: 16,
            bottom: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage > 0) {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors
                        .grey[300], // Set your desired previous button color
                  ),
                  child: Text(
                    'Previous',
                    style: TextStyle(
                        color: Colors.black), // Set your desired text color
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage < onboardingItems.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => LoginPage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context)
                        .primaryColor, // Use the primary color defined in the theme
                  ),
                  child: Text(
                    _currentPage < onboardingItems.length - 1
                        ? 'Next'
                        : 'Get Started',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageDots() {
    List<Widget> dots = [];
    for (int i = 0; i < onboardingItems.length; i++) {
      dots.add(
        Container(
          width: 20,
          height: 10,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == i
                ? Theme.of(context).primaryColor
                : Colors.grey.shade400,
          ),
        ),
      );
    }
    return dots;
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final String imagePath;
  final Color backgroundColor;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.backgroundColor,
  });
}

class OnboardingSlide extends StatelessWidget {
  final OnboardingItem item;

  OnboardingSlide(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: item.backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              item.imagePath,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 35.0),
          Text(
            item.title,
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 25.0),
          Text(
            item.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.blueGrey,
            ),
          ),
          SizedBox(
            height: 35,
          )
        ],
      ),
    );
  }
}
