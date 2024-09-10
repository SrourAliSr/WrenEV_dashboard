import 'package:flutter/material.dart';
import 'package:hr_dashboard/view/dashboard/emoplyee_statistics/line_chart_panel.dart';
import 'package:hr_dashboard/view/widgets/emplaoyee%20statistics/employee_statistics_widget.dart';

class WideStatisticsPanel extends StatelessWidget {
  const WideStatisticsPanel({super.key});

  @override
  Widget build(BuildContext context) {
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
                const EmployeeStatisticsWidget(
                  statisticalNumber: 3540,
                  widgetTitle: 'Total Employees',
                  imageAssetPath: 'assets/icons/users.png',
                  changedPercentage: 25.5,
                ),
                Container(
                  height: size.height * 0.3,
                  width: 1,
                  color: const Color.fromARGB(169, 197, 196, 196),
                ),
                const EmployeeStatisticsWidget(
                  statisticalNumber: 3540,
                  widgetTitle: 'Job Applicants',
                  imageAssetPath: 'assets/icons/briefcase.png',
                  changedPercentage: 25.5,
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
                const EmployeeStatisticsWidget(
                  statisticalNumber: 3540,
                  widgetTitle: 'New Employees',
                  imageAssetPath: 'assets/icons/plus.png',
                  changedPercentage: 25.5,
                ),
                Container(
                  height: size.height * 0.3,
                  width: 1,
                  color: const Color.fromARGB(169, 197, 196, 196),
                ),
                const EmployeeStatisticsWidget(
                  statisticalNumber: 93,
                  widgetTitle: 'Resigned Employees',
                  imageAssetPath: 'assets/icons/minus.png',
                  changedPercentage: -25.5,
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        SizedBox(
          width: size.width * 0.4,
          height: size.height * 0.58,
          child: const LineChartPanel(),
        ),
      ],
    );
  }
}
