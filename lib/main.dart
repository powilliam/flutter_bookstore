import 'package:bs_app/src/app.dart';
import 'package:bs_app/src/repositories/books.dart';
import 'package:bs_app/src/services/books_service.dart';
import 'package:bs_app/src/viewmodels/books_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  final BooksService _service = BooksService();
  final BooksRepository _repository = BooksRepositoryImpl(_service);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (_) => BooksViewModel(_repository)..search('sociology'))
  ], child: App()));
}
