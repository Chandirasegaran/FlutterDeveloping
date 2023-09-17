import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Add a reference to FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to handle user logout
  Future<void> _logout() async {
    try {
      await _auth.signOut();
      Navigator.of(context)
          .pop(); // Navigate back to the previous screen (login or splash)
    } catch (e) {
      print('Logout error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Angadi"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: Column(
        children: [
          Text("Segar"),
          FloatingActionButton(
            onPressed: () {},
          ),
          ElevatedButton(
            onPressed:
                _logout, // Call the _logout function when the button is pressed
            child: Text("Logout"), // Change button label to "Logout"
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Angadi"),
//         ),
//         body: Column(
//           children: [Text("Segar"), FloatingActionButton(onPressed: () {} ),
//           ElevatedButton(
//             onPressed: () {},
//             child: Text("Your Button Label"), // Add your button label here
//           ),],
//         ));
//   }
// }
