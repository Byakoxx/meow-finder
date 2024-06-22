import 'package:flutter/material.dart';
import 'package:meow_finder/models/cat_breed.dart';
import 'package:meow_finder/services/cat_service.dart';
import '../widgets/cat_item.dart';

class CatListScreen extends StatelessWidget {
  CatListScreen({Key? key}) : super(key: key);

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Breedsd'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality here
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: apiService.fetchCatBreeds(),
        builder: (context, snapshot) {
          print("snapshot 🍏 antes => $snapshot");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No cat breeds found'));
          }
          final catBreeds = snapshot.data!;
          print("snapshot data 🍏 => ${snapshot.data}");

          return ListView.builder(
            itemCount: catBreeds.length,
            itemBuilder: (context, index) {
              final catBreed = catBreeds[index];
              return CatItem(catBreed: catBreed);
            },
          );
        },
      ),
    );
  }
}
