import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_dashboard/model/employee_drop_down_items_model.dart';
import 'package:hr_dashboard/view/dashboard/employee_list/employees_list.dart';
import 'package:hr_dashboard/view/widgets/drop_down_menu/generic_drop_down_menu.dart';
import 'package:hr_dashboard/view/widgets/searchBar/search_bar_widget.dart';
import 'package:hr_dashboard/view_model/employee_drop_down_notifier.dart';

class EmployeeListPanel extends ConsumerStatefulWidget {
  const EmployeeListPanel({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EmployeeListPanelState();
}

class _EmployeeListPanelState extends ConsumerState<EmployeeListPanel> {
  late final TextEditingController _controller;
  int officeIndex = 0;
  int jobTitleIndex = 0;

  String? searchedName;

  @override
  void initState() {
    _controller = TextEditingController();
    _fetchData();
    _controller.addListener(() {
      setState(() {
        searchedName = _controller.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _fetchData() {
    ref.read(employeeDropDownItemsProvider.notifier).getMenuItems();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final EmployeeDropDownItemsModel data =
        ref.watch(employeeDropDownItemsProvider);
    const double horizantalSpace = 24;

    return Container(
      width: (size.width >= 990) ? size.width * 0.63 : size.width * 0.9,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AutoSizeText(
                'Employee',
                maxFontSize: 32,
                minFontSize: 24,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SearchBarWidget(
                isIconPrefix: false,
                withBorders: true,
                controller: _controller,
              ),
            ],
          ),
          const SizedBox(
            height: horizantalSpace,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GenericDropDownMenue(
                menuItems: data.officeItems,
                menuLength: data.officeItems.length,
                type: 'office',
                selectedIndex: (selectedIndex) => setState(() {
                  officeIndex = selectedIndex;
                }),
              ),
              GenericDropDownMenue(
                menuItems: data.jobTitleItems,
                menuLength: data.jobTitleItems.length,
                type: 'Job Title',
                selectedIndex: (selectedIndex) => setState(() {
                  jobTitleIndex = selectedIndex;
                }),
              ),
              GenericDropDownMenue(
                menuItems: const [
                  "All Status",
                ],
                menuLength: 1,
                type: "Status",
                selectedIndex: (selectedIndex) => 0,
              ),
            ],
          ),
          const SizedBox(
            height: horizantalSpace,
          ),
          EmployeesList(
            searchedName: searchedName,
            office:
                (officeIndex != 0) ? data.officeItems[officeIndex - 1] : 'All',
            jobTitle: (jobTitleIndex != 0)
                ? data.jobTitleItems[jobTitleIndex - 1]
                : 'All',
          ),
        ],
      ),
    );
  }
}
