abstract class EmployeeServices {
  //employee statstics panel
  Future<Map> fetchEmployeeStatistics();
  Future<Map<String, List>> fetchSalary();

  //employee panel
  Future<List> fetchEmployees();

  //chart panel
  Future<List> fetchEmployeeChartData();
  Future<List> fetchJobSummary();
}
