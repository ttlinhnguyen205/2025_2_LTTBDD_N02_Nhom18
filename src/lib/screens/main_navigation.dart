import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'home_screen.dart';
import 'saved_screen.dart';
import 'group_screen.dart';
import 'profile_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  /// APP COLORS
  static const Color primary = Color(0xff1F1A8A);
  static const Color subtitle = Color(0xff888888);

  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SavedScreen(),
    GroupScreen(),
    ProfileScreen(),
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

        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: "home".tr(),
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: "saved".tr(),
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.groups),
            label: "group".tr(),
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: "profile".tr(),
          ),
        ],
      ),
    );
  }
}
