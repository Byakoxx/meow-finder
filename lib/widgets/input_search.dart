import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:meow_finder/providers/cat.dart';

class InputSearch extends StatelessWidget {
  final String hintText;
  final VoidCallback? onSubmitted;

  const InputSearch({
    super.key,
    this.hintText = 'Search breedname / description',
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final catProvider = Provider.of<CatProvider>(context);
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: catProvider.searchController,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: catProvider.searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey),
                  onPressed: () => catProvider.clearSearch(),
                )
              : null,
          hintText: hintText,
          hintStyle: TextStyle(
              color: theme.textTheme.displayMedium?.color?.withOpacity(0.6)),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          enabledBorder: theme.inputDecorationTheme.border,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: theme.primaryColor, width: 2.0),
          ),
        ),
        onChanged: (text) {
          catProvider.searchCats(text);
        },
        onSubmitted: (text) => onSubmitted?.call(),
        style: TextStyle(
          fontSize: 16.0,
          color: theme.textTheme.displayMedium?.color,
        ),
      ),
    );
  }
}
