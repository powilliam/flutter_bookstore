import 'package:bs_app/src/repositories/books.dart';
import 'package:bs_app/src/services/books_service.dart';

abstract class AppContainer {
  static BooksService provideBooksService() => BooksService();

  static BooksRepository provideBooksRepository() =>
      BooksRepositoryImpl(provideBooksService());
}
