import 'package:flutter/material.dart';
import 'package:hr_dashboard/model/pie_chart_data_model.dart';
import 'package:hr_dashboard/services/employee_private.dart';
import 'package:hr_dashboard/services/employee_public.dart';
import 'package:hr_dashboard/view/widgets/drop_down_menu/months_dd_menu_widget.dart';
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
              _PieContainer(
                containerTitle: 'Total Employee',
              ),
              _PieContainer(
                containerTitle: 'Job Summary',
              ),
            ],
          )
        : const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _PieContainer(
                containerTitle: 'Total Employee',
              ),
              _PieContainer(
                containerTitle: 'Job Summary',
              ),
            ],
          );
  }
}

class _PieContainer extends StatefulWidget {
  final String containerTitle;
  const _PieContainer({required this.containerTitle});

  @override
  State<_PieContainer> createState() => _PieContainerState();
}

class _PieContainerState extends State<_PieContainer> {
  EmployeePublic emp = EmployeePublic(EmployeePrivate());
  int timeInterval = 0;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: (size.width >= 990) ? size.width * 0.25 : size.width * 0.8,
      height: 350,
      margin: (size.width >= 990)
          ? const EdgeInsets.only(bottom: 20)
          : const EdgeInsets.only(top: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: FutureBuilder(
        future: (widget.containerTitle == 'Total Employee')
            ? emp.fetchEmployeeChartData(timeInterval)
            : emp.fetchJobSummary(timeInterval),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return _PieChartRepresentation(
              data: data,
              containerTitle: widget.containerTitle,
              updateInterval: (interval) {
                setState(() {
                  timeInterval = interval;
                });
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class _PieChartRepresentation extends StatelessWidget {
  final PieChartData data;
  final String containerTitle;
  final void Function(int interval) updateInterval;
  const _PieChartRepresentation({
    required this.data,
    required this.containerTitle,
    required this.updateInterval,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              containerTitle,
              style: const TextStyle(fontSize: 20, color: Color(0xFF111827)),
            ),
            Flexible(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 150, minWidth: 30),
                child: MonthsDropDownMenuWidget(
                  beforeXMonths: (x) {
                    updateInterval(x);
                  },
                  isAllTime: true,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 120,
          child: SummaryPieChart(
            data: [data.firstPoint, data.secondPoint, data.thirdPoint],
            midText: data.title,
            midTextValue: '${data.titleNumber}',
            colors: const [
              Color(0xFFFFC837),
              Color.fromARGB(255, 55, 255, 105),
              Color.fromARGB(255, 55, 68, 255),
            ],
          ),
        ),
        _Legends(
          color: const Color(0xFFFFC837),
          title: data.firstPointTitle,
          value: data.firstPoint.round(),
        ),
        _Legends(
          color: const Color.fromARGB(255, 55, 255, 105),
          title: data.secondPointTitle,
          value: data.secondPoint.round(),
        ),
        _Legends(
          color: const Color.fromARGB(255, 55, 68, 255),
          title: data.thirdPointTitle,
          value: data.thirdPoint.round(),
        ),
      ],
    );
  }
}

class _Legends extends StatelessWidget {
  final Color color;
  final String title;
  final int value;
  const _Legends(
      {required this.color, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GraphLegends(color: color, title: title),
        Text('$value'),
      ],
    );
  }
}
