import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMS Sending App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  String _smsStatus = '';

  void sendSMS() async {
    String phoneNumber = phoneNumberController.text;
    String message = messageController.text;

    try {
      String result =
          await sendSMS(message: message, recipients: [phoneNumber]);
      setState(() {
        _smsStatus = 'SMS sent successfully: $result';
      });
    } catch (error) {
      setState(() {
        _smsStatus = 'Error sending SMS: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SMS Sending App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Enter phone number',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: messageController,
              decoration: InputDecoration(
                labelText: 'Message',
                hintText: 'Enter your message',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: sendSMS,
              child: Text('Send SMS'),
            ),
            SizedBox(height: 16.0),
            Text(_smsStatus, style: TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
