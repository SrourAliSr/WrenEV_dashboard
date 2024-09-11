import 'dart:developer';

import 'package:hr_dashboard/model/employee_statistics_model.dart';
import 'package:hr_dashboard/model/salary_model.dart';
import 'package:hr_dashboard/services/abstract_employee.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EmployeePrivate implements EmployeeServices {
  final supabase = Supabase.instance.client;

  //employee statistics panel logic
  @override
  Future<Map> fetchEmployeeStatistics() async {
    final data = await Future.wait(
      [
        _getEmployeeTotal(),
        _getJobApplicant(),
        _getNewEmployees(),
        _getResignedEmployees(),
      ],
    );
    final EmployeeStatisticsModel employeeStatisitcs = EmployeeStatisticsModel(
      totalEmployees: data[0],
      jobApplicants: data[1],
      newEmployees: data[2],
      resignedEmployees: data[3],
    );

    return employeeStatisitcs.toMap();
  }

  Future<int> _getEmployeeTotal() async {
    final data = await supabase.from('Employee').select().isFilter(
          'left_date',
          null,
        );

    return data.length;
  }

  Future<int> _getJobApplicant() async {
    final data = await supabase.from('Applicants').select();

    return data.length;
  }

  Future<int> _getNewEmployees() async {
    final data =
        await supabase.from('Employee').select().gte('join_date', '2023-07-12');

    return data.length;
  }

  Future<int> _getResignedEmployees() async {
    final data =
        await supabase.from('Employee').select().gte('left_date', '2023-07-12');

    return data.length;
  }

  @override
  Future<Map<String, List>> fetchSalary(int beforeXMonths) async {
    final currentDate = DateTime.now();
    final timeInterval =
        DateTime(currentDate.year, currentDate.month - beforeXMonths, 1);
    final timeIntervalStringFormate =
        '${timeInterval.year}-${timeInterval.month}-${timeInterval.day}';
    try {
      final data = await supabase
          .from('Salary')
          .select()
          .gte('date', timeIntervalStringFormate)
          .order('date', ascending: true);

      final productList = data
          .where((element) => element['team'] == 'product')
          .map((e) => e)
          .toList();
      final projectList = data
          .where((element) => element['team'] == 'project')
          .map((e) => e)
          .toList();

      Salary salary = Salary(product: productList, project: projectList);

      return salary.toMap();
    } catch (e) {
      log(e.toString());
      return {};
    }
  }

  @override
  Future<List> fetchEmployeeChartData() async {
    return [];
  }

  @override
  Future<List> fetchEmployees() {
    // TODO: implement fetchEmployees
    throw UnimplementedError();
  }

  @override
  Future<List> fetchJobSummary() {
    // TODO: implement fetchJobSummary
    throw UnimplementedError();
  }
}
