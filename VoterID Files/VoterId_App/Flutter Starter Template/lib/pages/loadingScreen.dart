import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:startertemplate/pages/login_page.dart';
import 'package:startertemplate/pages/welcomePage.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    _animationController.repeat();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFFF9933).withOpacity(0.9), // Saffron with opacity
              const Color(0xFFFFFFFF).withOpacity(0.8), // White with opacity
              const Color(0xFF128807).withOpacity(0.8), // Green with opacity
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.4, 0.6, 0.8],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 130,
              ),
              Image.asset(
                'assets/images/votepic.jpg',
                width: 200,
                height: 180,
              ),
              const SizedBox(width: 2),
              Column(
                children: [
                  const SizedBox(height: 4),
                  const Text(
                    'भारत निर्वाचन आयोग',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Election Commission of India',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 260),
              Shimmer.fromColors(
                baseColor: Colors.blueGrey,
                highlightColor: Colors.white,
                child: Container(
                  width: 180,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
