import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:swipework_app/components/circle_background.dart';
import 'package:swipework_app/components/custom_notched_navbar.dart';
import 'package:swipework_app/screens/company_overview.dart';
import 'package:swipework_app/screens/overview.dart';
import 'package:swipework_app/screens/swipe_home_screen.dart';
import 'package:swipework_app/screens/company_vacancies.dart';

void main() {
  runApp(const MyApp());
}

class NavigationItem {
  final Icon icon;
  final String? title;
  final Widget screen;
  final bool enableScroll;
  final bool disableNavFade;

  NavigationItem({
    required this.icon,
    required this.screen,
    this.title,
    this.enableScroll = false,
    this.disableNavFade = false,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // Removes the debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2; // Set initial index to make "Swipe" the main screen
  final ScrollController _scrollController = ScrollController();

  // List of screens for navigation
  final List<NavigationItem> _navigationItems = [
    NavigationItem(
      icon: const Icon(Icons.attach_file),
      title: "Bedrijven",
      screen: CompanyOverviewScreen(),
      enableScroll: true,
    ),
    NavigationItem(
      icon: const Icon(Icons.article),
      title: "Overzicht",
      screen: OverviewScreen(),
      enableScroll: false,
    ),
    NavigationItem(
        icon: const Icon(Icons.home),
        screen: const SwipeHomeScreen(),
        enableScroll: false,
        disableNavFade: true),
    NavigationItem(
      icon: const Icon(Icons.favorite),
      title: "Vacatures",
      screen: CompanyVacanciesScreen(),
      enableScroll: true,
    ),
    NavigationItem(
      icon: const Icon(Icons.account_circle),
      title: "Profile",
      screen: const ProfileScreen(),
      enableScroll: false,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Clean up the controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: CircleBackground(
              title: _navigationItems[_selectedIndex].title,
              enableScroll: _navigationItems[_selectedIndex].enableScroll,
              child: _navigationItems[_selectedIndex].screen,
            ),
          ),
          if (!_navigationItems[_selectedIndex].disableNavFade)
            Positioned(
              bottom: 0, // Adjust according to BottomAppBar height
              left: 0,
              right: 0,
              child: Container(
                height: 40, // Adjust the height for the fade effect
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF42DAD3).withOpacity(0),
                      const Color(0xFF42DAD3).withOpacity(1.0),
                      const Color(0xFF42DAD3).withOpacity(1.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: SizedBox(
                  child: BottomAppBar(
                    height: 80,
                    color: Colors.white.withOpacity(0.4),
                    shape: CustomCircularNotchedRectangle(
                        notchOffset: const Offset(-10, 0)),
                    notchMargin: 8,
                    child: SizedBox(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          _buildNavItem(Icons.attach_file, "Bedrijven", 0),
                          _buildNavItem(Icons.article, "Overzicht", 1),
                          const SizedBox(
                              width: 40), // Space for floating button
                          _buildNavItem(Icons.favorite, "Jouw Jobs", 3),
                          _buildNavItem(Icons.account_circle, "Profiel", 4),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ClipOval(
        child: BackdropFilter(
          filter:
              ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Apply blur effect
          child: FloatingActionButton(
            onPressed: () {
              _onItemTapped(2);
            },
            backgroundColor:
                Colors.white.withOpacity(0.6), // Apply white color with opacity
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: const Icon(Icons.home),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.black,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Details Screen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Screen'),
    );
  }
}
