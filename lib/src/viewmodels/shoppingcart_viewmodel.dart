import 'dart:collection';

import 'package:bs_app/src/models/volume.dart';
import 'package:flutter/material.dart';

class ShoppingCartViewModel with ChangeNotifier {
  final List<Volume> _volumes = [];

  UnmodifiableListView<Volume> get volumes => UnmodifiableListView(_volumes);

  double get amount => volumes.fold(
      0.0,
      (previousValue, element) =>
          previousValue + (element.sale?.price?.amount ?? 0.0));

  void insertOrRemove(final Volume newVolume) {
    if (_volumes.contains(newVolume)) {
      _volumes.remove(newVolume);
    } else {
      _volumes.add(newVolume);
    }
    notifyListeners();
  }

  void clearCart() {
    _volumes.clear();
    notifyListeners();
  }
}
