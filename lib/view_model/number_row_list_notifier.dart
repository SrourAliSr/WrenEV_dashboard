import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_dashboard/services/dashboard_private.dart';
import 'package:hr_dashboard/services/dashboard_public.dart';

class NumberRowListNotifier extends StateNotifier<int> {
  final DashboardPublic emp;
  NumberRowListNotifier(this.emp) : super(0);

  Future<void> getEmployeeCount() async {
    final int count = await emp.getEmployeeCount;
    state = count;
  }
}

final numberRowListProvider = StateNotifierProvider<NumberRowListNotifier, int>(
  (ref) => NumberRowListNotifier(
    DashboardPublic(
      DashboardPrivate(),
    ),
  ),
);
