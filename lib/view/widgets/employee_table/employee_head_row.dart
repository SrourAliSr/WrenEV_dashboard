import 'package:flutter/material.dart';
import 'package:hr_dashboard/view/widgets/employee_table/employee_head_row_title.dart';

class HeadRow extends StatefulWidget {
  const HeadRow({super.key});

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
      width: (size.width >= 990) ? size.width * 0.6 : size.width * 0.85,
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
              setState(
                () {
                  isChecked = value!;
                },
              );
            },
          ),
          title: SizedBox(
            height: 30,
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              slivers: [
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount: _headItems.length, (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    child: _headItems[index],
                  );
                }))
              ],
            ),
          )),
    );
  }
}
