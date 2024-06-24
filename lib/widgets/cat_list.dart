import 'package:flutter/material.dart';
import 'package:meow_finder/providers/cat_provider.dart';
import 'package:meow_finder/widgets/cat_item.dart';
import 'package:meow_finder/widgets/skeleton_cat_list.dart';
import 'package:provider/provider.dart';

class CatListWidget extends StatefulWidget {
  @override
  _CatListWidgetState createState() => _CatListWidgetState();
}

class _CatListWidgetState extends State<CatListWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<CatProvider>().fetchCats());
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
        return ListView.builder(
          itemCount: catProvider.cats.length,
          itemBuilder: (context, index) {
            print("hay ${catProvider.cats.length} gatos por mostrar");
            final catBreed = catProvider.cats[index];
            return CatItem(catBreed: catBreed);
          },
        );
      },
    );
  }
}
