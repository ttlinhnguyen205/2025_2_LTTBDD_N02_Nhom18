import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../data/destination_data.dart';
import 'home_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();

  List<Destination> filteredList = destinations;

  void search(String keyword) {
    setState(() {
      filteredList = destinations.where((item) {
        return item.title
                .toLowerCase()
                .contains(keyword.toLowerCase()) ||
            item.location
                .toLowerCase()
                .contains(keyword.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              onChanged: search,
              decoration: const InputDecoration(
                hintText: "Search destination...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: filteredList.isEmpty
                  ? const Center(
                      child: Text("No results found"),
                    )
                  : ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(bottom: 15),
                          child: DestinationCard(
                            destination:
                                filteredList[index],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}