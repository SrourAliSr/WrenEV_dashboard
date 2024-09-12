import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_dashboard/model/pie_chart_data_model.dart';
import 'package:hr_dashboard/services/employee_private.dart';
import 'package:hr_dashboard/services/employee_public.dart';

class EmployeePieChartNotifier extends StateNotifier<PieChartData> {
  final EmployeePublic emp;

  EmployeePieChartNotifier(this.emp)
      : super(
          PieChartData(
            title: '',
            titleNumber: 0,
            firstPointTitle: '',
            firstPoint: 0,
            secondPointTitle: '',
            secondPoint: 0,
            thirdPointTitle: '',
            thirdPoint: 0,
          ),
        );

  Future<void> getPieChartData(int timeInterval) async {
    state = await emp.fetchEmployeeChartData(timeInterval);
  }
}

final employeeChartDataProvider =
    StateNotifierProvider<EmployeePieChartNotifier, PieChartData>((ref) {
  return EmployeePieChartNotifier(EmployeePublic(EmployeePrivate()));
});
