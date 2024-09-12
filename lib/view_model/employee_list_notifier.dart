import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_dashboard/model/employee_model.dart';
import 'package:hr_dashboard/services/dashboard_private.dart';
import 'package:hr_dashboard/services/dashboard_public.dart';

class EmployeeListNotifier extends StateNotifier<List<Employee>> {
  final DashboardPublic emp;
  EmployeeListNotifier({required this.emp}) : super([]);

  Future<void> getEmployeesList(String? searchedName, int startRange,
      int endRange, String office, String jobTitle) async {
    final employee = await emp.fetchEmployees(
        searchedName, startRange, endRange, office, jobTitle);
    state = employee;
  }
}

final employeeListProvider =
    StateNotifierProvider<EmployeeListNotifier, List<Employee>>(
  (ref) => EmployeeListNotifier(emp: DashboardPublic(DashboardPrivate())),
);
