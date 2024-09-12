import 'package:flutter/material.dart';

class DarkLightSwitcher extends StatelessWidget {
  const DarkLightSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(
          100,
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ModeButton(mode: 'Light', active: true),
          _ModeButton(mode: 'Dark', active: false)
        ],
      ),
    );
  }
}

class _ModeButton extends StatelessWidget {
  final String mode;
  final bool active;
  const _ModeButton({
    required this.mode,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 33,
      color: active ? null : Colors.transparent,
      decoration: active
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 234, 234, 234),
                  spreadRadius: 3,
                  blurRadius: 5,
                )
              ],
            )
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            (mode == 'Light') ? Icons.wb_sunny : Icons.nightlight,
            color: const Color(0xff111827),
            size: 16,
          ),
          Text(
            mode,
            style: const TextStyle(fontSize: 12, color: Color(0xff111827)),
          ),
        ],
      ),
    );
  }
}
