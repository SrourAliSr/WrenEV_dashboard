class EmployeeDropDownItemsModel {
  final List<String> officeItems;
  final List<String> jobTitleItems;

  EmployeeDropDownItemsModel(
      {required this.officeItems, required this.jobTitleItems});

  Map toMap() {
    return {
      "office items": officeItems,
      "job title items": jobTitleItems,
    };
  }
}
