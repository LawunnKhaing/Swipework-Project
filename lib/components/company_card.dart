import 'package:flutter/material.dart';

class CompanyCard extends StatefulWidget {
  final IconData icon;
  final String information;

  const CompanyCard({
    super.key,
    required this.icon,
    required this.information,
  });

  @override
  _CompanyCardState createState() => _CompanyCardState();
}

class _CompanyCardState extends State<CompanyCard> {
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
                      widget.icon,
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
                  const Text(
                    "Bedrijven met:",
                    style: TextStyle(color: Color(0xFF84A6FF), fontSize: 13),
                  ),
                  Text(
                    widget.information,
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
