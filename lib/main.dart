import 'package:bs_app/src/app.dart';
import 'package:bs_app/src/di/app_container.dart';
import 'package:bs_app/src/viewmodels/bookmarks_viewmodel.dart';
import 'package:bs_app/src/viewmodels/books_viewmodel.dart';
import 'package:bs_app/src/viewmodels/shoppingcart_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.white,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (_) => BooksViewModel(AppContainer.provideBooksRepository())
          ..search('sociology')),
    ChangeNotifierProvider(create: (_) => ShoppingCartViewModel()),
    ChangeNotifierProvider(create: (_) => BookmarksViewModel())
  ], child: App()));
}
