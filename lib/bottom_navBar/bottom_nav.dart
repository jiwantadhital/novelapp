import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:novelapp/main.dart';

class BottomBarApp extends StatefulWidget {
  const BottomBarApp({super.key});

  @override
  State<BottomBarApp> createState() => _BottomBarAppState();
}

class _BottomBarAppState extends State<BottomBarApp> {
int currentIndex = 0;

List pages = [
 Main(),
  Container(
    child: Center(child: Text("search")),
  ),
  Container(
    child: Center(child: Text("setting")),
  ),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        onTap: (value){
          currentIndex = value;
          setState(() {
            
          });
        },
         items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home)),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search)),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings)),
        ],
        ),
    );
  }
}