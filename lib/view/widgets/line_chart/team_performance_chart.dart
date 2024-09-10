import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hr_dashboard/services/employee_private.dart';
import 'package:hr_dashboard/services/employee_public.dart';

class TeamPerformanceChart extends StatelessWidget {
  const TeamPerformanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    EmployeePublic emp = EmployeePublic(EmployeePrivate());
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return FutureBuilder(
      future: emp.fetchSalary(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final Map data = snapshot.data as Map;
          return LineChart(
            LineChartData(
              minX: 0,
              maxX: 6,
              minY: 0,
              maxY: 60000,
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();

                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        child: Text(months[index]),
                      );
                    },
                  ),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  // spots: [
                  //   const FlSpot(0, 41000),
                  //   const FlSpot(2, 51000),
                  //   const FlSpot(3, 21000),
                  //   const FlSpot(3, 45000),
                  //   const FlSpot(6, 60000),
                  // ],
                  spots: List.generate(data['product']!.length, (index) {
                    final salary = data['product']![index]['salary'];
                    final months = double.parse(
                        DateTime.parse(data['product']![index]['date'])
                            .month
                            .toString());

                    return FlSpot(months, salary);
                  }),
                  dotData: const FlDotData(show: false),
                  color: const Color(0xFFFFC837),
                  barWidth: 2,
                  isCurved: true,
                  curveSmoothness: 0.3,
                ),
                LineChartBarData(
                  spots: [
                    const FlSpot(0, 10000),
                    const FlSpot(1, 2000),
                    const FlSpot(2, 18000),
                    const FlSpot(3, 15000),
                    const FlSpot(4, 20000),
                    const FlSpot(5, 22000),
                    const FlSpot(6, 30000),
                  ],
                  dotData: const FlDotData(show: false),
                  color: const Color(0xFF0CAF60),
                  barWidth: 2,
                  isCurved: true,
                  curveSmoothness: 0.3,
                ),
              ],
              gridData: FlGridData(
                drawHorizontalLine: false,
                drawVerticalLine: true,
                verticalInterval: 1,
                horizontalInterval: 1,
                getDrawingVerticalLine: (value) {
                  return const FlLine(
                    color: Color(0xFFF1F2F4),
                    strokeWidth: 1,
                  );
                },
                show: true,
              ),
              borderData: FlBorderData(
                show: false,
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
