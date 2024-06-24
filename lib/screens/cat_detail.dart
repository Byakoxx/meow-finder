import 'package:flutter/material.dart';
import 'package:meow_finder/models/cat_breed.dart';

class CatDetail extends StatelessWidget {
  const CatDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final CatBreed catBreed =
        ModalRoute.of(context)?.settings.arguments as CatBreed;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            catBreed.name!,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'cat-${catBreed.id}',
            child: FadeInImage(
              placeholder: const AssetImage('assets/images/meowding.gif'),
              image: NetworkImage(
                'https://cdn2.thecatapi.com/images/${catBreed.referenceImageId}.jpg',
              ),
              width: double.infinity,
              fit: BoxFit.cover,
              imageErrorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.asset(
                  'assets/images/img_cat_not_available.jpg',
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Text(catBreed.description ?? 'Sin descripción'),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
