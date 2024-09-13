import 'package:flutter/material.dart';
import 'package:hr_dashboard/view/widgets/employee_table/employee_head_row_title.dart';

class HeadRow extends StatefulWidget {
  final void Function(bool check) checkAllEmployees;
  const HeadRow({super.key, required this.checkAllEmployees});

  @override
  State<HeadRow> createState() => _HeadRowState();
}

class _HeadRowState extends State<HeadRow> {
  bool isChecked = false;
  static const _headItems = [
    EmployeeHeadRowTitles(title: 'Employee Name'),
    EmployeeHeadRowTitles(title: 'Job Title'),
    EmployeeHeadRowTitles(title: 'Line Manager'),
    EmployeeHeadRowTitles(title: 'Department'),
    EmployeeHeadRowTitles(title: 'Office'),
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: (size.width >= 990) ? size.width * 0.68 : size.width * 0.95,
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: ListTile(
          tileColor: Colors.grey,
          leading: Checkbox(
            value: isChecked,
            side: const BorderSide(
                color: Color(
                  0xFFCBD5E0,
                ),
                width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            onChanged: (value) {
              widget.checkAllEmployees(value!);
              setState(
                () {
                  isChecked = value;
                },
              );
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              5,
              (index) => _headItems[index],
            ),
          )),
    );
  }
}
