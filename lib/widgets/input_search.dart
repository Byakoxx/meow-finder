import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:meow_finder/providers/cat.dart';

class InputSearch extends StatelessWidget {
  final String hintText;
  final VoidCallback? onSubmitted;

  const InputSearch({
    super.key,
    this.hintText = 'Search...',
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final catProvider = Provider.of<CatProvider>(context);
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
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
          ),
        ),
        onChanged: (text) {
          catProvider.searchCats(text);
        },
        onSubmitted: (text) => onSubmitted?.call(),
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
