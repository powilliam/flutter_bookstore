import 'dart:collection';

import 'package:bs_app/src/models/volume.dart';
import 'package:flutter/material.dart';

class BookmarksViewModel with ChangeNotifier {
  final List<Volume> _bookmarks = [];

  UnmodifiableListView<Volume> get bookmarks =>
      UnmodifiableListView(_bookmarks);

  void insertOrRemove(final Volume newVolume) {
    if (_bookmarks.contains(newVolume)) {
      _bookmarks.remove(newVolume);
    } else {
      _bookmarks.add(newVolume);
    }
    notifyListeners();
  }

  void clearBookmarks() {
    _bookmarks.clear();
    notifyListeners();
  }
}
