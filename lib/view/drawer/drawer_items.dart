import 'package:flutter/material.dart';
import 'package:hr_dashboard/view/drawer/item_tiles.dart';

class DrawerItems extends StatelessWidget {
  final String text;
  final IconData iconData;
  const DrawerItems({super.key, required this.text, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ItemTiles(text: text, iconData: iconData),
        const Icon(
          Icons.expand_more,
          color: Color.fromARGB(160, 158, 158, 158),
        ),
      ],
    );
  }
}
