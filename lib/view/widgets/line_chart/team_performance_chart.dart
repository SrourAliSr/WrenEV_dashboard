import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_dashboard/model/salary_model.dart';
import 'package:hr_dashboard/view_model/salary_notifier.dart';

class TeamPerformanceChart extends ConsumerWidget {
  final int beforeXMonths;
  const TeamPerformanceChart({super.key, required this.beforeXMonths});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Salary data = ref.watch(salaryProvider(beforeXMonths));
    final productList = data.product;
    final projectList = data.project;
    final maxSalary = _findHighestSalary(projectList, productList);
    final List<String> monthLabels = _generateMonthLabels(beforeXMonths);

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: monthLabels.length.toDouble() - 1,
        minY: 0,
        maxY: maxSalary,
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
              reservedSize: 60,
              interval: 1,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();

                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(monthLabels[index]),
                );
              },
            ),
          ),
        ),
        lineBarsData: [
          _charData(projectList, const Color(0xFFFFC837)),
          _charData(productList, const Color(0xFF0CAF60)),
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
  }

  LineChartBarData _charData(List<Map> teamData, Color teamColor) {
    final length = teamData.length;

    return LineChartBarData(
      spots: List.generate(
        length,
        (index) {
          final salary = teamData[index]['salary'];

          return FlSpot(index.toDouble(), salary);
        },
      ),
      dotData: const FlDotData(show: false),
      color: teamColor,
      barWidth: 2,
      isCurved: true,
      curveSmoothness: 0.3,
    );
  }

  double _findHighestSalary(
      List<Map<String, dynamic>> project, List<Map<String, dynamic>> product) {
    double highestSalary = 0;
    for (var item in [...project, ...product]) {
      final salary = item['salary'] as double;
      if (salary > highestSalary) {
        highestSalary = salary;
      }
    }

    return highestSalary + 10000;
  }

  List<String> _generateMonthLabels(int monthsBack) {
    final now = DateTime.now();
    final startMonth = DateTime(now.year, now.month - monthsBack, 1);
    final endMonth = DateTime(now.year, now.month);

    final monthLabels = <String>[];
    for (var date = startMonth;
        date.isBefore(endMonth) || date.month == endMonth.month;
        date = DateTime(date.year, date.month + 1)) {
      monthLabels.add(_monthName(date.month));
    }
    return monthLabels;
  }

  String _monthName(int month) {
    const monthNames = [
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
    return monthNames[month - 1];
  }
}
