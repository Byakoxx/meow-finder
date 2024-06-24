import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:meow_finder/screens/spash.dart';
import 'package:meow_finder/providers/cat.dart';
import 'package:meow_finder/screens/cat_detail.dart';

void main() => runApp(const CatApp());

class CatApp extends StatelessWidget {
  const CatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CatProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CatApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => const SplashScreen(),
          '/detail': (ctx) => const CatDetail()
        },
      ),
    );
  }
}
