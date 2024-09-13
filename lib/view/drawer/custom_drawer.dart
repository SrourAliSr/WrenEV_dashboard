import 'package:flutter/material.dart';
import 'package:hr_dashboard/view/drawer/dashboard_button.dart';
import 'package:hr_dashboard/view/drawer/drawer_items.dart';
import 'package:hr_dashboard/view/drawer/item_tiles.dart';
import 'package:hr_dashboard/view/widgets/dark_light/dark_ligh_widget.dart';

class SliderContent extends StatelessWidget {
  final void Function() closeDrawer;

  const SliderContent({
    super.key,
    required this.closeDrawer,
  });

  @override
  Widget build(BuildContext context) {
    final drawerItems = [
      {'text': 'Employee', 'icon': Icons.person_2_outlined},
      {'text': 'Checklist', 'icon': Icons.event_note_outlined},
      {'text': 'Time off', 'icon': Icons.timer_outlined},
      {'text': 'Attendance', 'icon': Icons.calendar_month_outlined},
      {'text': 'Payroll', 'icon': Icons.wallet_outlined},
      {'text': 'Performance', 'icon': Icons.insights_outlined},
      {'text': 'Recruitments', 'icon': Icons.shopping_bag_outlined},
    ];

    return Container(
      color: (Theme.of(context).brightness == Brightness.light)
          ? Colors.white
          : const Color.fromARGB(255, 43, 59, 80),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      //layout builder calculates the height of the widget before it is built
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              //intrisicHeight takes the maximum height of the the biggest widget and apply it to all the other widgets
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Image(
                          image: AssetImage('assets/images/logo.png'),
                          width: 156,
                          height: 24,
                        ),
                        IconButton(
                          onPressed: closeDrawer,
                          icon: const Icon(
                            Icons.keyboard_double_arrow_left_sharp,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const DashboardButton(),
                    const SizedBox(height: 24),
                    ...drawerItems.map(
                      (item) => Column(
                        children: [
                          DrawerItems(
                            text: item['text']! as String,
                            iconData: item['icon']! as IconData,
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                    //if there is an empty space spacer wdiget makes a gap of space between the widgets
                    const Spacer(),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const ItemTiles(
                              text: 'Help center',
                              iconData: Icons.question_mark_outlined,
                            ),
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE03137),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Center(
                                child: Text(
                                  '8',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const ItemTiles(
                          text: 'Settings',
                          iconData: Icons.settings_outlined,
                        ),
                        const SizedBox(height: 24),
                        const DarkLightSwitcher(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
