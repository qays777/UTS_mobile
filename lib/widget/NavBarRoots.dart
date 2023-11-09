import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_qays/screen/calender.dart';
import 'package:flutter_application_qays/screen/dashboard.dart';
import 'package:flutter_application_qays/screen/profile.dart';

class NavBarRoots extends StatefulWidget {
  const NavBarRoots({super.key});

  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
   int _selectedIndex = 0;
  final _screens = [
    DashBoard(),
    CalendarPage(),
    ProfilePage(),
    
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF4461F2),
          unselectedItemColor: Colors.black26,
          selectedLabelStyle: TextStyle(
            fontWeight:   FontWeight.bold,
            fontSize: 15,
          ),
          currentIndex: _selectedIndex,
          onTap: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label:"Home",
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label:"Calender",
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label:"Profile",
              ),
          ],
        ),
      ),
    );
  }
}