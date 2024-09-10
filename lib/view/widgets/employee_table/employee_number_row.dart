import 'package:flutter/material.dart';
import 'package:pagination_flutter/pagination.dart';

class EmployeeNumberRow extends StatefulWidget {
  const EmployeeNumberRow({super.key});

  @override
  State<EmployeeNumberRow> createState() => _EmployeeNumberRowState();
}

class _EmployeeNumberRowState extends State<EmployeeNumberRow> {
  int selectedPage = 1;
  setSelectedPage(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Pagination(
      numOfPages: 10,
      selectedPage: selectedPage,
      pagesVisible: 5,
      onPageChanged: (page) {
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
        backgroundColor: MaterialStateProperty.all(const Color(0xFFF8F8F8)),
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
  }
}
