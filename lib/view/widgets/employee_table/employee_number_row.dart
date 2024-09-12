import 'package:flutter/material.dart';
import 'package:hr_dashboard/services/employee_private.dart';
import 'package:hr_dashboard/services/employee_public.dart';
import 'package:pagination_flutter/pagination.dart';

class EmployeeNumberRow extends StatefulWidget {
  final void Function(int multiplier) nextPage;
  const EmployeeNumberRow({
    super.key,
    required this.nextPage,
  });

  @override
  State<EmployeeNumberRow> createState() => _EmployeeNumberRowState();
}

class _EmployeeNumberRowState extends State<EmployeeNumberRow> {
  EmployeePublic emp = EmployeePublic(EmployeePrivate());

  int selectedPage = 1;

  void setSelectedPage(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: emp.getEmployeeCount,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final int listLength = snapshot.data!;
            final numberRowLength = (listLength / 8).round();
            return Pagination(
              numOfPages: numberRowLength,
              selectedPage: selectedPage,
              pagesVisible: (numberRowLength > 5) ? 5 : numberRowLength,
              onPageChanged: (page) {
                widget.nextPage(page);

                setState(() {
                  selectedPage = page;
                });
              },
              nextIcon: const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFFA0AEC0),
                size: 14,
              ),
              previousIcon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xFFA0AEC0),
                size: 14,
              ),
              activeTextStyle: const TextStyle(
                color: Color(0xFF111827),
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              activeBtnStyle: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFFF8F8F8)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              inactiveBtnStyle: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
              ),
              inactiveTextStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xFF111827),
                fontWeight: FontWeight.w700,
              ),
            );
          } else {
            return const SizedBox();
          }
        });
  }
}
