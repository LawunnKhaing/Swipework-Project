import 'package:flutter/material.dart';
import 'package:swipework_app/models/company.dart';

class CompanyVacanciesScreen extends StatelessWidget {
  CompanyVacanciesScreen({super.key});

// List of dummy company data
  final List<Company> companies = [
    Company(
      companyURL:
     "https://cdn.studentenkorting.nl/img/bol.com@2x.jpg",
      companyName: "Tom Tom",
      jobType: "Full time",
      jobSoort: "Retail",
      jobTitle: "Software Engineer",
      location: "Amsterdam",
    ),
    Company(
      companyURL:
      "https://cdn.studentenkorting.nl/img/bol.com@2x.jpg",
      companyName: "Microsoft",
      jobType: "Part time",
      jobSoort: "Retail",
      jobTitle: "Graphic Designer",
      location: "Rotterdam",
    ),
    Company(
      companyURL:
          "https://cdn.studentenkorting.nl/img/bol.com@2x.jpg",
      companyName: "Nike",
      jobType: "Full time",
      jobSoort: "Retail",
      jobTitle: "Full Stack Developer",
      location: "Utrecht",
    ),
    Company(
      companyURL:
      "https://cdn.studentenkorting.nl/img/bol.com@2x.jpg",
      jobType: "Full time",
      jobSoort: "Retail",
      companyName: "Nike",
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
                  company.companyURL,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey,
                      child: const Icon(Icons.image_not_supported),
                    );
                  },
                ),
              ),
              const SizedBox(width: 8), // Space between image and text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${company.jobType}", // Displaying SoortOfTime
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white, // Set text color to white
                    ),
                  ),
                  Text(
                    company.jobTitle,
                     
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                      ), // Set text color to white
                  ),
                  Row(
                    children: [
                      Text(
                        company.jobSoort ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 4), // Space before the dot
                      const Icon(
                          Icons.circle, // Dot icon
                          size: 4,
                          color: Colors.white,
                        ),
                      const SizedBox(width: 4), // Space before the dot
                      Text(
                        company.location,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
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
            icon: const Icon(Icons.favorite_border, color: Colors.white), // Set icon color to white
          ),
        ],
      ),
    ],
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Apply the gradient to the body of the Scaffold
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF5D47FF), // First color (hex color)
              Color(0xFF42DAD3), // Second color (hex color)
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xFF5D47FF),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "Alle vacatures van " ,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
             Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0), // Add padding around the image
                  child: ClipOval(
                    child: Image.network(
                    "https://cdn.studentenkorting.nl/img/bol.com@2x.jpg",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey,
                        child: const Icon(Icons.image_not_supported, size: 50),
                        );
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20), // Space between the rows
              // Row with vertical cards
              // Using the Company model to display dummy data
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: companies.map((company) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: generateCompanyRow(company),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
