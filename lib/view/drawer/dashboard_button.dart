import 'package:flutter/material.dart';

class DashboardButton extends StatelessWidget {
  const DashboardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 216,
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFF0CAF60),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 211, 211, 211),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Dashboard',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Image(
            image: AssetImage(
              'assets/icons/dashboard_icon.png',
            ),
            width: 17.5,
            height: 17.5,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
