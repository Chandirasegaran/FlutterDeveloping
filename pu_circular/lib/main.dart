import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
void main() => runApp(CircularApp());

class CircularApp extends StatefulWidget {
  @override
  _CircularAppState createState() => _CircularAppState();
}

class _CircularAppState extends State<CircularApp> {
  List<dynamic> circulars = [];
  bool isLoading = true;
  String sortOption = 'Latest';

  @override
  void initState() {
    super.initState();
    fetchCirculars();
  }

  Future<void> fetchCirculars() async {
    final response = await http.get(Uri.parse('https://pondiuni-notice-api.onrender.com/notice'));
    if (response.statusCode == 200) {
      print('Status OK');
      print(response);
      setState(() {
        circulars = json.decode(response.body);
        circulars = sortCirculars(circulars);
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load circulars');
    }
  }

  List<dynamic> sortCirculars(List<dynamic> list) {
    if (sortOption == 'Latest') {
      return List.from(list)..sort((a, b) => _parseDate(b['date']).compareTo(_parseDate(a['date'])));
    } else {
      return List.from(list)..sort((a, b) => _parseDate(a['date']).compareTo(_parseDate(b['date'])));
    }
  }

  DateTime _parseDate(String dateString) {
    final RegExp regex = RegExp(r'(\d+) (\w+), (\d+)');
    final match = regex.firstMatch(dateString);
    if (match != null) {
      final day = int.parse(match.group(1)!);
      final month = _monthStringToNumber(match.group(2)!);
      final year = int.parse(match.group(3)!);
      return DateTime(year, month, day);
    }
    throw FormatException('Invalid date format');
  }

  int _monthStringToNumber(String month) {
    switch (month.toLowerCase()) {
      case 'january':
        return 1;
      case 'february':
        return 2;
      case 'march':
        return 3;
      case 'april':
        return 4;
      case 'may':
        return 5;
      case 'june':
        return 6;
      case 'july':
        return 7;
      case 'august':
        return 8;
      case 'september':
        return 9;
      case 'october':
        return 10;
      case 'november':
        return 11;
      case 'december':
        return 12;
      default:
        throw FormatException('Invalid month');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PU Circular App',
      debugShowCheckedModeBanner: false,  // Remove the debugging banner

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Circulars'),
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                setState(() {
                  sortOption = value;
                  circulars = sortCirculars(circulars);
                });
              },
              itemBuilder: (BuildContext context) {
                return ['Latest', 'Oldest'].map((option) {
                  return PopupMenuItem(
                    value: option,
                    child: Text(option),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: circulars.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(circulars[index]['heading']),
              subtitle: Text(circulars[index]['date']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CircularDetailScreen(
                      url: circulars[index]['url'],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class CircularDetailScreen extends StatefulWidget {
  final String url;

  CircularDetailScreen({required this.url});

  @override
  _CircularDetailScreenState createState() => _CircularDetailScreenState();
}

class _CircularDetailScreenState extends State<CircularDetailScreen> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circular Detail'),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          if (isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}




// Without loading indicator
// class CircularDetailScreen extends StatelessWidget {
//   final String url;
//
//   CircularDetailScreen({required this.url});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Circular Detail'),
//       ),
//       body: WebView(
//         initialUrl: url,
//         javascriptMode: JavascriptMode.unrestricted,
//       ),
//     );
//   }
// }
