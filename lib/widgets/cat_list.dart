import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:meow_finder/providers/cat.dart';
import 'package:meow_finder/widgets/skeleton_cat_list.dart';

class CatListWidget extends StatefulWidget {
  const CatListWidget({super.key});

  @override
  CatListWidgetState createState() => CatListWidgetState();
}

class CatListWidgetState extends State<CatListWidget> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final catProvider = context.read<CatProvider>();
      catProvider.setListKey(_listKey);
      await catProvider.fetchCats();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CatProvider>(
      builder: (context, catProvider, child) {
        if (catProvider.isLoading) {
          return const SkeletonCatList();
        }
        if (catProvider.error != null) {
          return Center(
            child: Text('Error: ${catProvider.error}'),
          );
        }
        if (catProvider.cats.isEmpty) {
          return const Center(
              child:
                  Text('No cat breeds found with this name / description 😿'));
        }
        return AnimatedList(
          key: _listKey,
          initialItemCount: catProvider.cats.length,
          itemBuilder: (context, index, animation) {
            return catProvider.buildItem(catProvider.cats[index], animation);
          },
        );
      },
    );
  }
}
