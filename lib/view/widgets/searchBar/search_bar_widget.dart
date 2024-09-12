import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final bool isIconPrefix;
  final bool withBorders;
  final Color? backGroundColor;
  final TextEditingController? controller;
  const SearchBarWidget({
    super.key,
    required this.isIconPrefix,
    this.backGroundColor,
    required this.withBorders,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      constraints: BoxConstraints(
        maxWidth: width * 0.2,
        maxHeight: 48,
      ),
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        maxLines: 1,
        style: const TextStyle(
          fontSize: 14,
        ),
        decoration: InputDecoration(
          enabledBorder: _borderData(),
          border: _borderData(),
          focusedBorder: _borderData(),
          contentPadding: const EdgeInsets.all(14),
          hintText: 'Search anything...',
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
          suffix: (isIconPrefix) ? null : const SizedBox.shrink(),
          suffixIcon: (isIconPrefix)
              ? null
              : const Icon(Icons.search_outlined, size: 20),
          prefix: (isIconPrefix) ? const SizedBox.shrink() : null,
          prefixIcon: (isIconPrefix)
              ? const Icon(Icons.search_outlined, size: 20)
              : null,
        ),
      ),
    );
  }

  OutlineInputBorder _borderData() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 1,
        color: (withBorders)
            ? const Color(
                0xFFE9EAEC,
              )
            : Colors.transparent,
      ),
    );
  }
}
