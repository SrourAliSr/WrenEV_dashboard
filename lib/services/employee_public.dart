import 'package:hr_dashboard/services/abstract_employee.dart';

class EmployeePublic implements EmployeeServices {
  final EmployeeServices _employeeServices;

  EmployeePublic(this._employeeServices);

  @override
  Future<List> fetchEmployeeChartData() async =>
      await _employeeServices.fetchEmployeeChartData();

  @override
  Future<Map> fetchEmployeeStatistics() async =>
      await _employeeServices.fetchEmployeeStatistics();

  @override
  Future<List> fetchEmployees() async =>
      await _employeeServices.fetchEmployees();

  @override
  Future<List> fetchJobSummary() async =>
      await _employeeServices.fetchJobSummary();

  @override
  Future<Map<String, List>> fetchSalary() async =>
      await _employeeServices.fetchSalary();
}
