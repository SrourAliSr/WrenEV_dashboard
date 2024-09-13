import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_dashboard/view_model/theme_mode_notifier.dart';

class DarkLightSwitcher extends ConsumerWidget {
  const DarkLightSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: (Theme.of(context).brightness == Brightness.light)
            ? const Color(0xFFF8F8F8)
            : const Color.fromARGB(255, 32, 39, 55),
        borderRadius: BorderRadius.circular(
          100,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ModeButton(mode: 'Light', active: themeMode == ThemeMode.light),
          _ModeButton(mode: 'Dark', active: themeMode == ThemeMode.dark),
        ],
      ),
    );
  }
}

class _ModeButton extends ConsumerWidget {
  final String mode;
  final bool active;
  const _ModeButton({
    required this.mode,
    required this.active,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 80,
      height: 33,
      color: active ? null : Colors.transparent,
      decoration: active
          ? BoxDecoration(
              color: (Theme.of(context).brightness == Brightness.light)
                  ? const Color(0xFFFAFAFA)
                  : const Color(0xFF1F2937),
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
      child: GestureDetector(
        onTap: () {
          ref.read(themeNotifierProvider.notifier).toggleTheme();
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              (mode == 'Light') ? Icons.wb_sunny : Icons.nightlight,
              size: 16,
            ),
            Text(
              mode,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
