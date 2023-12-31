import 'package:angadi/Screens/home.dart';
import 'package:angadi/Screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text;

      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        print('Login Successful');
        navigateToHomeScreen();
        // Login successful, you can navigate to the home screen or perform other actions.
      } else {
        // Handle invalid input or show an error message.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter valid email and password.'),
          ),
        );
      }
    } catch (e) {
      // Handle any errors that occur during sign-in.
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sign-in failed. Please try again later.'),
        ),
      );
    }
  }

  Future<void> _resetPassword() async {
    try {
      final String email = _emailController.text.trim();

      if (email.isNotEmpty) {
        await _auth.sendPasswordResetEmail(email: email);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Password reset email sent. Check your inbox.'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter your email address.'),
          ),
        );
      }
    } catch (e) {
      // Handle any errors that occur during password reset.
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password reset failed. Please try again later.'),
        ),
      );
    }
  }

  void navigateToHomeScreen() {
    // You can replace `HomeScreen()` with your actual home screen widget.
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => HomeScreen(),
    ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Image.asset(
                    'assets/carrot.png',
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: 36,
              ),
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.mail_outline),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _signInWithEmailAndPassword,
                        child: Text("Sign In"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        _resetPassword();
                      },
                      child: Text("Forgot Password?"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
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
}

// import 'package:angadi/Screens/signup.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class LoginPage extends StatelessWidget {
//   Future<void> signInWithEmailAndPassword(String email, String password) async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       // Navigate to the home screen or perform other actions upon successful sign-in.
//     } catch (e) {
//       // Handle sign-in errors (e.g., wrong password, user not found).
//       print('Sign-in error: $e');
//       // You can display an error message to the user if needed.
//     }
//   }
//
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   @override
//   void dispose() {
//     // Dispose of the controllers when the widget is disposed
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               // Image on top
//               SizedBox(
//                 height: 16,
//               ),
//               Align(
//                 // Align the carrot image to the left
//                 alignment: Alignment.centerLeft,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 0.0),
//                   child: Image.asset(
//                     'assets/carrot.png', // Replace with your image asset path
//                     height: 200, // Adjust the height as needed
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//               // Image.asset(
//               //   'assets/carrot.png', // Replace with your image asset path
//               //   height: 200, // Adjust the height as needed
//               //   fit: BoxFit.contain,
//               // ),
//               SizedBox(
//                 height: 36,
//               ),
//               // Text below image ("Welcome Back")
//               Padding(
//                 padding: const EdgeInsets.only(left: 16.0),
//                 child: Text(
//                   "Welcome Back !",
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'ProductSans',
//                   ),
//                 ),
//               ),
//               // Email and password text boxes
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     TextField(
//                       decoration: InputDecoration(
//                         labelText: "Email",
//                         border: OutlineInputBorder(),
//                         prefixIcon: Icon(Icons.mail_outline), //
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     TextField(
//                       obscureText: true, // To hide the password
//                       decoration: InputDecoration(
//                         labelText: "Password",
//                         border: OutlineInputBorder(),
//                         prefixIcon: Icon(Icons.lock_outline), //
//                       ),
//                     ),
//                     SizedBox(height: 24),
//                     // Sign-up button
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Validate and get user-entered email and password
//                           final email = _emailController.text.trim();
//                           final password = _passwordController.text.trim();
//
//                           if (email.isNotEmpty && password.isNotEmpty) {
//                             signInWithEmailAndPassword(email, password);
//                           } else {
//                             // Display an error message or handle empty fields as desired.
//                           }
//                         },
//                         child: Text("Sign In"),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) => ForgotPasswordScreen(),
//                           ),
//                         );
//                       },
//                       child: Text("Forgot Password?"),
//                     ),
//
//                     TextButton(
//                       onPressed: () {
//                         // Navigate to the Sign-Up screen
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 SignUpPage(), // Replace with your Sign-Up screen
//                           ),
//                         );
//                       },
//                       child: Text("Don't have an account? Sign Up"),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // SignUpScreen() {}
// }
//
// ForgotPasswordScreen() {}
