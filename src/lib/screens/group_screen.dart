import 'package:flutter/material.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  /// APP COLORS
  static const Color primary = Color(0xff1F1A8A);
  static const Color lightBlue = Color(0xffEEF1FF);
  static const Color border = Color(0xffEAEAEA);
  static const Color text = Color(0xff222222);
  static const Color subtitle = Color(0xff888888);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: primary,
                ),

                child: const Column(
                  children: [
                    Icon(
                      Icons.groups_rounded,
                      color: Colors.white,
                      size: 40,
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Group 18",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 6),

                    Text(
                      "Mobile Programming Project",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),

                    SizedBox(height: 6),

                    Text(
                      "2 Members",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// TEAM TITLE
              const Row(
                children: [
                  Icon(Icons.people, size: 22, color: primary),
                  SizedBox(width: 8),

                  Text(
                    "Team Members",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: text,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              /// MEMBER CARDS
              Row(
                children: [
                  Expanded(
                    child: _memberCard(
                      name: "Nguyễn Thị Thùy Linh",
                      id: "23010633",
                      image: "imgs/linh.png",
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: _memberCard(
                      name: "Nguyễn Anh Quân",
                      id: "23010375",
                      image: "imgs/quan.png",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// ABOUT PROJECT
              const Row(
                children: [
                  Icon(Icons.info_outline, color: primary),
                  SizedBox(width: 8),

                  Text(
                    "About Project",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: text,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.shade50,
                  border: Border.all(color: border),
                ),

                child: const Text(
                  "This project is a mobile application built using Flutter. "
                  "It demonstrates UI design, navigation, and mobile app "
                  "development concepts learned in the Mobile Programming course.",

                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: text,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// INSTRUCTOR
              const Row(
                children: [
                  Icon(Icons.school, color: primary),
                  SizedBox(width: 8),

                  Text(
                    "Instructor",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: text,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.shade50,
                  border: Border.all(color: border),
                ),

                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundColor: lightBlue,

                      child: Icon(Icons.school, color: primary),
                    ),

                    SizedBox(width: 14),

                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dr. Nguyễn Xuân Quế",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: text,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "Mobile Programming Lecturer",
                          style: TextStyle(
                            color: subtitle,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  /// MEMBER CARD
  Widget _memberCard({
    required String name,
    required String id,
    required String image,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
        border: Border.all(color: border),

        boxShadow: const [
          BoxShadow(
            blurRadius: 12,
            color: Colors.black12,
            offset: Offset(0, 6),
          ),
        ],
      ),

      child: Column(
        children: [
          CircleAvatar(
            radius: 34,
            backgroundImage: AssetImage(image),
          ),

          const SizedBox(height: 12),

          Text(
            name,
            textAlign: TextAlign.center,

            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: text,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            id,

            style: const TextStyle(
              color: subtitle,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            ),

            decoration: BoxDecoration(
              color: lightBlue,
              borderRadius: BorderRadius.circular(20),
            ),

            child: const Text(
              "UI Design & Flutter Developer",

              style: TextStyle(fontSize: 11, color: primary),
            ),
          ),
        ],
      ),
    );
  }
}
