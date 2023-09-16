import 'package:angadi/Screens/home.dart';
import 'package:angadi/Screens/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
    if (isLoggedIn) {
      // User is logged in, navigate to HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // User is not logged in, navigate to LoginPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top section with image taking 50% of the available width
          Expanded(
            flex: 2, // Adjust the flex value as needed
            child: Row(
              children: [
                Expanded(
                  flex: 2, // Left 25%
                  child: Container(),
                ),
                Expanded(
                  flex: 6, // Image takes 50%
                  child: Image.asset(
                    'assets/icon.png', // Replace with your image asset path
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  flex: 2, // Right 25%
                  child: Container(),
                ),
              ],
            ),
          ),
          // Bottom section with text
          Expanded(
            flex: 1, // Adjust the flex value as needed
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'FROM',
                      style: TextStyle(
                        color: Colors.grey, // Grey color for "from"
                        fontFamily: 'ProductSans', // Use the custom font family
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'SS Team',
                      style: TextStyle(
                        color: Color(0xFF2A36EC), // Blue color for "SS Team"
                        fontFamily: 'ProductSans', // Use the custom font family
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
