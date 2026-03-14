import 'package:flutter/material.dart';
import '../models/destination.dart';
import 'package:easy_localization/easy_localization.dart';

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
      backgroundColor: const Color(0xffEEF1FF),

      body: SingleChildScrollView(
        child: Column(
          children: [
            /// HEADER IMAGE
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

            const SizedBox(height: 15),

            /// GALLERY
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
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

            /// MAIN CONTENT
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE
                  Text(
                    widget.destination.title.tr(),
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// LOCATION + RATING
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.green,
                        size: 18,
                      ),

                      const SizedBox(width: 4),

                      Text(widget.destination.location.tr()),

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

                      Text("+12k visitors"),
                    ],
                  ),

                  const SizedBox(height: 25),

                  /// TRAVEL INFO
                  Text(
                    "travel_info".tr(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      _infoItem(
                        Icons.access_time,
                        "open_time".tr(),
                        widget.destination.openTime,
                      ),

                      _infoItem(
                        Icons.map,
                        "distance".tr(),
                        widget.destination.distance,
                      ),

                      _infoItem(
                        Icons.park,
                        "type".tr(),
                        widget.destination.type,
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  /// DESCRIPTION
                  Text(
                    "description".tr(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    widget.destination.description.tr(),
                    style: const TextStyle(
                      color: Colors.grey,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// REVIEW
                  Text(
                    "review".tr(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.orange),
                      Icon(Icons.star, color: Colors.orange),
                      Icon(Icons.star, color: Colors.orange),
                      Icon(Icons.star, color: Colors.orange),
                      Icon(
                        Icons.star_half,
                        color: Colors.orange,
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Text(
                    widget.destination.review.tr(),
                    style: const TextStyle(
                      color: Colors.grey,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// TRAVEL TIP
                  Text(
                    "travel_tip".tr(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xffEEF1FF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      widget.destination.travelTip.tr(),
                      style: const TextStyle(height: 1.5),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

Widget _smallImage(String img) {
  return Container(
    height: 70,
    width: 90,
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(img, fit: BoxFit.cover),
    ),
  );
}

Widget _infoItem(IconData icon, String title, String value) {
  return Column(
    children: [
      CircleAvatar(
        radius: 22,
        backgroundColor: const Color(0xffEEF1FF),
        child: Icon(icon, color: Colors.black),
      ),

      const SizedBox(height: 6),

      Text(
        title,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),

      const SizedBox(height: 3),

      Text(
        value,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ],
  );
}
