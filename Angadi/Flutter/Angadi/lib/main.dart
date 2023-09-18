import 'package:angadi/Screens/home.dart';
import 'package:angadi/Screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MyApp(),
    ),
  );
}

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  // Call this method to update the login state
  void setLoggedIn(bool loggedIn) {
    _isLoggedIn = loggedIn;
    notifyListeners();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode currentThemeMode = ThemeMode.system;

  void toggleThemeMode() {
    setState(() {
      currentThemeMode = currentThemeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => AuthProvider()), // Uncomment this line
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: currentThemeMode,
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.blueAccent,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.blueAccent,
          useMaterial3: true,
        ),
        home: HomeScreen(),
        // home: NavigationExample(),
        // home: SplashScreen(),
      ),
    );
  }
}

// import 'package:angadi/Screens/splash.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   // runApp(const MyApp());
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => AuthProvider(),
//       child: MyApp(),
//     ),
//   );
// }
//
// class AuthProvider with ChangeNotifier {
//   bool _isLoggedIn = false;
//
//   bool get isLoggedIn => _isLoggedIn;
//
//   // Call this method to update the login state
//   void setLoggedIn(bool loggedIn) {
//     _isLoggedIn = loggedIn;
//     notifyListeners();
//   }
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   ThemeMode currentThemeMode = ThemeMode.system;
//
//   void toggleThemeMode() {
//     setState(() {
//       currentThemeMode = currentThemeMode == ThemeMode.light
//           ? ThemeMode.dark
//           : ThemeMode.light;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         // Add your AuthProvider here if you have one
//         // ChangeNotifierProvider(create: (context) => AuthProvider()),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         themeMode: currentThemeMode,
//         theme: ThemeData.light().copyWith(
//           primaryColor: Colors.blueAccent,
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
//           useMaterial3: true,
//         ),
//         darkTheme: ThemeData.dark().copyWith(
//           primaryColor: Colors.blueAccent,
//           useMaterial3: true,
//         ),
//         home: SplashScreen(),
//       ),
//     );
//   }
// }
//
// // import 'package:angadi/Screens/splash.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:flutter/material.dart';
// //
// // // ...
// //
// // void main() async {
// //   // await Firebase.initializeApp(
// //   //   options: DefaultFirebaseOptions.currentPlatform,
// //   // );
// //   WidgetsFlutterBinding
// //       .ensureInitialized(); // Ensure that Flutter is initialized
// //   await Firebase.initializeApp(); // Init
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatefulWidget {
// //   const MyApp({Key? key}) : super(key: key);
// //
// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }
// //
// // class _MyAppState extends State<MyApp> {
// //   ThemeMode currentThemeMode = ThemeMode.system; // Default to light mode
// //
// //   void toggleThemeMode() {
// //     setState(() {
// //       currentThemeMode = currentThemeMode == ThemeMode.light
// //           ? ThemeMode.dark
// //           : ThemeMode.light;
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       themeMode: currentThemeMode, // Use the currentThemeMode
// //       theme: ThemeData.light().copyWith(
// //         // Define the light theme
// //         primaryColor: Colors.blueAccent, // Set primary color for light theme
// //
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
// //         useMaterial3: true, // Enable Material Design 3
// //         // Add other light theme configurations
// //       ),
// //       darkTheme: ThemeData.dark().copyWith(
// //         // Define the dark theme
// //         primaryColor: Colors.blueAccent,
// //         // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
// //         useMaterial3: true, //  // Set primary color for dark theme
// //         // Add other dark theme configurations
// //       ),
// //
// //       home: SplashScreen(),
// //     );
// //   }
// // }
// //
// // //
// // // class _MyAppState extends State<MyApp> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       debugShowCheckedModeBanner: false,
// // //       theme: ThemeData(
// // //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
// // //         useMaterial3: true, // Enable Material Design 3
// // //       ),
// // //       home: SplashScreen(),
// // //     );
// // //   }
// // // }
// //
// // // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++?
// // // import 'package:angadi/Screens/splash.dart';
// // // import 'package:flutter/material.dart';
// //
// // // void main() {
// // //   runApp(const MyApp());
// // // }
// //
// // // class MyApp extends StatelessWidget {
// // //   const MyApp({super.key});
// //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return const MaterialApp(
// // //       debugShowCheckedModeBanner: false,
// // //       home: SplashScreen(),
// // //     );
// // //   }
// // // }
