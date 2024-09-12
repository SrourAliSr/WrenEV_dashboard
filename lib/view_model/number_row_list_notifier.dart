import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_dashboard/services/employee_private.dart';
import 'package:hr_dashboard/services/employee_public.dart';

class NumberRowListNotifier extends StateNotifier<int> {
  final EmployeePublic emp;
  NumberRowListNotifier(this.emp) : super(0);

  Future<void> getEmployeeCount() async {
    final int count = await emp.getEmployeeCount;
    state = count;
  }
}

final numberRowListProvider = StateNotifierProvider<NumberRowListNotifier, int>(
  (ref) => NumberRowListNotifier(
    EmployeePublic(
      EmployeePrivate(),
    ),
  ),
);
