import 'package:flutter/material.dart';

class GraphLegends extends StatelessWidget {
  final Color color;
  final String title;
  const GraphLegends({super.key, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 4,
          backgroundColor: color,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(title),
      ],
    );
  }
}
