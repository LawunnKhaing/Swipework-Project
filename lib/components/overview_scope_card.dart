import 'package:flutter/material.dart';
import 'package:swipework_app/models/job_scope.dart';


class OverviewScopeCard extends StatefulWidget {
  
  final JobScope jobScope;

  const OverviewScopeCard({super.key, required this.jobScope});
  

  @override
  _OverviewScopeCardState createState() => _OverviewScopeCardState();
}

class _OverviewScopeCardState extends State<OverviewScopeCard> {
  bool _isLiked = false; // Track whether the icon is liked or not

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: 170,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 5, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        Color(0xFF5D47FF), // First color (hex color)
                        Color(0xFF42DAD3), // Second color (hex color)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: Icon(
                      widget.jobScope.icon,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                        _isLiked
                            ? Icons.favorite
                            : Icons.favorite_border, // Toggle icon
                        color: const Color(0xFF5D47FF)),
                    onPressed: () {
                      setState(() {
                        _isLiked = !_isLiked; // Toggle like state
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.jobScope.scope,
                    style: const TextStyle(color: Color(0xFF84A6FF), fontSize: 13),
                  ),
                  Text(
                    widget.jobScope.name,
                    style: const TextStyle(
                        color: Color(0xFF5D47FF),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
