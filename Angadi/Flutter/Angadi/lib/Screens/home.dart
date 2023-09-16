import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Angadi"),
        ),
        body: Column(
          children: [Text("Segar"), FloatingActionButton(onPressed: () {} ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Your Button Label"), // Add your button label here
          ),],
        ));
  }
}
