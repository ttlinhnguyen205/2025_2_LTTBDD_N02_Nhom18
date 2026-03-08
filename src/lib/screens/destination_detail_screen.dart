import 'package:flutter/material.dart';
import '../models/destination.dart';

class DestinationDetailScreen extends StatelessWidget {
  final Destination destination;

  const DestinationDetailScreen({
    super.key,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(destination.title)),
      body: Column(
        children: [
          Image.asset(
            destination.image,
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destination.title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 5),
                    Text(destination.location),
                  ],
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange),
                    const SizedBox(width: 5),
                    Text(destination.rating.toString()),
                  ],
                ),

                const SizedBox(height: 20),

                const Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  destination.description,
                  style: const TextStyle(
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
