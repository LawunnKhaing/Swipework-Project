import 'package:flutter/material.dart';
import 'package:swipework_app/models/company.dart';

class CompanyRow extends StatefulWidget {
  final Company company;

  const CompanyRow({super.key, required this.company});

  @override
  _CompanyRowState createState() => _CompanyRowState();
}

class _CompanyRowState extends State<CompanyRow> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Round profile picture of the company
            Row(
              children: [
                ClipOval(
                  child: Image.network(
                    widget.company
                        .companyURL, // Assuming companyURL is the image URL
                    width: 60, // Set a fixed size for the profile picture
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10), // Space between image and text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.company.amountOfVacancy} vacatures", // Displaying number of vacancies
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.white),
                    ),
                    Text(
                      widget.company.companyName,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Row(
                      children: [
                        Text(widget.company.jobTitle,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.white)),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.circle, // Dot icon
                          size: 4,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 5),
                        Text(widget.company.location,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            // Favorite icon
            IconButton(
              onPressed: () {
                setState(() {
                  _isLiked = !_isLiked; // Toggle like state
                });
              },
              icon: Icon(
                  _isLiked
                      ? Icons.favorite
                      : Icons.favorite_border, // Toggle icon
                  color: Colors.white // Apply purple color when liked
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
