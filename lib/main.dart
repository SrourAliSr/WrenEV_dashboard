import 'package:flutter/material.dart';
import 'package:hr_dashboard/view/dashboard/dashboard_view.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'HR Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Open Sans',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0CAF60)),
        useMaterial3: true,
      ),
      home: const DashBoardView(),
    ),
  );
}
