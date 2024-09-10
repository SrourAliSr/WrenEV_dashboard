class Salary {
  final List<Map<String, dynamic>> product;
  final List<Map<String, dynamic>> project;

  Salary({required this.product, required this.project});

  Map<String, List> toMap() {
    return {
      "product": product,
      "project": project,
    };
  }
}
