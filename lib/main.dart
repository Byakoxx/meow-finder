import 'package:meow_finder/providers/cat_provider.dart';
import 'package:flutter/material.dart';
import 'package:meow_finder/screens/spash_screen.dart';
import 'package:provider/provider.dart';

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
        home: const SplashScreen(),
        /*routes: {
          '/cat-list': (context) => const CatListScreen(),
        },*/
      ),
    );
  }
}
