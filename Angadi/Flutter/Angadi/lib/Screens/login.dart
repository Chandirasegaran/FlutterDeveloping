import 'package:angadi/Screens/signup.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Image on top
              SizedBox(
                height: 16,
              ),
              Align(
                // Align the carrot image to the left
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Image.asset(
                    'assets/carrot.png', // Replace with your image asset path
                    height: 200, // Adjust the height as needed
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              // Image.asset(
              //   'assets/carrot.png', // Replace with your image asset path
              //   height: 200, // Adjust the height as needed
              //   fit: BoxFit.contain,
              // ),
              SizedBox(
                height: 36,
              ),
              // Text below image ("Welcome Back")
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Welcome Back !",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ProductSans',
                  ),
                ),
              ),
              // Email and password text boxes
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.mail_outline), //
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      obscureText: true, // To hide the password
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline), //
                      ),
                    ),
                    SizedBox(height: 24),
                    // Sign-up button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your login logic here
                        },
                        child: Text("Sign In"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: Text("Forgot Password?"),
                    ),

                    TextButton(
                      onPressed: () {
                        // Navigate to the Sign-Up screen
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                SignUpPage(), // Replace with your Sign-Up screen
                          ),
                        );
                      },
                      child: Text("Don't have an account? Sign Up"),
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

  // SignUpScreen() {}
}

ForgotPasswordScreen() {}
