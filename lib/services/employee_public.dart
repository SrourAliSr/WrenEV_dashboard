import 'package:hr_dashboard/model/employee_model.dart';
import 'package:hr_dashboard/model/employee_statistics_model.dart';
import 'package:hr_dashboard/model/pie_chart_data_model.dart';
import 'package:hr_dashboard/model/salary_model.dart';
import 'package:hr_dashboard/services/abstract_employee.dart';

class EmployeePublic implements EmployeeServices {
  final EmployeeServices _employeeServices;

  EmployeePublic(this._employeeServices);

  @override
  Future<PieChartData> fetchEmployeeChartData(int beforeXMonths) async =>
      await _employeeServices.fetchEmployeeChartData(beforeXMonths);

  @override
  Future<EmployeeStatisticsModel> fetchEmployeeStatistics(
          int beforeXMonths) async =>
      await _employeeServices.fetchEmployeeStatistics(beforeXMonths);

  @override
  Future<List<Employee>> fetchEmployees(
          String? searchedName, int startRange, int endRange) async =>
      await _employeeServices.fetchEmployees(
          searchedName, startRange, endRange);

  @override
  Future<Salary> fetchSalary(int beforeXMonths) async =>
      await _employeeServices.fetchSalary(beforeXMonths);

  @override
  Future<PieChartData> fetchJobSummary(int beforeXMonths) async =>
      await _employeeServices.fetchJobSummary(beforeXMonths);

  @override
  Future<int> get getEmployeeCount async =>
      await _employeeServices.getEmployeeCount;
}
