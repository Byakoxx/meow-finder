import 'package:flutter/material.dart';
import 'package:meow_finder/providers/cat_provider.dart';
import 'package:meow_finder/services/cat_service.dart';
import 'package:meow_finder/widgets/app_bar.dart';
import 'package:meow_finder/widgets/cat_list.dart';
import 'package:meow_finder/widgets/skeleton_cat_list.dart';
import 'package:provider/provider.dart';
import '../widgets/cat_item.dart';

class CatListScreen extends StatelessWidget {
  CatListScreen({super.key});

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    final catProvider = Provider.of<CatProvider>(context);
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
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                const CustomAppBar(),
                Expanded(
                  child: CatListWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
