import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF1FF),

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

            /// NAME
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
              style: TextStyle(color: Colors.grey),
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

                  children: [
                    /// LANGUAGE SWITCH
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xffEAEAEA),
                        ),
                      ),

                      child: ListTile(
                        leading: const Icon(Icons.language),

                        title: const Text("Language"),

                        trailing: DropdownButton<String>(
                          value: selectedLanguage,

                          underline: const SizedBox(),

                          items: const [
                            DropdownMenuItem(
                              value: "English",
                              child: Text("English"),
                            ),

                            DropdownMenuItem(
                              value: "Vietnamese",
                              child: Text("Tiếng Việt"),
                            ),
                          ],

                          onChanged: (value) {
                            setState(() {
                              selectedLanguage = value!;
                            });
                          },
                        ),
                      ),
                    ),

                    const _MenuItem(
                      Icons.favorite,
                      "Saved Places",
                    ),
                    const _MenuItem(Icons.group, "About Group"),
                    const _MenuItem(Icons.settings, "Settings"),
                    const _MenuItem(Icons.info, "About App"),
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
