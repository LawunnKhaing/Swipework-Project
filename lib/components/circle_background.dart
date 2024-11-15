import 'package:flutter/material.dart';

class CircleBackground extends StatelessWidget {
  final double circleCenterTop;
  final double circleCenterRight;
  final Widget child;
  final String? title;
  final bool enableScroll;

  const CircleBackground(
      {super.key,
      required this.child,
      this.circleCenterTop = 150,
      this.circleCenterRight = 0,
      this.title,
      this.enableScroll = false});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // Background gradient and circles
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF5D47FF),
              Color(0xFF42DAD3),
            ],
          ),
        ),
      ),
      // Large circle
      Positioned(
        top: circleCenterTop - 300,
        right: circleCenterRight - 300,
        child: Container(
          width: 600,
          height: 600,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 2,
            ),
          ),
        ),
      ),
      // Medium circle
      Positioned(
        top: circleCenterTop - 225,
        right: circleCenterRight - 225,
        child: Container(
          width: 450,
          height: 450,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 2,
            ),
          ),
        ),
      ),
      // Small circle
      Positioned(
        top: circleCenterTop - 150,
        right: circleCenterRight - 150,
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 2,
            ),
          ),
        ),
      ),
      // Very small circle
      Positioned(
        top: circleCenterTop - 75,
        right: circleCenterRight - 75,
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 2,
            ),
          ),
        ),
      ),
      // Column containing title and child
      enableScroll
          ? SingleChildScrollView(
              child: _buildContent(),
            )
          : _buildContent(),
    ]);
  }

  Widget _buildContent() {
    return Column(
      children: [
        if (title != null) const SizedBox(height: 80),
        // Title section
        if (title != null)
          Container(
            width: double.infinity,
            color: const Color(0xFF5D47FF),
            padding: const EdgeInsets.all(10),
            child: Text(
              title ?? "Unknown Title",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
        if (title != null) const SizedBox(height: 20),
        // Child content
        if (enableScroll) child else Flexible(child: child)
      ],
    );
  }
}
