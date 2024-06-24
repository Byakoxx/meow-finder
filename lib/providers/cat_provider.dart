import 'dart:developer';

import 'package:meow_finder/models/cat_breed.dart';
import 'package:meow_finder/services/cat_service.dart';
import 'package:flutter/material.dart';

class CatProvider with ChangeNotifier {
  List<CatBreed> _allCats = [];
  List<CatBreed> _filteredCats = [];
  bool _isLoading = false;
  String? _error;
  final TextEditingController searchController = TextEditingController();

  List<CatBreed> get cats => _filteredCats;
  bool get isLoading => _isLoading;
  String? get error => _error;

  void fetchCats() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _allCats = await ApiService().fetchCatBreeds();
      print("allcats $_allCats");
      _filteredCats = _allCats;
    } catch (error) {
      _error = error.toString();
      log('$error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearSearch() {
    searchController.clear();
    _filteredCats = _allCats;
    notifyListeners();
  }

  void searchCats(String query) {
    print(query);
    if (query.isEmpty) {
      _filteredCats = _allCats;
    } else {
      _filteredCats = _allCats
          .where((cat) =>
              cat.name!.toLowerCase().contains(query.toLowerCase()) ||
              cat.description!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
