import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

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
            Text(
              "guest_user".tr(),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            /// MESSAGE
            Text(
              "guest_message".tr(),
              style: const TextStyle(color: Colors.grey),
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

                        title: Text("language".tr()),

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

                            if (value == "English") {
                              context.setLocale(
                                const Locale('en'),
                              );
                            } else {
                              context.setLocale(
                                const Locale('vi'),
                              );
                            }
                          },
                        ),
                      ),
                    ),

                    /// MENU ITEMS
                    _MenuItem(
                      Icons.favorite,
                      "saved_places".tr(),
                    ),
                    _MenuItem(Icons.group, "about_group".tr()),
                    _MenuItem(Icons.settings, "settings".tr()),
                    _MenuItem(Icons.info, "about_app".tr()),
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
