import 'package:flutter/material.dart';
import 'package:merdeka_app/list_screen.dart';
import 'package:merdeka_app/login_screen.dart';
import 'package:merdeka_app/tabbar_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {

  int currentIndex = 0;
  List<Widget> screen = [
    ListScreen(),
    LoginScreen(),
    TabBarScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: Theme(
        // untuk menghilangkan efek ripple / splash ketika diklik
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          currentIndex: currentIndex,
          onTap: (index){
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Beranda"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Beranda"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Beranda"
            ),
          ],
        ),
      ),
    );
  }
}
