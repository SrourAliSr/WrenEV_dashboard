import 'package:flutter/material.dart';
import 'package:hr_dashboard/view/dashboard/emoplyee_statistics/small_statistics_panel.dart';
import 'package:hr_dashboard/view/dashboard/emoplyee_statistics/wide_statistics_panel.dart';

class EmployeeStatisticsPanel extends StatelessWidget {
  const EmployeeStatisticsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: (size.width > 990)
          ? const WideStatisticsPanel()
          : const SmallStatisticsPanel(),
    );
  }
}
