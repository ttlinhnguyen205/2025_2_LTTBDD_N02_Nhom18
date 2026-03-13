import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

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

                child: Column(
                  children: [
                    const Icon(
                      Icons.groups_rounded,
                      color: Colors.white,
                      size: 40,
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "group_name".tr(),
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      "project_title".tr(),
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      "member_count".tr(),
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// TEAM TITLE
              Row(
                children: [
                  const Icon(
                    Icons.people,
                    size: 22,
                    color: primary,
                  ),
                  const SizedBox(width: 8),

                  Text(
                    "team_members".tr(),
                    style: const TextStyle(
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
              Row(
                children: [
                  const Icon(Icons.info_outline, color: primary),
                  const SizedBox(width: 8),

                  Text(
                    "about_project".tr(),
                    style: const TextStyle(
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

                child: Text(
                  "project_description".tr(),
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: text,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// INSTRUCTOR
              Row(
                children: [
                  const Icon(Icons.school, color: primary),
                  const SizedBox(width: 8),

                  Text(
                    "instructor".tr(),
                    style: const TextStyle(
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

                child: Row(
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
                          "ThS. NCS. Nguyễn Xuân Quế",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: text,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "instructor_role".tr(),
                          style: const TextStyle(
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

            child: Text(
              "role".tr(),
              style: const TextStyle(
                fontSize: 11,
                color: primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
