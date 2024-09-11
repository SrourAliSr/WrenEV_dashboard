import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hr_dashboard/view/widgets/drop_down_menu/months_dd_menu_widget.dart';
import 'package:hr_dashboard/view/widgets/legeneds/graph_legends.dart';
import 'package:hr_dashboard/view/widgets/line_chart/team_performance_chart.dart';

class LineChartPanel extends StatefulWidget {
  const LineChartPanel({super.key});

  @override
  State<LineChartPanel> createState() => _LineChartPanelState();
}

class _LineChartPanelState extends State<LineChartPanel> {
  int beforeXMonths = 12;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const AutoSizeText(
          'Team Performance',
          maxLines: 1,
          maxFontSize: 20,
          minFontSize: 15,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const GraphLegends(color: Color(0xFFFFC837), title: 'Project Team'),
            const SizedBox(
              width: 30,
            ),
            const GraphLegends(color: Color(0xFF0CAF60), title: 'product Team'),
            if (size.width >= 990) const Spacer(),
            if (size.width >= 990)
              MonthsDropDownMenuWidget(
                beforeXMonths: (x) {
                  setState(() {
                    beforeXMonths = x;
                  });
                },
              ),
          ],
        ),
        if (size.width < 990)
          const SizedBox(
            height: 24,
          ),
        if (size.width < 990)
          MonthsDropDownMenuWidget(
            beforeXMonths: (x) {
              setState(() {
                beforeXMonths = x;
              });
            },
          ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: TeamPerformanceChart(
            beforeXMonths: beforeXMonths,
          ),
        ),
      ],
    );
  }
}
