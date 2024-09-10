import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MonthsDropDownMenuWidget extends StatefulWidget {
  const MonthsDropDownMenuWidget({super.key});

  @override
  State<MonthsDropDownMenuWidget> createState() =>
      _MonthsDropDownMenuWidgetState();
}

class _MonthsDropDownMenuWidgetState extends State<MonthsDropDownMenuWidget> {
  int monthIndex = 11;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: (size.width >= 990) ? 125 : size.width * 0.8,
      constraints: BoxConstraints(
        maxWidth: (size.width >= 990) ? 125 : size.width * 0.8,
        maxHeight: 40,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 213, 213, 213),
        ),
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: DropdownButton<int>(
        icon: const Icon(
          Icons.calendar_month_outlined,
          size: 16,
        ),
        isExpanded: true,
        underline: const SizedBox(),
        value: monthIndex,
        items: List.generate(
          12,
          (index) {
            return DropdownMenuItem(
              value: index,
              child: AutoSizeText(
                'Last ${index + 1} months',
                maxFontSize: 12,
                minFontSize: 9,
              ),
            );
          },
        ),
        onChanged: (value) {
          if (value != null) {
            setState(
              () {
                monthIndex = value;
              },
            );
          }
        },
      ),
    );
  }
}
