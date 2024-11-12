class Company {
  final String companyURL;
  final int? amountOfVacancy; // Marked as nullable with ?
  final String? companyName; // Marked as nullable with ?
  final String jobTitle;
  final String location;
  final String? jobType;
  final String? jobSoort;

  Company({
    required this.companyURL,
    this.amountOfVacancy, // Optional
    this.companyName, // Optional
    required this.jobTitle,
    required this.location,
    this.jobType,
    this.jobSoort,
  });
}

