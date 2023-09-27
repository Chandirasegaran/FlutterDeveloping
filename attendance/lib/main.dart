import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Sheets App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Google Sheets App'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title});

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SheetEntry> entries = [];

  void addEntry(String sheetLink, String subjectName) {
    setState(() {
      entries.add(SheetEntry(sheetLink: sheetLink, subjectName: subjectName));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          final entry = entries[index];
          return ListTile(
            title: Text(entry.subjectName),
            subtitle: Text(entry.sheetLink),
            trailing: IconButton(
              icon: Icon(Icons.qr_code),
              onPressed: () {
                // Open QR code scanner and implement the scanning logic here.
              },
            ),
            onTap: () {
              // Implement the logic to mark present in the Google Sheet here.
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showEntryDialog(context);
        },
        tooltip: 'Add Entry',
        child: Icon(Icons.add),
      ),
    );
  }

  void _showEntryDialog(BuildContext context) {
    String sheetLink = '';
    String subjectName = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Entry'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Google Sheet Link'),
                onChanged: (value) {
                  sheetLink = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Subject Name'),
                onChanged: (value) {
                  subjectName = value;
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                addEntry(sheetLink, subjectName);
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

class SheetEntry {
  final String sheetLink;
  final String subjectName;

  SheetEntry({required this.sheetLink, required this.subjectName});
}

// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'QR Code Scanner',
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   QRViewController? controller;
//   String? qrCodeText;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = QRViewController();
//   }
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('QR Code Scanner'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (qrCodeText != null) Text(qrCodeText!),
//             SizedBox(height: 20),
//             QRView(
//               key: GlobalKey(debugLabel: 'qr_view'),
//               onQRViewCreated: (controller) {
//                 this.controller = controller;
//               },
//               onQRViewFound: (barcode, frame) {
//                 setState(() {
//                   qrCodeText = barcode.code;
//                 });
//
//                 // Display a snackbar with the scanned QR code text
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('Scanned QR code: $qrCodeText'),
//                   ),
//                 );
//               },
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 controller?.scanQR();
//               },
//               child: Text('Scan QR Code'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
