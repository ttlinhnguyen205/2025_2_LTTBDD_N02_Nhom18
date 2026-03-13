import 'package:flutter/material.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 20),

            const Text(
              "Group 8",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            /// GROUP IMAGE
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("imgs/group.jpg"),
            ),

            const SizedBox(height: 20),

            const Text(
              "Travel App Project",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              "Mobile Programming",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            /// MEMBERS
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Members",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            _member("Nguyễn Thị Thùy Linh", "23010633"),
            _member("Nguyễn Anh Quân", "23010375"),

            const SizedBox(height: 30),

            /// INSTRUCTOR
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Instructor",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            const ListTile(
              leading: Icon(Icons.school),
              title: Text("Dr. ABC"),
              subtitle: Text("Mobile Programming"),
            ),

            const Spacer(),

            const Text(
              "University Name",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

Widget _member(String name, String role) {
  return ListTile(
    leading: const CircleAvatar(
      child: Icon(Icons.person),
    ),
    title: Text(name),
    subtitle: Text(role),
  );
}