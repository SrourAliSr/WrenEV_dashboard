import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hr_dashboard/view/dashboard/emoplyee_statistics/line_chart_panel.dart';
import 'package:hr_dashboard/view/widgets/emplaoyee%20statistics/employee_statistics_widget.dart';
import 'package:hr_dashboard/view_model/employee_statistics_notifier.dart';

class SmallStatisticsPanel extends ConsumerStatefulWidget {
  const SmallStatisticsPanel({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SmallStatisticsPanelState();
}

class _SmallStatisticsPanelState extends ConsumerState<SmallStatisticsPanel> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        EmployeeStatisticsWidget(
          statisticalNumber: data.totalEmployees,
          widgetTitle: 'Total Employees',
          imageAssetPath: 'assets/icons/users.png',
          changedPercentage: data.totalEmployeesPercentage,
        ),
        Container(
          width: size.width * 0.8,
          height: 1,
          color: const Color.fromARGB(169, 197, 196, 196),
        ),
        EmployeeStatisticsWidget(
          statisticalNumber: data.jobApplicants,
          widgetTitle: 'Job Applicants',
          imageAssetPath: 'assets/icons/briefcase.png',
          changedPercentage: data.jobApplicationsPercentagel,
        ),
        Container(
          width: size.width * 0.8,
          height: 1,
          color: const Color.fromARGB(169, 197, 196, 196),
        ),
        EmployeeStatisticsWidget(
          statisticalNumber: data.newEmployees,
          widgetTitle: 'New Employees',
          imageAssetPath: 'assets/icons/plus.png',
          changedPercentage: data.newEmployeesPercentagel,
        ),
        Container(
          width: size.width * 0.8,
          height: 1,
          color: const Color.fromARGB(169, 197, 196, 196),
        ),
        EmployeeStatisticsWidget(
          statisticalNumber: data.resignedEmployees,
          widgetTitle: 'Resigned Employees',
          imageAssetPath: 'assets/icons/minus.png',
          changedPercentage: data.resignedEmployeesPercentagel,
        ),
        Container(
          width: size.width * 0.8,
          height: 1,
          color: const Color.fromARGB(169, 197, 196, 196),
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          width: size.width * 0.8,
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
