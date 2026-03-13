import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'saved_screen.dart';
import 'group_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  /// APP COLORS
  static const Color primary = Color(0xff1F1A8A);
  static const Color subtitle = Color(0xff888888);
  static const Color border = Color(0xffEAEAEA);

  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SavedScreen(),
    GroupScreen(),
    Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: _screens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        backgroundColor: Colors.white,

        currentIndex: _currentIndex,

        selectedItemColor: primary,

        unselectedItemColor: subtitle,

        selectedFontSize: 12,
        unselectedFontSize: 12,

        elevation: 8,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Saved",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: "Group 18",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
