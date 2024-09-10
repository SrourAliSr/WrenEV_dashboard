import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class EmployeeTile extends StatefulWidget {
  final String name;
  final String email;
  final String jobTitle;
  final String lineManager;
  final String department;
  final String office;
  const EmployeeTile({
    super.key,
    required this.name,
    required this.email,
    required this.jobTitle,
    required this.lineManager,
    required this.department,
    required this.office,
  });

  @override
  State<EmployeeTile> createState() => _EmployeeTileState();
}

class _EmployeeTileState extends State<EmployeeTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: (size.width >= 990) ? size.width * 0.68 : size.width * 0.95,
      child: ListTile(
        leading: Checkbox(
          value: isChecked,
          side: const BorderSide(
              color: Color(
                0xFFCBD5E0,
              ),
              width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          onChanged: (value) {
            setState(
              () {
                isChecked = value!;
              },
            );
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 12,
                  child: Image(
                    image: AssetImage(
                      'assets/icons/profile.png',
                    ),
                    width: 24,
                    height: 24,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    AutoSizeText(
                      widget.name,
                      maxFontSize: 12,
                      minFontSize: 9,
                    ),
                    AutoSizeText(
                      widget.email,
                      maxFontSize: 10,
                      minFontSize: 6,
                      style: const TextStyle(
                        color: Color(
                          0xFFA0AEC0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: AutoSizeText(
                widget.jobTitle,
                maxFontSize: 12,
                minFontSize: 9,
                style: const TextStyle(),
              ),
            ),
            Expanded(
              child: AutoSizeText(
                widget.lineManager,
                maxFontSize: 12,
                minFontSize: 9,
              ),
            ),
            Expanded(
              child: AutoSizeText(
                widget.department,
                maxFontSize: 12,
                minFontSize: 9,
              ),
            ),
            Expanded(
              child: AutoSizeText(
                widget.office,
                maxFontSize: 12,
                minFontSize: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
