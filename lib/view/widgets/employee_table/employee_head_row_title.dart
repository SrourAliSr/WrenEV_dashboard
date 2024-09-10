import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class EmployeeHeadRowTitles extends StatelessWidget {
  final String title;

  const EmployeeHeadRowTitles({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          title,
          maxFontSize: 12,
          minFontSize: 9,
          style: const TextStyle(
              fontWeight: FontWeight.w700, color: Color(0xFF687588)),
        ),
        Icon(
          Icons.unfold_more_outlined,
          size: width * 0.015,
        )
      ],
    );
  }
}
