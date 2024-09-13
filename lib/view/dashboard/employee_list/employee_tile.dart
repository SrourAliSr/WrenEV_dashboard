import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class EmployeeTile extends StatefulWidget {
  final String? profileUrl;
  final String name;
  final String email;
  final String jobTitle;
  final String lineManager;
  final String department;
  final String office;
  final bool isChecked;
  const EmployeeTile({
    super.key,
    required this.profileUrl,
    required this.name,
    required this.email,
    required this.jobTitle,
    required this.lineManager,
    required this.department,
    required this.office,
    required this.isChecked,
  });

  @override
  State<EmployeeTile> createState() => _EmployeeTileState();
}

class _EmployeeTileState extends State<EmployeeTile> {
  late bool isChecked;
  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  @override
  void didUpdateWidget(covariant EmployeeTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    isChecked = widget.isChecked;
  }

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
            (widget.profileUrl == null)
                ? const Image(
                    image: AssetImage(
                      'assets/icons/profile.png',
                    ),
                    width: 24,
                    height: 24,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(
                      image: NetworkImage(
                        widget.profileUrl!,
                      ),
                      width: 24,
                      height: 24,
                    ),
                  ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
            ),
            titlesText(
              widget.jobTitle,
            ),
            titlesText(
              widget.lineManager,
            ),
            titlesText(
              widget.department,
            ),
            titlesText(
              widget.office,
            ),
          ],
        ),
      ),
    );
  }

  Widget titlesText(
    String text,
  ) {
    return Expanded(
      child: AutoSizeText(
        text,
        maxFontSize: 12,
        minFontSize: 9,
      ),
    );
  }
}
