import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SummaryPieChart extends StatefulWidget {
  final List<double> data;
  final List<Color> colors;
  final String midText;
  final String midTextValue;
  const SummaryPieChart(
      {super.key,
      required this.data,
      required this.midText,
      required this.midTextValue,
      required this.colors});

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
            sections: List.generate(
              widget.data.length,
              (index) => _pSectionData(
                radius: 35,
                value: widget.data[index],
                color: widget.colors[index],
                index: index,
              ),
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.midTextValue,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Text(
              widget.midText,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
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
