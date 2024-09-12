import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_dashboard/model/employee_drop_down_items_model.dart';
import 'package:hr_dashboard/services/dashboard_private.dart';
import 'package:hr_dashboard/services/dashboard_public.dart';

class EmployeeDropDownItemsNotifier
    extends StateNotifier<EmployeeDropDownItemsModel> {
  final DashboardPublic dp;
  EmployeeDropDownItemsNotifier(this.dp)
      : super(EmployeeDropDownItemsModel(officeItems: [], jobTitleItems: []));

  Future<void> getMenuItems() async {
    state = await dp.getEmployeeDropDownItems();
  }
}

final employeeDropDownItemsProvider = StateNotifierProvider<
    EmployeeDropDownItemsNotifier, EmployeeDropDownItemsModel>((ref) {
  return EmployeeDropDownItemsNotifier(DashboardPublic(DashboardPrivate()));
});
