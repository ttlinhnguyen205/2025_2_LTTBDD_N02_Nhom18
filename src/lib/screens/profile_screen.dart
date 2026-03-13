import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const Color primary = Color(0xff1F1A8A);
  static const Color accent = Color(0xffFF8A00);
  static const Color light = Color(0xffEEF1FF);
  static const Color border = Color(0xffEAEAEA);
  static const Color subtitle = Color(0xff888888);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light,

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),

            /// AVATAR
            const CircleAvatar(
              radius: 45,
              child: Icon(Icons.person, size: 45),
            ),

            const SizedBox(height: 10),

            /// USER NAME
            const Text(
              "Guest User",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "You are browsing as a guest",
              style: TextStyle(color: subtitle),
            ),

            const SizedBox(height: 20),

            /// LOGIN BUTTON
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                // sau này mở màn login
              },
              child: const Text(
                "Login / Sign Up",
                style: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 30),

            /// MENU
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),

                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: const [
                    _MenuItem(Icons.favorite, "Saved Places"),
                    _MenuItem(Icons.group, "About Group"),
                    _MenuItem(Icons.settings, "Settings"),
                    _MenuItem(Icons.info, "About App"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _MenuItem(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xffEAEAEA)),
      ),

      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
