import 'dart:developer';

import 'package:hr_dashboard/model/employee_model.dart';
import 'package:hr_dashboard/model/employee_statistics_model.dart';
import 'package:hr_dashboard/model/salary_model.dart';
import 'package:hr_dashboard/model/pie_chart_data_model.dart';
import 'package:hr_dashboard/services/abstract_employee.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EmployeePrivate implements EmployeeServices {
  final supabase = Supabase.instance.client;

  //employee statistics panel logic
  @override
  Future<EmployeeStatisticsModel> fetchEmployeeStatistics(
      int beforeXMonths) async {
    final timeIntervalStringFormate = _getTimeInterval(beforeXMonths);
    final data = await Future.wait(
      [
        _getEmployeeTotal(timeIntervalStringFormate),
        _getJobApplicant(timeIntervalStringFormate),
        _getNewEmployees(timeIntervalStringFormate),
        _getResignedEmployees(timeIntervalStringFormate),
      ],
    );
    final percentages = await Future.wait(
      [
        _employeeTotalPercentage(data[0] + data[1]),
        _jobApplicantsPercentage(data[1]),
        _resignedEmployeesPercentage(data[3]),
      ],
    );
    final totalEmployees = data[0] + data[1];

    final newEmployeesPercentage = (data[2] * 100) / totalEmployees;

    final EmployeeStatisticsModel employeeStatisitcs = EmployeeStatisticsModel(
      totalEmployees: totalEmployees,
      totalEmployeesPercentage: percentages[0],
      jobApplicants: data[1],
      jobApplicationsPercentagel: percentages[1],
      newEmployees: data[2],
      newEmployeesPercentagel: newEmployeesPercentage,
      resignedEmployees: data[3],
      resignedEmployeesPercentagel: percentages[2],
    );

    return employeeStatisitcs;
  }

  Future<int> _getEmployeeTotal(String timeInterval) async {
    return await supabase
        .from('Employee')
        .select()
        .isFilter('left_date', null)
        .gte('join_date', timeInterval)
        .count(CountOption.exact)
        .then((value) => value.count);
  }

  Future<double> _employeeTotalPercentage(int totalWithInterval) async {
    final totalEmployees = await supabase
        .from('Employee')
        .select()
        .count(CountOption.exact)
        .then((value) => value.count);
    final totalApplicants = await supabase
        .from('Applicants')
        .select()
        .count(CountOption.exact)
        .then((value) => value.count);
    return totalWithInterval * 100 / (totalEmployees + totalApplicants);
  }

  Future<int> _getJobApplicant(String timeInterval) async {
    return await supabase
        .from('Applicants')
        .select()
        .gte('applied_date', timeInterval)
        .count(CountOption.exact)
        .then((value) => value.count);
  }

  Future<double> _jobApplicantsPercentage(int applicants) async {
    final totalApplicants = await supabase
        .from('Applicants')
        .select()
        .count(CountOption.exact)
        .then((value) => value.count);
    return applicants * 100 / totalApplicants;
  }

  Future<int> _getNewEmployees(String timeInterval) async {
    return await supabase
        .from('Employee')
        .select()
        .gte('join_date', timeInterval)
        .isFilter('left_date', null)
        .count(CountOption.exact)
        .then((value) => value.count);
  }

  Future<int> _getResignedEmployees(String timeInterval) async {
    return await supabase
        .from('Employee')
        .select()
        .gte('left_date', timeInterval)
        .count(CountOption.exact)
        .then((value) => value.count);
  }

  Future<double> _resignedEmployeesPercentage(int resigned) async {
    final totalResigned = await supabase
        .from('Employee')
        .select()
        .isFilter('left_date', null)
        .count(CountOption.exact)
        .then((value) => value.count);
    return resigned * 100 / totalResigned;
  }

  @override
  Future<Salary> fetchSalary(int beforeXMonths) async {
    final timeIntervalStringFormate = _getTimeInterval(beforeXMonths);
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

      return salary;
    } catch (e) {
      log(e.toString());
      return Salary(product: [], project: []);
    }
  }

