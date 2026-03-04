import 'package:flutter/material.dart';
import '../data/destination_data.dart';
import '../services/favorite_service.dart';
import '../models/destination.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  List<String> favoriteIds = [];
  List<Destination> savedDestinations = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final ids = await FavoriteService.getFavorites();

    final filtered = destinations
        .where((d) => ids.contains(d.id))
        .toList();

    setState(() {
      favoriteIds = ids;
      savedDestinations = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Destinations"),
      ),
      body: savedDestinations.isEmpty
          ? const Center(
              child: Text(
                "No favorites yet ❤️",
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: savedDestinations.length,
              itemBuilder: (context, index) {
                final item = savedDestinations[index];

                return ListTile(
                  leading: Image.asset(
                    item.image,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item.title),
                  subtitle: Text(item.location),
                  trailing: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                );
              },
            ),
    );
  }
}