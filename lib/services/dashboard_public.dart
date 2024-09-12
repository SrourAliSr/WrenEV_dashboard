import 'package:hr_dashboard/model/employee_drop_down_items_model.dart';
import 'package:hr_dashboard/model/employee_model.dart';
import 'package:hr_dashboard/model/employee_statistics_model.dart';
import 'package:hr_dashboard/model/pie_chart_data_model.dart';
import 'package:hr_dashboard/model/salary_model.dart';
import 'package:hr_dashboard/services/abstract_dashboard.dart';

class DashboardPublic implements DashboardServices {
  final DashboardServices _dashboardServices;

  DashboardPublic(this._dashboardServices);

  @override
  Future<PieChartData> fetchEmployeeChartData(int beforeXMonths) async =>
      await _dashboardServices.fetchEmployeeChartData(beforeXMonths);

  @override
  Future<EmployeeStatisticsModel> fetchEmployeeStatistics(
          int beforeXMonths) async =>
      await _dashboardServices.fetchEmployeeStatistics(beforeXMonths);

  @override
  Future<List<Employee>> fetchEmployees(String? searchedName, int startRange,
          int endRange, String office, String jobTitle) async =>
      await _dashboardServices.fetchEmployees(
        searchedName,
        startRange,
        endRange,
        office,
        jobTitle,
      );

  @override
  Future<Salary> fetchSalary(int beforeXMonths) async =>
      await _dashboardServices.fetchSalary(beforeXMonths);

  @override
  Future<PieChartData> fetchJobSummary(int beforeXMonths) async =>
      await _dashboardServices.fetchJobSummary(beforeXMonths);

  @override
  Future<int> get getEmployeeCount async =>
      await _dashboardServices.getEmployeeCount;

  @override
  Future<EmployeeDropDownItemsModel> getEmployeeDropDownItems() async =>
      await _dashboardServices.getEmployeeDropDownItems();
}
