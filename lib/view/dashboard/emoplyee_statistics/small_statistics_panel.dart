import 'package:flutter/material.dart';
import 'package:hr_dashboard/view/dashboard/emoplyee_statistics/line_chart_panel.dart';
import 'package:hr_dashboard/view/widgets/emplaoyee%20statistics/employee_statistics_widget.dart';

class SmallStatisticsPanel extends StatelessWidget {
  const SmallStatisticsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const EmployeeStatisticsWidget(
          statisticalNumber: 3540,
          widgetTitle: 'Total Employees',
          imageAssetPath: 'assets/icons/users.png',
          changedPercentage: 25.5,
        ),
        Container(
          width: size.width * 0.8,
          height: 1,
          color: const Color.fromARGB(169, 197, 196, 196),
        ),
        const EmployeeStatisticsWidget(
          statisticalNumber: 3540,
          widgetTitle: 'Job Applicants',
          imageAssetPath: 'assets/icons/briefcase.png',
          changedPercentage: 25.5,
        ),
        Container(
          width: size.width * 0.8,
          height: 1,
          color: const Color.fromARGB(169, 197, 196, 196),
        ),
        const EmployeeStatisticsWidget(
          statisticalNumber: 3540,
          widgetTitle: 'New Employees',
          imageAssetPath: 'assets/icons/plus.png',
          changedPercentage: 25.5,
        ),
        Container(
          width: size.width * 0.8,
          height: 1,
          color: const Color.fromARGB(169, 197, 196, 196),
        ),
        const EmployeeStatisticsWidget(
          statisticalNumber: 93,
          widgetTitle: 'Resigned Employees',
          imageAssetPath: 'assets/icons/minus.png',
          changedPercentage: -25.5,
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
          child: const LineChartPanel(),
        ),
      ],
    );
  }
}
