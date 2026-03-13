import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../models/destination.dart';
import '../data/destination_data.dart';
import 'home_screen.dart';
import 'destination_detail_screen.dart';

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
      backgroundColor: const Color(0xffF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme:
            const IconThemeData(color: Colors.black),
        title: Text(
          "search_destination".tr(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: TextField(
                controller: controller,
                onChanged: search,
                decoration: InputDecoration(
                  hintText:
                      "search_destination_hint".tr(),
                  prefixIcon: const Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "popular_destinations".tr(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: filteredList.isEmpty
                  ? Center(
                      child: Text(
                        "no_results".tr(),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder:
                          (context, index) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(
                            bottom: 20,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          DestinationDetailScreen(
                                    destination:
                                        filteredList[
                                            index],
                                  ),
                                ),
                              );
                            },
                            child: DestinationCard(
                              destination:
                                  filteredList[
                                      index],
                            ),
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

