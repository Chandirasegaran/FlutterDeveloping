import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool darkMode = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: darkMode ? Brightness.dark : Brightness.light,
            colorSchemeSeed: const Color(0xff6750a4),
            useMaterial3: true),
        home: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.calculate_outlined),
            centerTitle: true,
            title: Text(
              'Calculator',
            ),
            actions: [
              IconButton(
                icon: Icon(darkMode
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined),
                onPressed: () {
                  setState(() {
                    darkMode = !darkMode;
                  });
                },
              )
            ],
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Click Me"),
            ),
          ),
        ));
  }
}
