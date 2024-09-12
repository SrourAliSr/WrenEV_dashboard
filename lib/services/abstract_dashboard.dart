import 'package:hr_dashboard/model/employee_drop_down_items_model.dart';
import 'package:hr_dashboard/model/employee_model.dart';
import 'package:hr_dashboard/model/employee_statistics_model.dart';
import 'package:hr_dashboard/model/pie_chart_data_model.dart';
import 'package:hr_dashboard/model/salary_model.dart';

abstract class DashboardServices {
  //employee statstics panel
  Future<EmployeeStatisticsModel> fetchEmployeeStatistics(int beforeXMonths);
  Future<Salary> fetchSalary(int beforeXMonths);

  //employee panel
  Future<List<Employee>> fetchEmployees(String? searchedName, int startRange,
      int endRange, String office, String jobTitle);
  Future<int> get getEmployeeCount;
  Future<EmployeeDropDownItemsModel> getEmployeeDropDownItems();

  //chart panel
  Future<PieChartData> fetchEmployeeChartData(int beforeXMonths);
  Future<PieChartData> fetchJobSummary(int beforeXMonths);
}
