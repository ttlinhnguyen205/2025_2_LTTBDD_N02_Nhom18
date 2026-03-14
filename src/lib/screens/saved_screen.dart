import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../models/destination.dart';
import '../data/destination_data.dart';
import '../services/favorite_service.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  List<Destination> favoriteList = [];

  String selectedCategory = "all";

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    List<String> ids = await FavoriteService.getFavorites();

    setState(() {
      favoriteList = destinations
          .where((e) => ids.contains(e.id))
          .toList();
    });
  }

  void _removeFavorite(String id) async {
    await FavoriteService.toggleFavorite(id);
    _loadFavorites();
  }

  List<Destination> get filteredFavorites {
    if (selectedCategory == "all") {
      return favoriteList;
    }

    return favoriteList
        .where((e) => e.category == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF1FF),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              /// TITLE
              Text(
                "favorite_places".tr(),
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              /// SUBTITLE
              Text(
                "saved_destinations".tr(
                  namedArgs: {
                    "count": favoriteList.length.toString(),
                  },
                ),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 20),

              /// FILTER
              Row(
                children: [
                  _chip(
                    "all".tr(),
                    selectedCategory == "all",
                    () {
                      setState(() {
                        selectedCategory = "all";
                      });
                    },
                  ),

                  _chip(
                    "beach".tr(),
                    selectedCategory == "beach",
                    () {
                      setState(() {
                        selectedCategory = "beach";
                      });
                    },
                  ),

                  _chip(
                    "mountain".tr(),
                    selectedCategory == "mountain",
                    () {
                      setState(() {
                        selectedCategory = "mountain";
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// GRID
              Expanded(
                child: filteredFavorites.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.favorite_border,
                              size: 60,
                              color: Colors.grey,
                            ),

                            const SizedBox(height: 10),

                            Text(
                              "no_favorites".tr(),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.only(
                          bottom: 20,
                        ),

                        itemCount: filteredFavorites.length,

                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 20,
                              childAspectRatio: 0.95,
                            ),

                        itemBuilder: (context, index) {
                          final item = filteredFavorites[index];

                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(25),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(
                                    alpha: 0.1,
                                  ),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),

                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              children: [
                                /// IMAGE
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          const BorderRadius.vertical(
                                            top: Radius.circular(
                                              25,
                                            ),
                                          ),

                                      child: Image.asset(
                                        item.image,
                                        height: 170,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                    /// HEART
                                    Positioned(
                                      top: 10,
                                      right: 10,

                                      child: GestureDetector(
                                        onTap: () =>
                                            _removeFavorite(
                                              item.id,
                                            ),

                                        child: Container(
                                          padding:
                                              const EdgeInsets.all(
                                                6,
                                              ),

                                          decoration:
                                              const BoxDecoration(
                                                shape: BoxShape
                                                    .circle,
                                                color:
                                                    Colors.white,
                                              ),

                                          child: const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                /// INFO
                                Padding(
                                  padding: const EdgeInsets.all(
                                    12,
                                  ),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        item.title.tr(),
                                        style: const TextStyle(
                                          fontWeight:
                                              FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 6),

                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            size: 14,
                                            color: Colors.grey,
                                          ),

                                          const SizedBox(
                                            width: 4,
                                          ),

                                          Expanded(
                                            child: Text(
                                              item.location.tr(),

                                              style:
                                                  const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors
                                                        .grey,
                                                  ),

                                              overflow:
                                                  TextOverflow
                                                      .ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 4),

                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 12,
                                            color: Colors.orange,
                                          ),

                                          const SizedBox(
                                            width: 4,
                                          ),

                                          Text(
                                            item.rating,

                                            style:
                                                const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight
                                                          .w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _chip(String text, bool selected, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),

    child: GestureDetector(
      onTap: onTap,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),

        decoration: BoxDecoration(
          color: selected ? Colors.black : Colors.white,

          borderRadius: BorderRadius.circular(20),

          border: Border.all(
            color: selected
                ? Colors.black
                : Colors.grey.shade300,
          ),
        ),

        child: Text(
          text,

          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: selected
                ? Colors.white
                : Colors.grey.shade700,
          ),
        ),
      ),
    ),
  );
}
