import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hr_dashboard/model/employee_model.dart';
import 'package:hr_dashboard/services/employee_private.dart';
import 'package:hr_dashboard/services/employee_public.dart';
import 'package:hr_dashboard/view/dashboard/employee_list/employee_tile.dart';
import 'package:hr_dashboard/view/widgets/employee_table/employee_head_row.dart';
import 'package:hr_dashboard/view/widgets/employee_table/employee_number_row.dart';

class EmployeesList extends StatefulWidget {
  final String? searchedName;
  const EmployeesList({super.key, required this.searchedName});

  @override
  State<EmployeesList> createState() => _EmployeesListState();
}

class _EmployeesListState extends State<EmployeesList> {
  EmployeePublic emp = EmployeePublic(EmployeePrivate());

  int startRange = 0;
  int endRange = 8;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: emp.fetchEmployees(widget.searchedName, startRange, endRange),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final employeeList = snapshot.data;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const HeadRow(),
                ...List.generate(employeeList!.length, (index) {
                  final Employee employee = employeeList[index];

                  return EmployeeTile(
                    profileUrl: employee.profileUrl,
                    name: employee.name,
                    email: employee.email,
                    jobTitle: employee.jobTitle,
                    lineManager: employee.lineManager,
                    department: employee.department,
                    office: employee.office,
                  );
                }),
                EmployeeNumberRow(
                  nextPage: (m) {
                    setState(() {
                      endRange = (8 * m);
                      startRange = endRange - 8;
                    });
                  },
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
