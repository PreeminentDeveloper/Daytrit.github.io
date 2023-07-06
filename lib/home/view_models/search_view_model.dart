import 'package:flutter/material.dart';

class SearchViewModel extends ChangeNotifier {
  String? _searchResult;

  // Setters
  void setSearchResult(String value) {
    if (value.length.toString().isEmpty) {
      _searchResult = "";
    } else {
      _searchResult = "Result not found";
    }
    notifyListeners();
  }

  // Getters
  String? get searchResult => _searchResult;
}
