import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SummaryPieChart extends StatefulWidget {
  const SummaryPieChart({super.key});

  @override
  State<SummaryPieChart> createState() => _SummaryPieChartState();
}

class _SummaryPieChartState extends State<SummaryPieChart> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PieChart(
          PieChartData(
            centerSpaceRadius: 40,
            sectionsSpace: 7,
            pieTouchData: PieTouchData(
              touchCallback: (event, pieTouchResponse) {
                if (pieTouchResponse != null &&
                    pieTouchResponse.touchedSection != null &&
                    event.isInterestedForInteractions) {
                  setState(() {
                    selectedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                } else {
                  selectedIndex = -1;
                }
              },
            ),
            sections: [
              _pSectionData(
                radius: 35,
                value: 10,
                color: Colors.red,
                index: 0,
              ),
              _pSectionData(
                radius: 35,
                color: Colors.yellow,
                value: 50,
                index: 1,
              ),
              _pSectionData(
                radius: 35,
                color: Colors.orange,
                value: 20,
                index: 2,
              ),
              _pSectionData(
                radius: 35,
                color: Colors.blue,
                value: 10,
                index: 3,
              ),
              _pSectionData(
                radius: 35,
                color: Colors.purple,
                value: 10,
                index: 4,
              ),
            ],
          ),
        ),
        const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '121',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Text(
              'Total Emp',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        )
      ],
    );
  }

  PieChartSectionData _pSectionData(
      {required Color color,
      required double value,
      required double radius,
      required int index}) {
    return PieChartSectionData(
      title: '',
      value: value,
      color: color,
      radius: (selectedIndex == index) ? radius * 1.25 : radius,
    );
  }
}
