import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hr_dashboard/view/dashboard/employee_list/employees_list.dart';
import 'package:hr_dashboard/view/widgets/drop_down_menu/generic_drop_down_menu.dart';
import 'package:hr_dashboard/view/widgets/searchBar/search_bar_widget.dart';

class EmployeeListPanel extends StatelessWidget {
  const EmployeeListPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    const double horizantalSpace = 24;

    return Container(
      width: (size.width >= 990) ? size.width * 0.63 : size.width * 0.9,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                'Employee',
                maxFontSize: 32,
                minFontSize: 24,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SearchBarWidget(
                isIconPrefix: false,
                withBorders: true,
              ),
            ],
          ),
          SizedBox(
            height: horizantalSpace,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GenericDropDownMenue(
                menuItems: ["All Offices", "Unpixel Office"],
                menuLength: 2,
              ),
              GenericDropDownMenue(
                menuItems: [
                  "All Job Titles",
                  "UI UX Designer",
                  "Graphic Designer"
                ],
                menuLength: 3,
              ),
              GenericDropDownMenue(
                menuItems: [
                  "All Status",
                ],
                menuLength: 1,
              ),
            ],
          ),
          SizedBox(
            height: horizantalSpace,
          ),
          EmployeesList(),
        ],
      ),
    );
  }
}
