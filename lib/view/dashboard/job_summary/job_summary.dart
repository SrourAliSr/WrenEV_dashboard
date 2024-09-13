import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_dashboard/model/pie_chart_data_model.dart';
import 'package:hr_dashboard/view/widgets/drop_down_menu/months_dd_menu_widget.dart';
import 'package:hr_dashboard/view/widgets/legeneds/graph_legends.dart';
import 'package:hr_dashboard/view/widgets/pie_chart/pie_chart.dart';
import 'package:hr_dashboard/view_model/employee_pie_chart_notifier.dart';
import 'package:hr_dashboard/view_model/pie_chart_data_notifier.dart';

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

class _PieContainer extends ConsumerStatefulWidget {
  final String containerTitle;
  const _PieContainer({required this.containerTitle});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __PieContainerState();
}

class __PieContainerState extends ConsumerState<_PieContainer> {
  int timeInterval = 0;

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  _fetchData() {
    if (widget.containerTitle == 'Total Employee') {
      ref
          .read(employeeChartDataProvider.notifier)
          .getPieChartData(timeInterval);
    } else if (widget.containerTitle == 'Job Summary') {
      ref.read(pieChartDataProvider.notifier).getPieChartData(timeInterval);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    late final PieChartData data;
    if (widget.containerTitle == 'Total Employee') {
      data = ref.watch(employeeChartDataProvider);
    } else if (widget.containerTitle == 'Job Summary') {
      data = ref.watch(pieChartDataProvider);
    }
    return Container(
      width: (size.width >= 990) ? size.width * 0.25 : size.width * 0.8,
      height: 350,
      margin: (size.width >= 990)
          ? const EdgeInsets.only(bottom: 20)
          : const EdgeInsets.only(top: 25),
      decoration: BoxDecoration(
        color: (Theme.of(context).brightness == Brightness.light)
            ? Colors.white
            : const Color.fromARGB(255, 43, 59, 80),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: _PieChartRepresentation(
        data: data,
        containerTitle: widget.containerTitle,
        updateInterval: (interval) {
          setState(() {
            timeInterval = interval;
          });
          _fetchData();
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
