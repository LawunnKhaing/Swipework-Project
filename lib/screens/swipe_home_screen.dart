import 'package:flutter/material.dart';

class SwipeHomeScreen extends StatefulWidget {
  const SwipeHomeScreen({super.key});

  @override
  _SwipeHomeScreenState createState() => _SwipeHomeScreenState();
}

class _SwipeHomeScreenState extends State<SwipeHomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // Example list of items to display
  final List<Map<String, String>> items = [
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1MF3KYDQqsVArU1jrKYzKTtImXmv2Wz1-qA&s',
      'title': 'Company 1',
      'description': 'Description for Company 1',
    },
    {
      'image':
          'https://wallpapercave.com/wp/wp6514280.jpg',
      'title': 'Nike',
      'description': 'Description for Company 2',
    },
  ];

  void _onSwipeLeft() {
    // Logic for swipe left action (e.g., dislike)
    setState(() {
      _currentIndex = (_currentIndex + 1) % items.length;
    });
  }

  void _onSwipeRight() {
    // Logic for swipe right action (e.g., like)
    setState(() {
      _currentIndex = (_currentIndex + 1) % items.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity! < 0) {
                    // Swiped left
                    _onSwipeLeft();
                  } else if (details.primaryVelocity! > 0) {
                    // Swiped right
                    _onSwipeRight();
                  }
                },
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      items[index]['image']!,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 100,
                      left: 20,
                      right: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[index]['title']!,
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              items[index]['description']!,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: _onSwipeLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.3), // Translucent background
                    ),
                    padding: const EdgeInsets.all(20),
                    child: const Icon(Icons.close, color: Colors.red, size: 30),
                  ),
                ),
                GestureDetector(
                  onTap: _onSwipeRight,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.3), // Translucent background
                    ),
                    padding: const EdgeInsets.all(20),
                    child: const Icon(Icons.favorite, color: Colors.green, size: 30),
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
