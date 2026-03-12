import 'package:flutter/material.dart';
import '../models/destination.dart';

class DestinationDetailScreen extends StatefulWidget {
  final Destination destination;

  const DestinationDetailScreen({
    super.key,
    required this.destination,
  });

  @override
  State<DestinationDetailScreen> createState() =>
      _DestinationDetailScreenState();
}

class _DestinationDetailScreenState
    extends State<DestinationDetailScreen> {
  late String selectedImage;

  @override
  void initState() {
    super.initState();
    selectedImage = widget.destination.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// MAIN IMAGE
            Stack(
              children: [
                Image.asset(
                  selectedImage,
                  height: 320,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  top: 40,
                  left: 20,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: Colors.black54,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            /// GALLERY
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.destination.gallery.map((img) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedImage = img;
                      });
                    },
                    child: _smallImage(img),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            /// INFO
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE
                  Text(
                    widget.destination.title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.green,
                        size: 18,
                      ),

                      const SizedBox(width: 4),

                      Text(widget.destination.location),

                      const Spacer(),

                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),

                      const SizedBox(width: 4),

                      Text(widget.destination.rating),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// VISITORS
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(
                          "imgs/user1.jpg",
                        ),
                      ),

                      SizedBox(width: 5),

                      CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(
                          "imgs/user2.jpg",
                        ),
                      ),

                      SizedBox(width: 5),

                      CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(
                          "imgs/user3.jpg",
                        ),
                      ),

                      SizedBox(width: 10),

                      Text("+12k"),
                    ],
                  ),

                  const SizedBox(height: 25),

                  /// DESCRIPTION
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    widget.destination.description,
                    style: const TextStyle(
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// REVIEW
                  const Text(
                    "Review",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    widget.destination.review,
                    style: const TextStyle(
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////
/// SMALL IMAGE
////////////////////////////////////////////////////

Widget _smallImage(String img) {
  return Container(
    height: 80,
    width: 120,
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(img, fit: BoxFit.cover),
    ),
  );
}
