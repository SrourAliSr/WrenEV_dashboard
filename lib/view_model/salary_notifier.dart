import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_dashboard/model/salary_model.dart';
import 'package:hr_dashboard/services/employee_private.dart';
import 'package:hr_dashboard/services/employee_public.dart';

class SalaryNotifier extends StateNotifier<Salary> {
  final EmployeePublic emp;

  SalaryNotifier(this.emp) : super(Salary(product: [], project: []));

  Future<void> getSalary(int timeInterval) async {
    state = await emp.fetchSalary(timeInterval);
  }
}

final salaryProvider =
    StateNotifierProvider.family<SalaryNotifier, Salary, int>(
        (ref, timeInterval) {
  final notifier = SalaryNotifier(EmployeePublic(EmployeePrivate()));

  notifier.getSalary(timeInterval);

  return notifier;
});
