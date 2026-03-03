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

              ///Destination List
              SizedBox(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _CityItem("imgs/hue.jpg", "Đại nội Huế"),
                    _CityItem("imgs/tam_coc.jpg", "Tam Cốc"),
                    _CityItem("imgs/sapa.jpg", "Sa Pa"),
                    _CityItem(
                      "imgs/phu_quoc.jpg",
                      "Đảo Phú Quốc",
                    ),
                    _CityItem("imgs/Abuja.jpg", "Abuja"),
                    _CityItem("imgs/NewYork.jpg", "NewYork"),
                    _CityItem("imgs/Sydney.jpg", "Sydney"),
                    _CityItem("imgs/Toronto.jpg", "Toronto"),
                    _CityItem("imgs/London.jpg", "London"),
                  ],
                ),
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
              ),
              const SizedBox(height: 10),

              const _DestinationCard(
                image: "imgs/my_khe_beach.jpg",
                title: "Bãi Biển Mỹ Khê",
                rating: "4.9",
              ),
              const SizedBox(height: 10),

              const _DestinationCard(
                image: "imgs/island.jpg",
                title: "Lush Islands",
                rating: "4.5",
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

/// ================= CITY ITEM =================
class _CityItem extends StatelessWidget {
  final String image;
  final String name;

  const _CityItem(this.image, this.name);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(image),
          ),
          const SizedBox(height: 5),
          Text(name),
        ],
      ),
    );
  }
}

/// ================= DESTINATION CARD =================
class _DestinationCard extends StatelessWidget {
  final String image;
  final String title;
  final String rating;

  const _DestinationCard({
    required this.image,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: AssetImage(image),
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
              Colors.black.withOpacity(0.6),
              Colors.transparent,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 18,
                ),
                const SizedBox(width: 5),
                Text(
                  rating,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
