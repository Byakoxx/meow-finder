import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:meow_finder/providers/theme.dart';
import 'package:meow_finder/widgets/input_search.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
        return Container(
          padding: const EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            ),
            color: theme.appBarTheme.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '🐾 Catbreed 🐾',
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InputSearch(
                        onSubmitted: () => _onSearchSubmitted(context),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      onPressed: () {
                        themeProvider.toggleTheme();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _onSearchSubmitted(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
