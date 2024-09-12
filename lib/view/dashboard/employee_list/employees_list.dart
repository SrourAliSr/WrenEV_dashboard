import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_dashboard/model/employee_model.dart';
import 'package:hr_dashboard/view/dashboard/employee_list/employee_tile.dart';
import 'package:hr_dashboard/view/widgets/employee_table/employee_head_row.dart';
import 'package:hr_dashboard/view/widgets/employee_table/employee_number_row.dart';
import 'package:hr_dashboard/view_model/employee_list_notifier.dart';

class EmployeesList extends ConsumerStatefulWidget {
  final String? searchedName;
  const EmployeesList({required this.searchedName, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EmployeesListState();
}

class _EmployeesListState extends ConsumerState<EmployeesList> {
  int startRange = 0;
  int endRange = 8;

  @override
  void initState() {
    _fetchEmployee();
    super.initState();
  }

  void _fetchEmployee() {
    ref
        .read(employeeListProvider.notifier)
        .getEmployeesList(widget.searchedName, startRange, endRange);
  }

  @override
  void didUpdateWidget(covariant EmployeesList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.searchedName != oldWidget.searchedName) {
      _fetchEmployee();
    }
  }

  @override
  Widget build(BuildContext context) {
    final employeeList = ref.watch(employeeListProvider);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadRow(),
          ...List.generate(employeeList.length, (index) {
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
              _fetchEmployee();
            },
          ),
        ],
      ),
    );
  }
}
