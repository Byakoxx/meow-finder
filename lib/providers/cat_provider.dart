import 'dart:developer';

import 'package:meow_finder/services/cat_service.dart';
import 'package:flutter/material.dart';

class CatProvider with ChangeNotifier {
  List<dynamic> _cats = [];
  bool _isLoading = false;

  List<dynamic> get cats => _cats;
  bool get isLoading => _isLoading;

  void ferchCats() async {
    _isLoading = true;
    notifyListeners();

    try {
      _cats = await ApiService().fetchCatBreeds();
    } catch (error) {
      log('$error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
