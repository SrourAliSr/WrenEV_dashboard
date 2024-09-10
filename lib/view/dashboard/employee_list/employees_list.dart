import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hr_dashboard/view/dashboard/employee_list/employee_tile.dart';
import 'package:hr_dashboard/view/widgets/employee_table/employee_head_row.dart';
import 'package:hr_dashboard/view/widgets/employee_table/employee_number_row.dart';

class EmployeesList extends StatefulWidget {
  const EmployeesList({super.key});

  @override
  State<EmployeesList> createState() => _EmployeesListState();
}

class _EmployeesListState extends State<EmployeesList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadRow(),
          ...List.generate(
              8,
              (index) => const EmployeeTile(
                    name: 'Pristia Candra',
                    email: 'lincoln@unpixel.com',
                    jobTitle: 'UI/UX Designer',
                    lineManager: '@Pristiacandra',
                    department: 'Team Product',
                    office: 'Unpixel Office',
                  )),
          const EmployeeNumberRow(),
        ],
      ),
    );
  }
}
