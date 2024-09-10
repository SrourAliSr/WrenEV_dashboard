import 'package:flutter/material.dart';
import 'package:hr_dashboard/view/widgets/searchBar/search_bar_widget.dart';

class WideAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function() drawerTriggered;
  final bool isDrawerClosed;
  const WideAppBar({
    super.key,
    required this.drawerTriggered,
    required this.isDrawerClosed,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final width = size.width;

    return AppBar(
      toolbarHeight: 96,
      leading: (isDrawerClosed)
          ? IconButton(
              onPressed: () {
                drawerTriggered();
              },
              icon: const Icon(Icons.menu),
            )
          : null,
      title: SizedBox(
        width: width * 0.6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //if (width > 560) const _SearchBar(),
            if (width > 560)
              const SizedBox(
                width: 300,
                child: SearchBarWidget(
                  isIconPrefix: true,
                  withBorders: false,
                  backGroundColor: Color(0xffF8F8F8),
                ),
              ),
            if (width > 890)
              const Text(
                'Documents',
                style: TextStyle(fontSize: 14),
              ),
            if (width > 890)
              const Text(
                'News',
                style: TextStyle(fontSize: 14),
              ),
            if (width > 890)
              const Text(
                'Payslip',
                style: TextStyle(fontSize: 14),
              ),
            if (width > 890)
              const Text(
                'Report',
                style: TextStyle(fontSize: 14),
              ),
          ],
        ),
      ),
      actions: const [
        Icon(Icons.email_outlined),
        SizedBox(width: 24),
        Icon(Icons.chat_outlined),
        SizedBox(width: 24),
        Row(
          children: [
            Image(
              image: AssetImage(
                'assets/icons/profile.png',
              ),
              width: 32,
              height: 32,
            ),
            Icon(
              Icons.expand_more,
            ),
          ],
        ),
        SizedBox(width: 24),
      ],
      backgroundColor: const Color(0xffFFFFFF),
      elevation: 0,
      shadowColor: Colors.white,
      scrolledUnderElevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(96);
}
