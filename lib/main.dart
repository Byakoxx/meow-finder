import 'package:flutter/material.dart';
import 'package:meow_finder/app.dart';

import 'package:provider/provider.dart';

import 'package:meow_finder/providers/cat.dart';
import 'package:meow_finder/providers/theme.dart';

void main() => runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => CatProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ], child: const CatApp()),
    );