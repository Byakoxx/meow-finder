import 'package:flutter/material.dart';
import 'package:meow_finder/providers/cat.dart';

import 'package:meow_finder/services/cat.dart';
import 'package:meow_finder/widgets/app_bar.dart';
import 'package:meow_finder/widgets/cat_list.dart';
import 'package:provider/provider.dart';

class CatsScreen extends StatelessWidget {
  CatsScreen({super.key});

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            final keyboardVisible =
                MediaQuery.of(context).viewInsets.bottom > 0;
            if (keyboardVisible) {
              FocusScope.of(context).unfocus();
            }
          },
          child: Consumer<CatProvider>(
            builder: (_, catProvider, __) {
              return Container(
                decoration: BoxDecoration(color: theme.scaffoldBackgroundColor),
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    const CustomAppBar(),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () => catProvider.fetchCats(),
                        child: const CatListWidget(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
