import 'package:flutter/material.dart';
import '../models/cat_breed.dart';

class CatItem extends StatelessWidget {
  final CatBreed catBreed;

  const CatItem({super.key, required this.catBreed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(catBreed.name!),
      subtitle: Text(catBreed.description!),
      leading: const CircleAvatar(
        backgroundImage: NetworkImage('https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg'),
      ),
      onTap: () {
        // Implement navigation to detail screen
      },
    );
  }
}
