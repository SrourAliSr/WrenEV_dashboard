import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_dashboard/view/dashboard/emoplyee_statistics/line_chart_panel.dart';
import 'package:hr_dashboard/view/widgets/emplaoyee%20statistics/employee_statistics_widget.dart';
import 'package:hr_dashboard/view_model/employee_statistics_notifier.dart';

class WideStatisticsPanel extends ConsumerStatefulWidget {
  const WideStatisticsPanel({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WideStatisticsPanelState();
}

class _WideStatisticsPanelState extends ConsumerState<WideStatisticsPanel> {
  @override
  void initState() {
    _fetchEmployeeStatistics(12);

    super.initState();
  }

  void _fetchEmployeeStatistics(int interval) {
    ref
        .read(employeeStatisticsProvider.notifier)
        .getEmployeeStatistics(interval);
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(employeeStatisticsProvider);
    final Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                EmployeeStatisticsWidget(
                  statisticalNumber: data.totalEmployees,
                  widgetTitle: 'Total Employees',
                  imageAssetPath: 'assets/icons/users.png',
                  changedPercentage: data.totalEmployeesPercentage,
                ),
                Container(
                  height: size.height * 0.3,
                  width: 1,
                  color: const Color.fromARGB(169, 197, 196, 196),
                ),
                EmployeeStatisticsWidget(
                  statisticalNumber: data.jobApplicants,
                  widgetTitle: 'Job Applicants',
                  imageAssetPath: 'assets/icons/briefcase.png',
                  changedPercentage: data.jobApplicationsPercentagel,
                ),
              ],
            ),
            Container(
              width: size.width * 0.4,
              height: 1,
              alignment: Alignment.centerLeft,
              color: const Color.fromARGB(169, 197, 196, 196),
            ),
            Row(
              children: [
                EmployeeStatisticsWidget(
                  statisticalNumber: data.newEmployees,
                  widgetTitle: 'New Employees',
                  imageAssetPath: 'assets/icons/plus.png',
                  changedPercentage: data.newEmployeesPercentagel,
                ),
                Container(
                  height: size.height * 0.3,
                  width: 1,
                  color: const Color.fromARGB(169, 197, 196, 196),
                ),
                EmployeeStatisticsWidget(
                  statisticalNumber: data.resignedEmployees,
                  widgetTitle: 'Resigned Employees',
                  imageAssetPath: 'assets/icons/minus.png',
                  changedPercentage: data.resignedEmployeesPercentagel,
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        SizedBox(
          width: size.width * 0.4,
          height: size.height * 0.58,
          child: LineChartPanel(
            setTimeInterval: (interval) {
              _fetchEmployeeStatistics(interval);
            },
          ),
        ),
      ],
    );
  }
}
