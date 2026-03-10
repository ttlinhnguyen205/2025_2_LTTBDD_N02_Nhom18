import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() async {
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

  @override
  Widget build(BuildContext context) {
    _loadFavorites();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),

            /// TITLE
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Favorite Places",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// GRID
            Expanded(
              child: favoriteList.isEmpty
                  ? const Center(
                      child: Text(
                        "No favorites yet",
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : GridView.builder(
                      itemCount: favoriteList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 20,
                            childAspectRatio: 0.9,
                          ),
                      itemBuilder: (context, index) {
                        final item = favoriteList[index];

                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              25,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(
                                  alpha: 0.05,
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
                                      height: 160,
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
                                      item.title,
                                      style: const TextStyle(
                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          size: 14,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(width: 4),
                                        Expanded(
                                          child: Text(
                                            item.location,
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
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 12,
                                          color: Colors.orange,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          item.rating,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight:
                                                FontWeight.w600,
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
    );
  }
}
