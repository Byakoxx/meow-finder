import 'package:flutter/material.dart';
import 'package:meow_finder/theme/app_theme.dart';

import 'package:provider/provider.dart';

import 'package:meow_finder/screens/spash.dart';
import 'package:meow_finder/providers/cat.dart';
import 'package:meow_finder/providers/theme.dart';
import 'package:meow_finder/screens/cat_detail.dart';

void main() => runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => CatProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ], child: const CatApp()),
    );

class CatApp extends StatelessWidget {
  const CatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Meow Finder',
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          themeMode: themeProvider.themeMode,
          initialRoute: '/',
          routes: {
            '/': (ctx) => const SplashScreen(),
            '/detail': (ctx) => const CatDetail()
          },
        );
      },
    );
  }
}
