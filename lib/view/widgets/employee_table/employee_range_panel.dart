import 'package:flutter/material.dart';

class EmployeeRangePanel extends StatefulWidget {
  final void Function(int maxRange) changeRange;
  const EmployeeRangePanel({super.key, required this.changeRange});

  @override
  State<EmployeeRangePanel> createState() => _EmployeeRangePanelState();
}

class _EmployeeRangePanelState extends State<EmployeeRangePanel> {
  int currentIndex = 7;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'showing 1 to ${currentIndex + 1}',
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          width: 90,
          height: 40,
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
            isExpanded: true,
            icon: const Icon(
              Icons.expand_more,
            ),
            underline: const SizedBox(),
            value: currentIndex,
            items: List.generate(
              8,
              (index) {
                return DropdownMenuItem(
                  value: index,
                  child: Text(
                    'show ${index + 1}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                );
              },
            ),
            onChanged: (value) {
              if (value != null) {
                widget.changeRange(value);
                setState(
                  () {
                    currentIndex = value;
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
