import 'package:flutter/material.dart';
import 'package:hr_dashboard/model/employee_statistics_model.dart';
import 'package:hr_dashboard/services/employee_private.dart';
import 'package:hr_dashboard/services/employee_public.dart';
import 'package:hr_dashboard/view/dashboard/emoplyee_statistics/line_chart_panel.dart';
import 'package:hr_dashboard/view/widgets/emplaoyee%20statistics/employee_statistics_widget.dart';

class WideStatisticsPanel extends StatefulWidget {
  const WideStatisticsPanel({super.key});

  @override
  State<WideStatisticsPanel> createState() => _WideStatisticsPanelState();
}

class _WideStatisticsPanelState extends State<WideStatisticsPanel> {
  final EmployeePublic emp = EmployeePublic(EmployeePrivate());
  int timeInterval = 12;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: emp.fetchEmployeeStatistics(timeInterval),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final EmployeeStatisticsModel data =
              snapshot.data as EmployeeStatisticsModel;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      EmployeeStatisticsWidget(
                        statisticalNumber: data.totalEmployees,
                        widgetTitle: 'Total Employees',
                        imageAssetPath: 'assets/icons/users.png',
                        changedPercentage: data.totalEmployeesPercentage,
                      ),
                      Container(
                        height: size.height * 0.3,
                        width: 1,
                        color: const Color.fromARGB(169, 197, 196, 196),
                      ),
                      EmployeeStatisticsWidget(
                        statisticalNumber: data.jobApplicants,
                        widgetTitle: 'Job Applicants',
                        imageAssetPath: 'assets/icons/briefcase.png',
                        changedPercentage: data.jobApplicationsPercentagel,
                      ),
                    ],
                  ),
                  Container(
                    width: size.width * 0.4,
                    height: 1,
                    alignment: Alignment.centerLeft,
                    color: const Color.fromARGB(169, 197, 196, 196),
                  ),
                  Row(
                    children: [
                      EmployeeStatisticsWidget(
                        statisticalNumber: data.newEmployees,
                        widgetTitle: 'New Employees',
                        imageAssetPath: 'assets/icons/plus.png',
                        changedPercentage: data.newEmployeesPercentagel,
                      ),
                      Container(
                        height: size.height * 0.3,
                        width: 1,
                        color: const Color.fromARGB(169, 197, 196, 196),
                      ),
                      EmployeeStatisticsWidget(
                        statisticalNumber: data.resignedEmployees,
                        widgetTitle: 'Resigned Employees',
                        imageAssetPath: 'assets/icons/minus.png',
                        changedPercentage: data.resignedEmployeesPercentagel,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: size.width * 0.4,
                height: size.height * 0.58,
                child: LineChartPanel(
                  setTimeInterval: (interval) {
                    setState(() {
                      timeInterval = interval;
                    });
                  },
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
