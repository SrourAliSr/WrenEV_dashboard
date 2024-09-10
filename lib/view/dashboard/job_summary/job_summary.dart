import 'package:flutter/material.dart';
import 'package:hr_dashboard/view/widgets/legeneds/graph_legends.dart';
import 'package:hr_dashboard/view/widgets/pie_chart/pie_chart.dart';

class JobSummary extends StatelessWidget {
  const JobSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return (size.width >= 990 || size.width < 980)
        ? const Column(
            children: [
              _PieContainer(),
              _PieContainer(),
            ],
          )
        : const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _PieContainer(),
              _PieContainer(),
            ],
          );
  }
}

class _PieContainer extends StatelessWidget {
  const _PieContainer();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: (size.width >= 990) ? size.width * 0.25 : size.width * 0.8,
      height: 320,
      margin: (size.width >= 990)
          ? const EdgeInsets.only(bottom: 20)
          : const EdgeInsets.only(top: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Employe',
                style: TextStyle(fontSize: 20, color: Color(0xFF111827)),
              ),
              DropdownButton(
                items: const [
                  DropdownMenuItem(
                      child: Text(
                    'All Time',
                    style: TextStyle(color: Color(0xFF687588)),
                  )),
                ],
                icon: const Icon(Icons.expand_more),
                underline: const SizedBox(),
                onChanged: (value) {},
              ),
            ],
          ),
          const SizedBox(height: 120, child: SummaryPieChart()),
          const GraphLegends(color: Color(0xFFFFC837), title: 'Project Team'),
          const GraphLegends(
              color: Color.fromARGB(255, 55, 255, 105), title: 'Project Team'),
          const GraphLegends(
              color: Color.fromARGB(255, 55, 68, 255), title: 'Project Team'),
        ],
      ),
    );
  }
}