//Employee panel functions
  @override
  Future<List<Employee>> fetchEmployees(
      String? searchedName, int startRange, int endRange) async {
    late final List employees;
    if (searchedName != null && searchedName.isNotEmpty) {
      //filter items acording the name using the i like for case unsensetive
      employees = await supabase
          .from('Employee')
          .select()
          .ilike('name', '%$searchedName%')
          .range(startRange, endRange);
    } else {
      //selecte all the employees whoes in range of "start range" till "end range"
      employees =
          await supabase.from('Employee').select().range(startRange, endRange);
    }
    final List<Employee> employeeList = employees
        .map(
          (e) => Employee(
            profileUrl: e['profile_pic'],
            name: e['name'],
            email: e['email'],
            jobTitle: e['job_title'],
            lineManager: e['line_manager'],
            department: e['department'],
            office: e['office'],
          ),
        )
        .toList();
    return employeeList;
  }

  @override
  Future<PieChartData> fetchEmployeeChartData(int beforeXMonths) async {
    late final List<Map> data;

    switch (beforeXMonths) {
      case 0:
        data = await supabase.from('Employee').select();

        break;
      default:
        final timeIntervalStringFormate = _getTimeInterval(beforeXMonths);

        data = await supabase
            .from('Employee')
            .select()
            .gte('join_date', timeIntervalStringFormate);
        break;
    }
    final double others = await supabase
        .from('Applicants')
        .select()
        .then((value) => value.length.toDouble());
    final int totalEmployees = (data.length + others).round();

    final onBoarding = data
        .map((e) => e)
        .where((element) => element['left_date'] == null)
        .length;
    final ofBoarding = data
        .map((e) => e)
        .where((element) => element['left_date'] != null)
        .length;

    final double onBoardingPercentage = (onBoarding * 100) / totalEmployees;
    final double ofBoardingPercentage = (ofBoarding * 100) / totalEmployees;

    PieChartData pieChartData = PieChartData(
      title: 'Total Emp',
      titleNumber: totalEmployees,
      firstPointTitle: 'Others',
      firstPoint: others,
      secondPointTitle: 'OnBoarding',
      secondPoint: onBoardingPercentage,
      thirdPointTitle: 'OfBoarding',
      thirdPoint: ofBoardingPercentage,
    );
    return pieChartData;
  }

  @override
  Future<PieChartData> fetchJobSummary(int beforeXMonths) async {
    late final List<Map> data;

    switch (beforeXMonths) {
      case 0:
        data = await supabase.from('jobs').select();

        break;
      default:
        final timeIntervalStringFormate = _getTimeInterval(beforeXMonths);

        data = await supabase
            .from('jobs')
            .select()
            .gte('date', timeIntervalStringFormate);
        break;
    }

    final int totalJobs = data.length.round();

    final active =
        data.map((e) => e).where((element) => element['active'] == true).length;
    final unActive = data
        .map((e) => e)
        .where((element) => element['unactive'] == true)
        .length;
    final closed =
        data.map((e) => e).where((element) => element['closed'] == true).length;

    final double activegPercentage = (active * 100) / totalJobs;
    final double unActivegPercentage = (unActive * 100) / totalJobs;
    final double closedPercentage = (closed * 100) / totalJobs;

    PieChartData pieChartData = PieChartData(
      title: 'Total Jobs',
      titleNumber: totalJobs,
      firstPointTitle: 'Active job',
      firstPoint: activegPercentage,
      secondPointTitle: 'Unactive',
      secondPoint: unActivegPercentage,
      thirdPointTitle: 'closed',
      thirdPoint: closedPercentage,
    );
    return pieChartData;
  }

  String _getTimeInterval(int beforeXMonths) {
    final currentDate = DateTime.now();
    final timeInterval =
        DateTime(currentDate.year, currentDate.month - beforeXMonths, 1);
    return '${timeInterval.year}-${timeInterval.month}-${timeInterval.day}';
  }

  @override
  Future<int> get getEmployeeCount async => await supabase
      .from('Employee')
      .select()
      .count(CountOption.exact)
      .then((value) => value.count);
}
