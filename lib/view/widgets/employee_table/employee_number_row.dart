import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_dashboard/view_model/number_row_list_notifier.dart';
import 'package:pagination_flutter/pagination.dart';

class EmployeeNumberRow extends ConsumerStatefulWidget {
  final void Function(int multiplier) nextPage;
  const EmployeeNumberRow({
    super.key,
    required this.nextPage,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EmployeeNumberRowState();
}

class _EmployeeNumberRowState extends ConsumerState<EmployeeNumberRow> {
  int selectedPage = 1;

  @override
  void initState() {
    ref.read(numberRowListProvider.notifier).getEmployeeCount();
    super.initState();
  }

  void setSelectedPage(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final numberRowData = ref.watch(numberRowListProvider);
    final int listLength = numberRowData;
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
