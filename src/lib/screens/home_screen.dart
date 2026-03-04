import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../data/destination_data.dart';
import '../services/favorite_service.dart';
import 'search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              children: const [
                Icon(Icons.menu, size: 28),
                Row(
                  children: [
                    Text("Guest"),
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage(
                        "imgs/guest.jpg",
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Hi Guest,",
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 5),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Where do you wanna go?",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                  color: Color.fromARGB(255, 13, 8, 80),
                ),
              ),
            ),
            const SizedBox(height: 10),

            /// SEARCH
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 10),
                        Text(
                          "Search",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: const Icon(Icons.tune),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// FILTER
            Row(
              children: [
                _chip("Popular", true),
                _chip("Lake", false),
                _chip("Beach", false),
                _chip("Mountain", false),
              ],
            ),

            const SizedBox(height: 20),

            /// LIST DESTINATION
            Expanded(
              child: ListView.builder(
                itemCount: destinations.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: DestinationCard(
                      destination: destinations[index],
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

////////////////////////////////////////////////////////
/// DESTINATION CARD
////////////////////////////////////////////////////////

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
    _loadFavorite();
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

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
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
                        item.location,
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

/// FILTER CHIP
Widget _chip(String text, bool selected) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: selected ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          if (selected)
            const BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.white : Colors.grey,
        ),
      ),
    ),
  );
}
