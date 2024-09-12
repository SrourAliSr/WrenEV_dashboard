import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_dashboard/model/employee_model.dart';
import 'package:hr_dashboard/services/employee_private.dart';
import 'package:hr_dashboard/services/employee_public.dart';

class EmployeeListNotifier extends StateNotifier<List<Employee>> {
  final EmployeePublic emp;
  EmployeeListNotifier({required this.emp}) : super([]);

  Future<void> getEmployeesList(
      String? searchedName, int startRange, int endRange) async {
    final employee =
        await emp.fetchEmployees(searchedName, startRange, endRange);
    state = employee;
  }
}

final employeeListProvider =
    StateNotifierProvider<EmployeeListNotifier, List<Employee>>(
  (ref) => EmployeeListNotifier(emp: EmployeePublic(EmployeePrivate())),
);
