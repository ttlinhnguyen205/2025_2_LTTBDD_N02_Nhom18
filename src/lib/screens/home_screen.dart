import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../models/destination.dart';
import '../data/destination_data.dart';
import '../services/favorite_service.dart';
import 'search_screen.dart';
import 'destination_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "popular";

  List<Destination> get filteredDestinations {
    if (selectedCategory == "popular") {
      return destinations;
    }

    return destinations
        .where((d) => d.category == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          children: [
            const SizedBox(height: 10),

            /// HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.menu, size: 28),

                Row(
                  children: [
                    Text("guest".tr()),

                    const SizedBox(width: 10),

                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.grey.shade200,
                      child: const Icon(
                        Icons.person,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 15),

            /// GREETING
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "hi_guest".tr(),
                style: const TextStyle(color: Colors.black),
              ),
            ),

            const SizedBox(height: 5),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "where_go".tr(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                  color: Color(0xff1F1A8A),
                ),
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const SearchScreen(),
                        ),
                      );
                    },

                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                      ),

                      child: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "search".tr(),
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Container(
                  height: 50,
                  width: 50,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),

                  child: const Icon(Icons.tune),
                ),
              ],
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 50,

              child: ListView(
                scrollDirection: Axis.horizontal,

                children: [
                  _categoryItem(
                    Icons.star,
                    "popular".tr(),
                    selectedCategory == "popular",
                    () {
                      setState(() {
                        selectedCategory = "popular";
                      });
                    },
                  ),

                  _categoryItem(
                    Icons.water,
                    "lake".tr(),
                    selectedCategory == "lake",
                    () {
                      setState(() {
                        selectedCategory = "lake";
                      });
                    },
                  ),

                  _categoryItem(
                    Icons.beach_access,
                    "beach".tr(),
                    selectedCategory == "beach",
                    () {
                      setState(() {
                        selectedCategory = "beach";
                      });
                    },
                  ),

                  _categoryItem(
                    Icons.terrain,
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
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: filteredDestinations.length,

                itemBuilder: (context, index) {
                  final destination =
                      filteredDestinations[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),

                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DestinationDetailScreen(
                                  destination: destination,
                                ),
                          ),
                        );
                      },

                      child: DestinationCard(
                        destination: destination,
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

class DestinationCard extends StatefulWidget {
  final Destination destination;

  const DestinationCard({super.key, required this.destination});

  @override
  State<DestinationCard> createState() =>
      _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavorite();
  }

  void _loadFavorite() async {
    bool result = await FavoriteService.isFavorite(
      widget.destination.id,
    );

    setState(() {
      isFavorite = result;
    });
  }

  void _toggleFavorite() async {
    await FavoriteService.toggleFavorite(widget.destination.id);

    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.destination;

    return Container(
      height: 220,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),

        image: DecorationImage(
          image: AssetImage(item.image),
          fit: BoxFit.cover,
        ),
      ),

      child: Container(
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),

          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withValues(alpha: 0.7),
              Colors.black.withValues(alpha: 0.2),
              Colors.transparent,
            ],
          ),
        ),

        child: Stack(
          children: [
            /// FAVORITE BUTTON
            Positioned(
              top: 0,
              right: 0,

              child: GestureDetector(
                onTap: _toggleFavorite,

                child: Container(
                  padding: const EdgeInsets.all(8),

                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.4),
                    shape: BoxShape.circle,
                  ),

                  child: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,

                    color: isFavorite
                        ? Colors.red
                        : Colors.white,
                  ),
                ),
              ),
            ),

            /// TEXT INFO
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  item.title.tr(),

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 14,
                    ),

                    const SizedBox(width: 4),

                    Expanded(
                      child: Text(
                        item.location.tr(),

                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),

                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    const SizedBox(width: 8),

                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 16,
                    ),

                    const SizedBox(width: 4),

                    Text(
                      item.rating,

                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _categoryItem(
  IconData icon,
  String text,
  bool selected,
  VoidCallback onTap,
) {
  return Padding(
    padding: const EdgeInsets.only(right: 12),

    child: GestureDetector(
      onTap: onTap,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),

        decoration: BoxDecoration(
          color: selected
              ? const Color.fromARGB(255, 0, 0, 0)
              : Colors.white,

          borderRadius: BorderRadius.circular(30),

          border: Border.all(
            color: selected
                ? const Color.fromARGB(255, 0, 0, 0)
                : Colors.grey.shade300,
          ),

          boxShadow: [
            if (selected)
              BoxShadow(
                color: const Color(
                  0xff1F1A8A,
                ).withValues(alpha: 0.25),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: selected ? Colors.white : Colors.grey,
            ),

            const SizedBox(width: 6),

            Text(
              text,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: selected
                    ? Colors.white
                    : Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
