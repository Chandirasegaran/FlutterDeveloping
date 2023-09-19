import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Vegetable {
  final String id;
  final String imageUrl;
  final String price;
  final bool stock;
  final String vegetableName;

  Vegetable({
    required this.id,
    required this.imageUrl,
    required this.price,
    required this.stock,
    required this.vegetableName,
  });
}

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  bool isSearchVisible = false;
  TextEditingController searchController = TextEditingController();
  List<Vegetable> vegetables = [];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchVegetables();
  }

  void _fetchVegetables() async {
    try {
      final QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('veg').get();

      final List<Vegetable> fetchedVegetables = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Vegetable(
          id: doc.id,
          imageUrl: data['imageUrl'],
          price: data['price'],
          stock: data['stock'],
          vegetableName: data['vegetableName'],
        );
      }).toList();

      setState(() {
        vegetables = fetchedVegetables;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset(
          'assets/icon.png',
          fit: BoxFit.contain,
        ),
        title: isSearchVisible
            ? AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: isSearchVisible ? 400 : 0,
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search...',
                    border: InputBorder.none,
                  ),
                ),
              )
            : Text("Angadi"),
        actions: [
          IconButton(
            icon: Icon(isSearchVisible ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                isSearchVisible = !isSearchVisible;
                if (!isSearchVisible) {
                  searchController.clear();
                }
              });
            },
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Theme.of(context).primaryColor,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: currentPageIndex == 0
          ? ListView.builder(
              itemCount: vegetables.length,
              itemBuilder: (context, index) {
                final vegetable = vegetables[index];
                return ListTile(
                  leading: Image.network(vegetable.imageUrl),
                  title: Text(vegetable.vegetableName),
                  subtitle: Text(vegetable.price),
                );
              },
            )
          : currentPageIndex == 1
              ? Container(
                  alignment: Alignment.center,
                  child: Text('Cart Page Content'),
                )
              : Container(
                  alignment: Alignment.center,
                  child: Text('Profile Page Content'),
                ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// void main() => runApp(const NavigationBarApp());
//
// class NavigationBarApp extends StatelessWidget {
//   const NavigationBarApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: HomeScreen());
//   }
// }
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int currentPageIndex = 0;
//   bool isSearchVisible = false; // Track if the search box is visible
//   TextEditingController searchController = TextEditingController();
//
//   @override
//   void dispose() {
//     searchController.dispose(); // Dispose of the controller when not needed
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white, // Set background color to white
//         leading: Image.asset(
//           'assets/icon.png',
//           // height: 20,
//           fit: BoxFit.contain,
//         ), // Cart icon
//         title: isSearchVisible
//             ? AnimatedContainer(
//                 duration: Duration(milliseconds: 300), // Animation duration
//                 width: isSearchVisible ? 400 : 0, // Change width
//                 child: TextField(
//                   controller: searchController,
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.search),
//                     hintText: 'Search...',
//                     border: InputBorder.none,
//                   ),
//                 ),
//               )
//             : Text("Angadi"), // Show "Angadi" text or search field
//         actions: [
//           IconButton(
//             icon: Icon(isSearchVisible
//                 ? Icons.close
//                 : Icons.search), // Change icon based on visibility
//             onPressed: () {
//               setState(() {
//                 isSearchVisible = !isSearchVisible; // Toggle search visibility
//                 if (!isSearchVisible) {
//                   // Clear search text when closing search box
//                   searchController.clear();
//                 }
//               });
//             },
//           ),
//         ],
//       ),
//       bottomNavigationBar: NavigationBar(
//         onDestinationSelected: (int index) {
//           setState(() {
//             currentPageIndex = index;
//           });
//         },
//         indicatorColor: Theme.of(context).primaryColor,
//         selectedIndex: currentPageIndex,
//         destinations: const <Widget>[
//           NavigationDestination(
//             selectedIcon: Icon(Icons.home),
//             icon: Icon(Icons.home_outlined),
//             label: 'Home',
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.shopping_cart),
//             label: 'Cart',
//           ),
//           NavigationDestination(
//             selectedIcon: Icon(Icons.person),
//             icon: Icon(Icons.person_outline),
//             label: 'Profile',
//           ),
//         ],
//       ),
//       body: <Widget>[
//         Container(
//           // color: Theme.of(context).primaryColor,
//           alignment: Alignment.center,
//           child: const Text('Home Page Content'),
//         ),
//         Container(
//           // color: Theme.of(context).primaryColor,
//           alignment: Alignment.center,
//           child: const Text('Cart Page Content'),
//         ),
//         Container(
//           // color: Theme.of(context).primaryColor,
//           alignment: Alignment.center,
//           child: const Text('Profile Page Content'),
//         ),
//       ][currentPageIndex],
//     );
//   }
// }
