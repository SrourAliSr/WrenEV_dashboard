import 'package:flutter/material.dart';

class ItemTiles extends StatelessWidget {
  final String text;
  final IconData iconData;
  const ItemTiles({super.key, required this.text, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: const Color(0xFFA0AEC0),
          size: 20,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
