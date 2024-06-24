import 'package:flutter/material.dart';

import 'package:skeletonizer/skeletonizer.dart';

import 'package:meow_finder/widgets/intelligence_stars.dart';

class SkeletonCatList extends StatelessWidget {
  const SkeletonCatList({super.key});

  @override
  Widget build(BuildContext context) {
    bool enabled = true;

    return Skeletonizer(
      enabled: enabled,
      enableSwitchAnimation: true,
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return _container();
        },
      ),
    );
  }

  _container() {
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
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sin nombre',
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
                        child: const Icon(Icons.more_horiz),
                      ),
                      const SizedBox(width: 5.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
          FadeInImage(
            placeholder: const AssetImage('assets/images/meowding.gif'),
            image: const NetworkImage(
              'https://t3.ftcdn.net/jpg/02/61/08/76/360_F_261087622_8eRI0TAwDAyabS1b0Uifx1wKqHzA41r3.jpg',
            ),
            width: double.infinity,
            fit: BoxFit.cover,
            height: 200,
            imageErrorBuilder: (BuildContext context, Object exception,
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
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: const BoxDecoration(),
                  child: const Text('Cargando'),
                ),
                const IntelligenceStars(intelligenceLevel: 5)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
