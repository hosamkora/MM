import 'package:flutter/foundation.dart';

class ListViewModel with ChangeNotifier {
  List<String> strings = [];

  void additem(String item) {
    strings.add(item);
    notifyListeners();
  }
}
