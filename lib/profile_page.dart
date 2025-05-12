import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

// Import new pages
import 'account_settings_page.dart';
import 'order_history_page.dart';
import 'payment_methods_page.dart';
import 'shipping_addresses_page.dart';
import 'wishlist_page.dart';

// Model for API data (sample post - can be reused or defined here if only used in profile)
class Post {
  final int userId; // Keep for structure, can be a dummy value
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  String _currentLocation = 'Fetching location...';
  bool _isLoadingLocation = true;
  List<Post> _announcements = [];
  bool _isLoadingAnnouncements = true;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // 2 tabs
    _determinePosition();
    _fetchAnnouncements();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    setState(() => _isLoadingLocation = true);

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (mounted) {
        setState(() {
          _currentLocation = 'Location services are disabled.';
          _isLoadingLocation = false;
        });
      }
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (mounted) {
          setState(() {
            _currentLocation = 'Location permissions are denied';
            _isLoadingLocation = false;
          });
        }
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (mounted) {
        setState(() {
          _currentLocation = 'Location permissions are permanently denied.';
          _isLoadingLocation = false;
        });
      }
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
      );
      if (mounted) {
        setState(() {
          _currentLocation =
              'Lat: ${position.latitude.toStringAsFixed(2)}, Long: ${position.longitude.toStringAsFixed(2)}';
          _isLoadingLocation = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _currentLocation = 'Failed to get location.';
          _isLoadingLocation = false;
          debugPrint('Error getting location: $e');
        });
      }
    }
  }

  Future<void> _fetchAnnouncements() async {
    setState(() => _isLoadingAnnouncements = true);
    await Future.delayed(const Duration(milliseconds: 800));

    final List<Post> mockAnnouncements = [
      Post(
        id: 1,
        userId: 1,
        title: "✨ New Moissanite Sparkle Collection Arrived! ✨",
        body:
            "Discover our latest collection of breathtaking moissanite rings, earrings, and pendants. Featuring new cuts and designs that maximize brilliance. Limited stock available!",
      ),
      Post(
        id: 2,
        userId: 1,
        title: "🎉 Weekend Flash Sale - Up to 30% Off! 🎉",
        body:
            "Don't miss out! This weekend only, enjoy up to 30% off on selected moissanite jewelry. Perfect time to find that special gift or treat yourself.",
      ),
      Post(
        id: 3,
        userId: 1,
        title: "🔧 App Update: Enhanced Wishlist Feature!",
        body:
            "We've listened to your feedback! Our app now features an improved wishlist. Save your favorite items easily and get notified of price drops.",
      ),
      Post(
        id: 4,
        userId: 1,
        title: "💎 Moissanite vs. Diamond: Learn the Difference",
        body:
            "Visit our blog section in the app to read our new article comparing moissanite and diamonds. Understand why moissanite is the ethical and brilliant choice.",
      ),
      Post(
        id: 5,
        userId: 1,
        title: "🚚 Free Express Shipping on Orders Over \$200",
        body:
            "For a limited time, get free express shipping on all orders over \$200. Get your sparkle delivered faster!",
      ),
    ];

    if (mounted) {
      setState(() {
        _announcements = mockAnnouncements;
        _isLoadingAnnouncements = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile'), elevation: 1),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        'assets/diamond_logo.png',
                      ), // Replace with actual user image asset
                      backgroundColor: Colors.deepPurpleAccent,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'User Name', // Replace with actual user name
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'user.email@example.com', // Replace with actual user email
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.deepPurple,
                              size: 24,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child:
                                  _isLoadingLocation
                                      ? const Row(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Text("Getting location..."),
                                        ],
                                      )
                                      : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Your nearest store:",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            _currentLocation,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                            ),
                            if (!_isLoadingLocation)
                              IconButton(
                                icon: const Icon(
                                  Icons.refresh,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                onPressed: _determinePosition,
                                tooltip: "Refresh location",
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.deepPurple,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.deepPurple,
                  indicatorWeight: 2.5,
                  tabs: const [
                    Tab(icon: Icon(Icons.person_outline), text: "Details"),
                    Tab(
                      icon: Icon(Icons.campaign_outlined),
                      text: "Announcements",
                    ),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [_buildDetailsTab(), _buildAnnouncementsTab()],
        ),
      ),
    );
  }

  Widget _buildDetailsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileInfoCard(
            title: "Account Settings",
            icon: Icons.settings_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccountSettingsPage(),
                ),
              );
            },
          ),
          _buildProfileInfoCard(
            title: "Order History",
            icon: Icons.history_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrderHistoryPage(),
                ),
              );
            },
          ),
          _buildProfileInfoCard(
            title: "Payment Methods",
            icon: Icons.payment_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentMethodsPage(),
                ),
              );
            },
          ),
          _buildProfileInfoCard(
            title: "Shipping Addresses",
            icon: Icons.local_shipping_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShippingAddressesPage(),
                ),
              );
            },
          ),
          _buildProfileInfoCard(
            title: "Wishlist",
            icon: Icons.favorite_border_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WishlistPage()),
              );
            },
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login',
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfoCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildAnnouncementsTab() {
    if (_isLoadingAnnouncements) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_announcements.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("No announcements or promos currently."),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(12.0),
      itemCount: _announcements.length,
      itemBuilder: (context, index) {
        final announcement = _announcements[index];
        return Card(
          elevation: 1.5,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            title: Text(
              announcement.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                announcement.body,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            isThreeLine: true,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tapped on: ${announcement.title}')),
              );
            },
          ),
        );
      },
    );
  }
}

// Helper class for SliverPersistentHeader delegate (for sticky TabBar)
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color:
          Theme.of(
            context,
          ).scaffoldBackgroundColor, // Match scaffold background
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
