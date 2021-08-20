import 'package:bs_app/src/dto/volumes.dart';
import 'package:bs_app/src/services/books_service.dart';

enum Order { newest, relevant }

abstract class BooksRepository {
  Future<Map<Order, VolumesResponseDTO>> getNewestAndRelevantVolumesAbout(
      final String query);
}

class BooksRepositoryImpl implements BooksRepository {
  final BooksService _service;

  const BooksRepositoryImpl(this._service);

  @override
  Future<Map<Order, VolumesResponseDTO>> getNewestAndRelevantVolumesAbout(
      final String query,
      {final int limit = 12,
      final int offset = 0}) async {
    final int relevantLimit = limit ~/ 2;
    final List<VolumesResponseDTO> responses = await Future.wait([
      _service.volumes(query, orderBy: 'newest', limit: limit),
      _service.volumes(query,
          orderBy: 'relevance', limit: relevantLimit)
    ]);

    return {Order.newest: responses.first, Order.relevant: responses.last};
  }
}
