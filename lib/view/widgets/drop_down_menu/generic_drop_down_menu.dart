import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class GenericDropDownMenue extends StatefulWidget {
  final List<String> menuItems;
  final int menuLength;
  final String type;
  final void Function(int selectedIndex) selectedIndex;
  const GenericDropDownMenue({
    super.key,
    required this.menuItems,
    required this.menuLength,
    required this.type,
    required this.selectedIndex,
  });

  @override
  State<GenericDropDownMenue> createState() => GenericDropDownMenueState();
}

class GenericDropDownMenueState extends State<GenericDropDownMenue> {
  late int initIndex;

  @override
  void initState() {
    initIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 260,
          maxHeight: 54,
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
          isExpanded: true,
          icon: const Icon(
            Icons.expand_more,
          ),
          underline: const SizedBox(),
          value: initIndex,
          items: List.generate(
            widget.menuLength + 1,
            (index) {
              return DropdownMenuItem(
                value: index,
                child: AutoSizeText(
                  (index == 0)
                      ? 'All ${widget.type}'
                      : widget.menuItems[index - 1],
                  maxFontSize: 14,
                  minFontSize: 10,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              );
            },
          ),
          onChanged: (value) {
            if (value != null) {
              widget.selectedIndex(value);
              setState(
                () {
                  initIndex = value;
                },
              );
            }
          },
        ),
      ),
    );
  }
}
