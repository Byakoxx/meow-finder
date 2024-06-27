import 'package:flutter/material.dart';

import 'package:meow_finder/widgets/flag.dart';
import 'package:meow_finder/models/cat_breed.dart';
import 'package:meow_finder/widgets/intelligence_stars.dart';

class CatItem extends StatelessWidget {
  final CatBreed catBreed;

  const CatItem({super.key, required this.catBreed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/detail',
          arguments: catBreed,
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: theme.appBarTheme.backgroundColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    catBreed.name ?? 'Not Name',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Hero(
              tag: 'cat-${catBreed.id}',
              child: FadeInImage(
                placeholder: const AssetImage('assets/images/meowding.gif'),
                image: NetworkImage(
                  'https://cdn2.thecatapi.com/images/${catBreed.referenceImageId}.jpg',
                ),
                width: double.infinity,
                fit: BoxFit.cover,
                height: 200,
                imageErrorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Image.asset(
                    'assets/images/img_cat_not_available.jpg',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 200,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flag(
                    countryCode: catBreed.countryCode!,
                  ),
                  IntelligenceStars(intelligenceLevel: catBreed.intelligence!)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
