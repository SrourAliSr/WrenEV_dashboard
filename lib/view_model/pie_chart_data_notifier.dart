import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_dashboard/model/pie_chart_data_model.dart';
import 'package:hr_dashboard/services/employee_private.dart';
import 'package:hr_dashboard/services/employee_public.dart';

class PieChartDataNotifier extends StateNotifier<PieChartData> {
  final EmployeePublic emp;

  PieChartDataNotifier(this.emp)
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
    state = await emp.fetchJobSummary(timeInterval);
  }
}

final pieChartDataProvider =
    StateNotifierProvider<PieChartDataNotifier, PieChartData>((ref) {
  return PieChartDataNotifier(EmployeePublic(EmployeePrivate()));
});
