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
          return const _ContainerSkeleton();
        },
      ),
    );
  }
}

class _ContainerSkeleton extends StatelessWidget {
  const _ContainerSkeleton();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: theme.appBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'catbredd',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/meowding.gif',
            width: double.infinity,
            fit: BoxFit.cover,
            height: 200,
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Flag'), IntelligenceStars(intelligenceLevel: 5)],
            ),
          ),
        ],
      ),
    );
  }
}
