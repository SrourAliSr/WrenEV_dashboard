import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_dashboard/constants/sensitive.dart';
import 'package:hr_dashboard/view/dashboard/dashboard_view.dart';
import 'package:hr_dashboard/view_model/theme_mode_notifier.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );
  runApp(
    const ProviderScope(child: _MyApp()),
  );
}

class _MyApp extends ConsumerWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);
    return MaterialApp(
      title: 'HR Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Open Sans',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0CAF60)),
        textTheme: const TextTheme(),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        fontFamily: 'Open Sans',
      ),
      home: const DashBoardView(),
      themeMode: themeMode,
    );
  }
}
