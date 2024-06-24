import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:meow_finder/models/cat_breed.dart';
import 'package:meow_finder/services/cat.dart';
import 'package:meow_finder/widgets/cat_item.dart';

class CatProvider with ChangeNotifier {
  List<CatBreed> _allCats = [];
  List<CatBreed> _filteredCats = [];
  bool _isLoading = false;
  String? _error;
  GlobalKey<AnimatedListState>? _listKey;
  final TextEditingController searchController = TextEditingController();

  List<CatBreed> get cats => _filteredCats;
  bool get isLoading => _isLoading;
  String? get error => _error;

  void setListKey(GlobalKey<AnimatedListState> key) {
    _listKey = key;
  }

  Future<void> fetchCats() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _allCats = await ApiService().fetchCatBreeds();
      _filteredCats = List.from(_allCats);
      _listKey?.currentState?.insertAllItems(0, _filteredCats.length, duration: const Duration(milliseconds: 300));
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
    searchCats('');
  }

  void searchCats(String query) {
    List<CatBreed> newFilteredCats;
    if (query.isEmpty) {
      newFilteredCats = List.from(_allCats);
    } else {
      newFilteredCats = _allCats
          .where((cat) =>
              cat.name!.toLowerCase().contains(query.toLowerCase()) ||
              cat.description!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    final oldLength = _filteredCats.length;
    final newLength = newFilteredCats.length;
    final minLength = oldLength < newLength ? oldLength : newLength;

    // Update existing items
    for (int i = 0; i < minLength; i++) {
      if (_filteredCats[i] != newFilteredCats[i]) {
        _filteredCats[i] = newFilteredCats[i];
        _listKey?.currentState?.setState(() {});
      }
    }

    // Remove items
    for (int i = oldLength - 1; i >= newLength; i--) {
      final removedItem = _filteredCats.removeAt(i);
      _listKey?.currentState?.removeItem(
        i,
        (context, animation) => buildItem(removedItem, animation),
        duration: const Duration(milliseconds: 300),
      );
    }

    // Insert new items
    for (int i = oldLength; i < newLength; i++) {
      _filteredCats.insert(i, newFilteredCats[i]);
      _listKey?.currentState?.insertItem(i, duration: const Duration(milliseconds: 300));
    }

    notifyListeners();
  }

  Widget buildItem(CatBreed catBreed, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: FadeTransition(
        opacity: animation,
        child: CatItem(catBreed: catBreed),
      ),
    );
  }
}