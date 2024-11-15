import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:ui';

class SwipeHomeScreen extends StatefulWidget {
  const SwipeHomeScreen({super.key});

  @override
  _SwipeHomeScreenState createState() => _SwipeHomeScreenState();
}

class _SwipeHomeScreenState extends State<SwipeHomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  YoutubePlayerController? _youtubeController;
  bool _showLikeLabel = false;
  bool _showNopeLabel = false;

  final List<Map<String, dynamic>> items = [
    {
      'videoId': 'pg0iNuiIzfA',
      'title': 'Microsoft',
      'description': '20 uur in de week. Lees meer...',
      'views': 1254,
      'likes': 118,
    },
    {
      'videoId': 'F1MipNFzRfw',
      'title': 'Nike',
      'description': 'Description for Nike Company',
      'views': 1000,
      'likes': 500,
    },
  ];

  @override
  void initState() {
    super.initState();
    _initializeYoutubePlayer(_currentIndex);
  }

  void _initializeYoutubePlayer(int index) {
    if (_youtubeController == null || _youtubeController!.initialVideoId != items[index]['videoId']) {
      _youtubeController?.dispose(); // Dispose of the existing controller if needed
      _youtubeController = YoutubePlayerController(
        initialVideoId: items[index]['videoId'],
        flags: const YoutubePlayerFlags(autoPlay: true, loop: true),
      );
    }
  }

  void _onSwipe(int newIndex) {
    if (newIndex != _currentIndex) {
      setState(() {
        _currentIndex = newIndex;
        _showLikeLabel = false; // Reset labels when swiping
        _showNopeLabel = false;
      });
      _initializeYoutubePlayer(_currentIndex);
    }
  }

  void _likeAction() {
    setState(() {
      _showLikeLabel = true;
      _showNopeLabel = false;
    });
    // Add any additional logic for liking an item here
  }

  void _dislikeAction() {
    setState(() {
      _showNopeLabel = true;
      _showLikeLabel = false;
    });
    // Add any additional logic for disliking an item here
  }

  @override
  void dispose() {
    _youtubeController?.dispose();
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
            onPageChanged: _onSwipe,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (_youtubeController != null && index == _currentIndex)
                      YoutubePlayer(
                        controller: _youtubeController!,
                        showVideoProgressIndicator: true,
                      ),
                    if (_showLikeLabel)
                      const Positioned(
                        top: 50,
                        right: 20,
                        child: Text(
                          'LIKE',
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    if (_showNopeLabel)
                      const Positioned(
                        top: 50,
                        left: 20,
                        child: Text(
                          'NOPE',
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    Positioned(
                      bottom: 180,
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
                            Row(
                              children: [
                                Text(
                                  '${items[index]['views']}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                const Icon(Icons.visibility,
                                    color: Color(0xFF5D47FF), size: 16),
                                const SizedBox(width: 10),
                                Text(
                                  '${items[index]['likes']}',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                const Icon(Icons.favorite,
                                    color: Color(0xFF5D47FF), size: 16),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              items[index]['title'],
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            GestureDetector(
                              onTap: () => _showDescriptionOverlay(
                                  context, items[index]['description']),
                              child: Text(
                                items[index]['description'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                ),
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
            bottom: 120,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: _dislikeAction,
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
                  onTap: _likeAction,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: const Icon(Icons.favorite,
                        color: Colors.green, size: 30),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDescriptionOverlay(BuildContext context, String description) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 0.7,
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            'https://via.placeholder.com/150',
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Customer Service',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text(
                                'Swipework AI',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                'North Holland • Just posted',
                                style: TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite, color: Colors.red),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Job Description',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'About Role',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    const Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Job Description',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Come join our fun team in the heart of Amsterdam. You will be responsible for all communication with clients and users of the app. You are friendly and have more patience than grandma\'s goldfish.',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'About Role',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '10 - 17 hourly\nPart-time',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
