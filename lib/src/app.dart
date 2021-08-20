import 'package:animations/animations.dart';
import 'package:bs_app/src/screens/books.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final Map<TargetPlatform, PageTransitionsBuilder> _transitions = {
    TargetPlatform.iOS: const ZoomPageTransitionsBuilder(),
    TargetPlatform.android: const FadeThroughPageTransitionsBuilder(),
  };

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.from(colorScheme: const ColorScheme.light()).copyWith(
            pageTransitionsTheme: PageTransitionsTheme(builders: _transitions)),
        home: const Books());
  }
}
