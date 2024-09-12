import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_dashboard/model/employee_statistics_model.dart';
import 'package:hr_dashboard/services/dashboard_private.dart';
import 'package:hr_dashboard/services/dashboard_public.dart';

class EmployeeStatisticsNotifier
    extends StateNotifier<EmployeeStatisticsModel> {
  final DashboardPublic emp;
  EmployeeStatisticsNotifier(this.emp)
      : super(
          EmployeeStatisticsModel(
            totalEmployees: 0,
            totalEmployeesPercentage: 0,
            jobApplicants: 0,
            jobApplicationsPercentagel: 0,
            newEmployees: 0,
            newEmployeesPercentagel: 0,
            resignedEmployees: 0,
            resignedEmployeesPercentagel: 0,
          ),
        );

  Future<void> getEmployeeStatistics(int beforeXMonths) async {
    state = await emp.fetchEmployeeStatistics(beforeXMonths);
  }
}

final employeeStatisticsProvider =
    StateNotifierProvider<EmployeeStatisticsNotifier, EmployeeStatisticsModel>(
        (ref) {
  return EmployeeStatisticsNotifier(DashboardPublic(DashboardPrivate()));
});
