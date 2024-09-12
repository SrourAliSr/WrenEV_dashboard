import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MonthsDropDownMenuWidget extends StatefulWidget {
  final void Function(int x) beforeXMonths;
  final bool isAllTime;
  const MonthsDropDownMenuWidget({
    super.key,
    required this.beforeXMonths,
    required this.isAllTime,
  });

  @override
  State<MonthsDropDownMenuWidget> createState() =>
      _MonthsDropDownMenuWidgetState();
}

class _MonthsDropDownMenuWidgetState extends State<MonthsDropDownMenuWidget> {
  late int monthIndex;

  @override
  void initState() {
    if (widget.isAllTime) {
      monthIndex = 0;
    } else {
      monthIndex = 11;
    }
    super.initState();
  }

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
      decoration: (!widget.isAllTime)
          ? BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 213, 213, 213),
              ),
              borderRadius: BorderRadius.circular(
                12,
              ),
            )
          : null,
      child: DropdownButton<int>(
        icon: (!widget.isAllTime)
            ? const Icon(
                Icons.calendar_month_outlined,
                size: 16,
              )
            : const Icon(
                Icons.expand_more,
                size: 16,
              ),
        isExpanded: true,
        underline: const SizedBox(),
        value: monthIndex,
        items: List.generate(
          (widget.isAllTime) ? 13 : 12,
          (index) {
            if (widget.isAllTime && index == 0) {
              return DropdownMenuItem(
                value: index,
                child: const AutoSizeText(
                  'All Time',
                  maxFontSize: 12,
                  minFontSize: 9,
                ),
              );
            }

            return DropdownMenuItem(
              value: index,
              child: AutoSizeText(
                'Last ${(widget.isAllTime) ? index : index + 1} months',
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
            if (widget.isAllTime) {
              widget.beforeXMonths(value);
            } else {
              widget.beforeXMonths(value + 1);
            }
          }
        },
      ),
    );
  }
}
