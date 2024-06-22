// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meow_finder/widgets/flag.dart';
import 'package:meow_finder/widgets/intelligence_stars.dart';
import '../models/cat_breed.dart';

class CatItem extends StatelessWidget {
  final CatBreed catBreed;

  const CatItem({super.key, required this.catBreed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  catBreed.name ?? 'Sin nombre',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => print('Editar'),
                        child: Icon(Icons.more_horiz),
                      ),
                      SizedBox(width: 5.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Image.network(
            'https://cdn2.thecatapi.com/images/${catBreed.referenceImageId}.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
            height: 200,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Image.network(
                'https://t3.ftcdn.net/jpg/02/61/08/76/360_F_261087622_8eRI0TAwDAyabS1b0Uifx1wKqHzA41r3.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
                height: 200,
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              height: 1,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
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
    );
  }
}
