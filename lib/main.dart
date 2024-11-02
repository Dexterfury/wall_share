import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wall_share/providers/theme_provider.dart';
import 'package:wall_share/providers/wallpaper_provider.dart';
import 'package:wall_share/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeProvider = ThemeProvider(false);
  await themeProvider.loadTheme();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => themeProvider),
    ChangeNotifierProvider(create: (_) => WallpaperProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeProvider.getTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
