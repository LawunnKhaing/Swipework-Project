import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SwipeHomeScreen extends StatefulWidget {
  const SwipeHomeScreen({super.key});

  @override
  _SwipeHomeScreenState createState() => _SwipeHomeScreenState();
}

class _SwipeHomeScreenState extends State<SwipeHomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  late YoutubePlayerController _youtubeController;

  // Example list of items to display with YouTube video IDs
  final List<Map<String, String>> items = [
    {
      'videoId': 'F1MipNFzRfw', // YouTube Video ID
      'title': 'Nike',
      'description': 'Description for Nike Company',
    },
    {
      'videoId': 'bTqVqk7FSmY', // Another YouTube Video ID
      'title': 'Company 2',
      'description': 'Description for Company 2',
    },
  ];

  @override
  void initState() {
    super.initState();
    _initializeYoutubePlayer(_currentIndex);
  }

  void _initializeYoutubePlayer(int index) {
    _youtubeController = YoutubePlayerController(
      initialVideoId: items[index]['videoId']!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        loop: true,
        mute: false,
      ),
    );
  }

  void _onSwipeLeft() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % items.length;
      _youtubeController.load(items[_currentIndex]['videoId']!);
    });
  }

  void _onSwipeRight() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % items.length;
      _youtubeController.load(items[_currentIndex]['videoId']!);
    });
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
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
                    _onSwipeLeft();
                  } else if (details.primaryVelocity! > 0) {
                    _onSwipeRight();
                  }
                },
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    YoutubePlayer(
                      controller: _youtubeController,
                      showVideoProgressIndicator: true,
                      onReady: () => _youtubeController.play(),
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
                      color: Colors.black.withOpacity(0.3),
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
                      color: Colors.black.withOpacity(0.3),
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
