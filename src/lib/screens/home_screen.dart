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

  final PageController _pageController = PageController();
  int currentBanner = 0;

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
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            /// HEADER
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.menu, size: 28),

                        Row(
                          children: [
                            Text("guest".tr()),
                            const SizedBox(width: 10),
                            CircleAvatar(
                              radius: 18,
                              backgroundColor:
                                  Colors.grey.shade200,
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
                  ),

                  const SizedBox(height: 15),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text("hi_guest".tr()),
                        const SizedBox(height: 5),
                        Text(
                          "where_go".tr(),
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1F1A8A),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),

            /// SEARCH BAR (sticky)
            SliverPersistentHeader(
              pinned: true,
              delegate: _SearchBarDelegate(),
            ),

            /// BANNER
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  _bannerSlider(),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            /// CATEGORY (sticky)
            SliverPersistentHeader(
              pinned: true,
              delegate: _CategoryDelegate(child: _categoryBar()),
            ),

            /// DESTINATION LIST
            SliverList(
              delegate: SliverChildBuilderDelegate((
                context,
                index,
              ) {
                final destination = filteredDestinations[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
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
              }, childCount: filteredDestinations.length),
            ),
          ],
        ),
      ),
    );
  }

  /// CATEGORY BAR
  Widget _categoryBar() {
    return SizedBox(
      height: 40,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
    );
  }

  /// BANNER SLIDER
  Widget _bannerSlider() {
    final banners = [
      {
        "image": "imgs/banner1.jpg",
        "title": "Explore the World",
      },
      {"image": "imgs/banner2.jpg", "title": "Find Hidden Gems"},
      {
        "image": "imgs/banner3.jpg",
        "title": "Start Your Journey",
      },
    ];

    return SizedBox(
      height: 180,
      child: PageView.builder(
        controller: _pageController,
        itemCount: banners.length,
        onPageChanged: (index) {
          setState(() {
            currentBanner = index;
          });
        },
        itemBuilder: (context, index) {
          final banner = banners[index];

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: AssetImage(banner["image"]!),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    return Container(
      color: const Color(0xffF5F6FA),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 10),
                    Text(
                      "search".tr(),
                      style: const TextStyle(color: Colors.grey),
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Icon(Icons.tune),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(oldDelegate) => false;
}

class _CategoryDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _CategoryDelegate({required this.child});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: const Color(0xffF5F6FA),
      alignment: Alignment.centerLeft,
      child: child,
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant _CategoryDelegate oldDelegate) {
    return true;
  }
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
      height: 190,
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
    padding: const EdgeInsets.only(right: 10),
    child: GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: selected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: selected
                ? Colors.black
                : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: selected ? Colors.white : Colors.grey,
            ),

            const SizedBox(width: 6),

            Text(
              text,
              style: TextStyle(
                fontSize: 12,
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

class DestinationCard extends StatefulWidget {
  final Destination destination;

  const DestinationCard({super.key, required this.destination});

  @override
  State<DestinationCard> createState() =>
      _DestinationCardState();
}
