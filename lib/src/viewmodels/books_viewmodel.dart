import 'package:bs_app/src/dto/volumes.dart';
import 'package:bs_app/src/models/volume.dart';
import 'package:bs_app/src/repositories/books.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BooksViewModel with ChangeNotifier {
  final BooksRepository _repository;
  BooksViewModelState _uiState =
      const BooksViewModelState(loading: false, relevant: [], newest: []);

  BooksViewModelState get uiState => _uiState;

  BooksViewModel(this._repository);

  Future<void> search(final String query) async {
    try {
      _uiState = _uiState.copyWith(loading: true);
      notifyListeners();

      final Map<Order, VolumesResponseDTO> volumes =
          await _repository.getNewestAndRelevantVolumesAbout(query);
      _uiState = _uiState.copyWith(
          loading: false,
          newest: volumes[Order.newest]?.volumes,
          relevant: volumes[Order.relevant]?.volumes);
      notifyListeners();
    } on Exception {
      _uiState = _uiState.copyWith(loading: false);
      notifyListeners();
    }
  }
}

@immutable
class BooksViewModelState extends Equatable {
  final bool loading;
  final List<Volume> relevant;
  final List<Volume> newest;

  const BooksViewModelState(
      {required this.loading, required this.relevant, required this.newest});

  @override
  List<Object> get props => [loading, relevant, newest];

  BooksViewModelState copyWith(
          {final bool? loading,
          final List<Volume>? relevant,
          final List<Volume>? newest}) =>
      BooksViewModelState(
          loading: loading ?? this.loading,
          relevant: relevant ?? this.relevant,
          newest: newest ?? this.newest);
}
