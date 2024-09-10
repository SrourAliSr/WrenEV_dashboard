import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:hr_dashboard/view/appbars/app_bar.dart';
import 'package:hr_dashboard/view/dashboard/emoplyee_statistics/employee_statistics_panel.dart';
import 'package:hr_dashboard/view/dashboard/employee_list/employee_list_panel.dart';
import 'package:hr_dashboard/view/dashboard/job_summary/job_summary.dart';
import 'package:hr_dashboard/view/drawer/custom_drawer.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({super.key});

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  late final GlobalKey<SliderDrawerState> drawerKey;

  late bool isDrawerClosed;

  @override
  void initState() {
    drawerKey = GlobalKey<SliderDrawerState>();

    isDrawerClosed = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFe5e5e5),
      body: SliderDrawer(
        key: drawerKey,
        isDraggable: false,
        appBar: WideAppBar(
          drawerTriggered: () {
            drawerKey.currentState?.toggle();
            setState(
              () {
                isDrawerClosed = false;
              },
            );
          },
          isDrawerClosed: isDrawerClosed,
        ),
        slider: SliderContent(
          closeDrawer: () {
            drawerKey.currentState?.closeSlider();
            setState(
              () {
                isDrawerClosed = true;
              },
            );
          },
        ),
        child: Container(
          color: const Color(0xFFe5e5e5),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 56.0,
            vertical: 8,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _WelcomeText(),
                const SizedBox(height: 26),
                const EmployeeStatisticsPanel(),
                const SizedBox(height: 26),
                if (size.width >= 990)
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      EmployeeListPanel(),
                      JobSummary(),
                    ],
                  ),
                if (size.width < 990) const EmployeeListPanel(),
                if (size.width < 990) const JobSummary(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WelcomeText extends StatelessWidget {
  const _WelcomeText();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, Parsitia',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'This is your HR report so far',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(
              0xFF687588,
            ),
          ),
        ),
      ],
    );
  }
}
