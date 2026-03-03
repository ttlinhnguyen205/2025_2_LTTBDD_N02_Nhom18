import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _buildBottomNav(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 10),

              /// HEADER
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu, size: 28),
                  Row(
                    children: [
                      const Text("Guest"),
                      const SizedBox(width: 10),
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

              const SizedBox(height: 20),

              /// TITLE
              const Text(
                "Hi Guest,",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 5),
              const Text(
                "Where do you\nwanna go?",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),

              const SizedBox(height: 20),

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
                        border: Border.all(
                          color: Colors.grey.shade400,
                        ),
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
                      border: Border.all(
                        color: Colors.grey.shade400,
                      ),
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

              /// CARD DESTINATION
              const _DestinationCard(
                image: "imgs/pho_co_hoi_an.jpg",
                title: "Phố cổ Hội An",
                rating: "4.9",
                location: "Quảng Nam, Việt Nam",
              ),
              const SizedBox(height: 10),

              const _DestinationCard(
                image: "imgs/my_khe_beach.jpg",
                title: "Bãi Biển Mỹ Khê",
                rating: "4.9",
                location: "Đà Nẵng, Việt Nam",
              ),
              const SizedBox(height: 10),

              const _DestinationCard(
                image: "imgs/son_tra.jpg",
                title: "Bán đảo Sơn Trà",
                rating: "4.9",
                location: "Đà Nẵng, Việt Nam",
              ),
              const SizedBox(height: 10),

              const _DestinationCard(
                image: "imgs/bali.jpg",
                title: "Bali",
                rating: "4.9",
                location: "Bali, Indonesia",
              ),
              const SizedBox(height: 10),

              const _DestinationCard(
                image: "imgs/gardens_by_the_bay.jpg",
                title: "Gardens By The Bay",
                rating: "4.8",
                location: "Singapore",
              ),
              const SizedBox(height: 10),

              const _DestinationCard(
                image: "imgs/night_safari.jpg",
                title: "Night Safari",
                rating: "4.7",
                location: "Singapore",
              ),
              const SizedBox(height: 10),

              const _DestinationCard(
                image: "imgs/river_wonders.jpg",
                title: "River Wonders",
                rating: "4.6",
                location: "Singapore",
              ),
              const SizedBox(height: 10),

              const _DestinationCard(
                image: "imgs/pulau_ubin.jpg",
                title: "Pulau Ubin",
                rating: "4.6",
                location: "Singapore",
              ),
              const SizedBox(height: 10),

              const _DestinationCard(
                image: "imgs/merlion_park.jpg",
                title: "Merlion Park",
                rating: "4.7",
                location: "Singapore",
              ),
              const SizedBox(height: 10),

              const _DestinationCard(
                image: "imgs/namsan_tower.jpg",
                title: "N Seoul Tower (Namsan Tower)",
                rating: "4.7",
                location: "Seoul, South Korea",
              ),
              const SizedBox(height: 10),

              const _DestinationCard(
                image: "imgs/cheonggyecheon.jpg",
                title: "Cheonggyecheon Stream",
                rating: "4.6",
                location: "Seoul, South Korea",
              ),
              const SizedBox(height: 10),

              const _DestinationCard(
                image: "imgs/haeundae_beach.jpg",
                title: "Haeundae Beach",
                rating: "4.7",
                location: "Busan, South Korea",
              ),
              const SizedBox(height: 10),

              const _DestinationCard(
                image: "imgs/bukchon_hanok.jpg",
                title: "Bukchon Hanok Village",
                rating: "4.6",
                location: "Seoul, South Korea",
              ),
              const SizedBox(height: 10),

              const _DestinationCard(
                image: "imgs/mount_fuji.jpg",
                title: "Mount Fuji",
                rating: "4.8",
                location: "Honshu, Japan",
              ),
              const SizedBox(height: 10),

              const _DestinationCard(
                image: "imgs/tokyo_tower.jpg",
                title: "Tokyo Tower",
                rating: "4.6",
                location: "Tokyo, Japan",
              ),
              const SizedBox(height: 10),

              const _DestinationCard(
                image: "imgs/kinkakuji.jpg",
                title: "Kinkaku-ji (Golden Pavilion)",
                rating: "4.8",
                location: "Kyoto, Japan",
              ),
              const SizedBox(height: 10),

              const _DestinationCard(
                image: "imgs/island.jpg",
                title: "Lush Islands",
                rating: "4.5",
                location: "Bali, Indonesia",
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
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

  /// BOTTOM NAV
  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: "Chat",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: "Schedule",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "Saved",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}

/// ================= DESTINATION CARD =================
class _DestinationCard extends StatefulWidget {
  final String image;
  final String title;
  final String rating;
  final String location;

  const _DestinationCard({
    required this.image,
    required this.title,
    required this.rating,
    required this.location,
  });

  @override
  State<_DestinationCard> createState() =>
      _DestinationCardState();
}

class _DestinationCardState extends State<_DestinationCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 220,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: AssetImage(widget.image),
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
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0.2),
              Colors.transparent,
            ],
          ),
        ),
        child: Stack(
          children: [
            /// ❤️ HEART BUTTON (top right)
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: isFavorite
                        ? Colors.red
                        : Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),

            /// TEXT CONTENT (bottom)
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
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
                      color: Colors.white70,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        widget.location,
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
                      widget.rating,
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
