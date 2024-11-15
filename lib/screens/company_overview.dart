
import 'package:flutter/material.dart';
import 'package:swipework_app/components/company_card.dart';
import 'package:swipework_app/components/company_row.dart';
import 'package:swipework_app/models/company.dart';

class CompanyOverviewScreen extends StatelessWidget {
  CompanyOverviewScreen({super.key});

  // List of dummy company data
  final List<Company> companies = [
    Company(
      companyURL:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1MF3KYDQqsVArU1jrKYzKTtImXmv2Wz1-qA&s",
      amountOfVacancy: 5,
      companyName: "TomTom",
      jobTitle: "Software Engineer",
      location: "Amsterdam",
    ),
    Company(
      companyURL:
          "https://t3.ftcdn.net/jpg/03/56/99/34/360_F_356993432_ZLyCoyfTSa5JOK6rkoaSstHIleu4HERh.jpg",
      amountOfVacancy: 3,
      companyName: "Nike",
      jobTitle: "Graphic Designer",
      location: "Rotterdam",
    ),
    Company(
      companyURL:
          "https://i.pinimg.com/736x/9c/b0/bc/9cb0bc7cab743ffccd22c07719ec9ba3.jpg",
      amountOfVacancy: 2,
      companyName: "Microsoft",
      jobTitle: "Full Stack Developer",
      location: "Utrecht",
    ),
    Company(
      companyURL:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDVBKt1jsm6-FW4gqJlPH1asZzf2NwcqDKPg&s",
      amountOfVacancy: 4,
      companyName: "Jumbo",
      jobTitle: "SEO Specialist",
      location: "The Hague",
    ),
    Company(
      companyURL:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1MF3KYDQqsVArU1jrKYzKTtImXmv2Wz1-qA&s",
      amountOfVacancy: 5,
      companyName: "TomTom",
      jobTitle: "Software Engineer",
      location: "Amsterdam",
    ),
    Company(
      companyURL:
          "https://t3.ftcdn.net/jpg/03/56/99/34/360_F_356993432_ZLyCoyfTSa5JOK6rkoaSstHIleu4HERh.jpg",
      amountOfVacancy: 3,
      companyName: "Nike",
      jobTitle: "Graphic Designer",
      location: "Rotterdam",
    ),
    Company(
      companyURL:
          "https://i.pinimg.com/736x/9c/b0/bc/9cb0bc7cab743ffccd22c07719ec9ba3.jpg",
      amountOfVacancy: 2,
      companyName: "Microsoft",
      jobTitle: "Full Stack Developer",
      location: "Utrecht",
    ),
    Company(
      companyURL:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDVBKt1jsm6-FW4gqJlPH1asZzf2NwcqDKPg&s",
      amountOfVacancy: 4,
      companyName: "Jumbo",
      jobTitle: "SEO Specialist",
      location: "The Hague",
    ),
  ];

  Widget generateCompanyRow(Company company) {
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
                    company.companyURL, // Assuming companyURL is the image URL
                    width: 50, // Set a fixed size for the profile picture
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8), // Space between image and text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${company.amountOfVacancy} vacatures", // Displaying number of vacancies
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(company.companyName ?? "Unknown Company Name"),
                    Row(
                      children: [
                        Text(company.jobTitle),
                        const Text("."),
                        Text(company.location),
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
                // Handle favorite action here
              },
              icon: const Icon(
                  Icons.favorite_border), // Unfilled heart for favorite
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double circleCenterTop = 150;
    double circleCenterRight = 0;

    return Scaffold(
      body: Stack(
        children: [
          // Background with gradient and circles
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
          // Positioned circles with same center
          Positioned(
            top: circleCenterTop - 300,
            right: circleCenterRight - 300,
            child: CircleAvatar(
              radius: 300,
              backgroundColor: Colors.white.withOpacity(0.1),
            ),
          ),
          Positioned(
            top: circleCenterTop - 225,
            right: circleCenterRight - 225,
            child: CircleAvatar(
              radius: 225,
              backgroundColor: Colors.white.withOpacity(0.1),
            ),
          ),
          Positioned(
            top: circleCenterTop - 150,
            right: circleCenterRight - 150,
            child: CircleAvatar(
              radius: 150,
              backgroundColor: Colors.white.withOpacity(0.1),
            ),
          ),
          Positioned(
            top: circleCenterTop - 75,
            right: circleCenterRight - 75,
            child: CircleAvatar(
              radius: 75,
              backgroundColor: Colors.white.withOpacity(0.1),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: const Color(0xFF5D47FF),
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "Bedrijven",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                  child: Text(
                    "Speciaal voor jou",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(5, (index) {
                      if (index == 0) {
                        return const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: CompanyCard(
                              icon: Icons.domain,
                              information: "Flexibele uren"),
                        );
                      }
                      return const CompanyCard(
                        icon: Icons.domain,
                        information: "Flexibele uren",
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                  child: Text(
                    "Nieuwe bedrijven",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Expanded(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          scrollbarTheme: ScrollbarThemeData(
                            thumbColor: WidgetStateProperty.all(
                                Colors.white), // Set to white
                            radius: const Radius.circular(8),
                            thickness: WidgetStateProperty.all(4),
                          ),
                        ),
                        child: Scrollbar(
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                            child: Column(
                              children: companies.map((company) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: CompanyRow(company: company),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
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
  }
}
