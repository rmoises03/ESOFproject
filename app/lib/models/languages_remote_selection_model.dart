import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/models/filter_model.dart';
import 'package:myapp/models/technology_model.dart';

class LanguageSelectionModel extends ChangeNotifier {
  bool _isOpen = false;
  final List<String> _selectedLanguages = [];
  String _selectedRemote = '';

  Color squaresColor = const Color.fromRGBO(102, 152, 173, 1);

  bool get isOpen => _isOpen;

  List<String> get selectedLanguages => _selectedLanguages;

  String get selectedRemote => _selectedRemote;

  void toggleIsOpen() {
    _isOpen = !_isOpen;
    notifyListeners();
  }

  void toggleLanguage(String language) {
    if (_selectedLanguages.contains(language)) {
      _selectedLanguages.remove(language);
    } else {
      _selectedLanguages.add(language);
    }
    // print("Selected languages: $_selectedLanguages");
    notifyListeners();
  }

  void toggleRemote(bool value) {
    _selectedRemote = value ? 'Sim' : '';

    // print("Selected remote: $_selectedRemote");
    notifyListeners();
  }

  void useAsFilter(BuildContext context) {
    Filter filterParameters = Provider.of<Filter>(context, listen: false);

    // Updating remote filters according to user profile
    if (_selectedRemote.contains('Sim')) {
      filterParameters.updateFilterRemote(true);
    }

    // Clearing technology filters before creating new ones with user profile
    filterParameters.technologyFilters = [];

    // Updating technology filters according to user profile
    for (var language in _selectedLanguages) {
      for (var technology in Technology.technologies) {
        if (technology.string == language) {
          filterParameters.updateFilterTechnology(technology.id - 1, true);
        }
      }
    }
  }
}
