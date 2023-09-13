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
  Color container1colour =
      Colors.grey[800] ?? Colors.grey; // Use null-aware operator
  String inputText = '';
  void toggleDarkMode() {
    setState(() {
      darkMode = !darkMode;
      container1colour = darkMode
          ? Colors.grey[800] ?? Colors.grey
          : Colors.grey[200] ?? Colors.grey;
    });
  }

  void handleButtonPress(String value) {
    setState(() {
      if (value == '=') {
        // Perform calculation when '=' is pressed (you can implement this logic)
      } else if (value == 'C') {
        // Clear the input when 'C' is pressed
        inputText = '';
      } else {
        // Append the button value to the input text
        inputText += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: darkMode ? Brightness.dark : Brightness.light,
          colorSchemeSeed: const Color(0xff6750a4),
          appBarTheme: AppBarTheme(
            backgroundColor: container1colour, // Set app bar color here
          ),
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
                toggleDarkMode();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: screenWidth * (100 / 100),
                height: screenHeight * (30 / 100),
                // color: Colors.grey[800], // Dark grey

                color: container1colour,
                child: TextField(
                  readOnly: true,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 54.0),
                  controller: TextEditingController(text: inputText),
                ),
              ),
              Container(
                width: screenWidth * (100 / 100),
                height: screenHeight * (60 / 100),
                child: Column(
                  children: [
                    // Row 1
                    SizedBox(height: screenWidth * (10 / 100)),
                    Row(
                      children: [
                        CalculatorButton('7', handleButtonPress),
                        CalculatorButton('8', handleButtonPress),
                        CalculatorButton('9', handleButtonPress),
                        CalculatorButton('/', handleButtonPress),
                      ],
                    ),
                    // Row 2
                    Row(
                      children: [
                        CalculatorButton('4', handleButtonPress),
                        CalculatorButton('5', handleButtonPress),
                        CalculatorButton('6', handleButtonPress),
                        CalculatorButton('*', handleButtonPress),
                      ],
                    ),
                    // Row 3
                    Row(
                      children: [
                        CalculatorButton('1', handleButtonPress),
                        CalculatorButton('2', handleButtonPress),
                        CalculatorButton('3', handleButtonPress),
                        CalculatorButton('-', handleButtonPress),
                      ],
                    ),
                    // Row 4
                    Row(
                      children: [
                        CalculatorButton('C', handleButtonPress),
                        CalculatorButton('0', handleButtonPress),
                        CalculatorButton('=', handleButtonPress),
                        CalculatorButton('+', handleButtonPress),
                      ],
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

class CalculatorButton extends StatelessWidget {
  final String text;
  final Function(String) onPressed;

  CalculatorButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10.0), // Add some margin for spacing
        child: ElevatedButton(
          onPressed: () {
            onPressed(text);
          },
          style: ElevatedButton.styleFrom(
            // primary: Colors.grey[300], // Button background color

            minimumSize: Size.fromHeight(80.0), // Button height
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0), // Button border radius
            ),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 32.0), // Larger text size
          ),
        ),
      ),
    );
  }
}

//
// class CalculatorButton extends StatelessWidget {
//   final String text;
//   final Function(String) onPressed;
//
//   CalculatorButton(this.text, this.onPressed);
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ElevatedButton(
//         onPressed: () {
//           onPressed(text);
//         },
//         child: Text(
//           text,
//           style: TextStyle(fontSize: 24.0),
//         ),
//       ),
//     );
//   }
// }
