class Employee {
  final String? profileUrl;
  final String name;
  final String email;
  final String jobTitle;
  final String lineManager;
  final String department;
  final String office;

  Employee({
    required this.profileUrl,
    required this.name,
    required this.email,
    required this.jobTitle,
    required this.lineManager,
    required this.department,
    required this.office,
  });

  Map toMap() {
    return {
      "profileUrl": profileUrl,
      "name": name,
      "email": email,
      "jobTitle": jobTitle,
      "lineManager": lineManager,
      "department": department,
      "office": office,
    };
  }
}
