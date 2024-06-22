import 'package:flutter/material.dart';
import 'package:meow_finder/services/cat_service.dart';
import '../widgets/cat_item.dart';

class CatListScreen extends StatelessWidget {
  CatListScreen({super.key});

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            AppBar(),
            Expanded(
              child: FutureBuilder(
                future: apiService.fetchCatBreeds(),
                builder: (context, snapshot) {
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
                  return ListView.builder(
                    itemCount: catBreeds.length,
                    itemBuilder: (context, index) {
                      final catBreed = catBreeds[index];
                      return CatItem(catBreed: catBreed);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
