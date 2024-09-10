import 'package:flutter/material.dart';
import 'package:hr_dashboard/constants/sensitive.dart';
import 'package:hr_dashboard/view/dashboard/dashboard_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );
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
