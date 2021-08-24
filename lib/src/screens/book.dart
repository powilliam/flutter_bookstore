import 'package:bs_app/src/models/volume.dart';
import 'package:bs_app/src/utils/formatters.dart';
import 'package:bs_app/src/viewmodels/bookmarks_viewmodel.dart';
import 'package:bs_app/src/viewmodels/shoppingcart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Book extends StatelessWidget {
  static MaterialPageRoute route(final Volume volume) =>
      MaterialPageRoute(builder: (_) => Book(volume: volume));

  final Volume volume;

  const Book({Key? key, required this.volume}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: <Widget>[
        Consumer<ShoppingCartViewModel>(
            builder: (_, shoppingCartViewModel, widget) => ElevatedButton(
                  onPressed: () {
                    shoppingCartViewModel.insertOrRemove(volume);
                  },
                  child: Text(shoppingCartViewModel.volumes.contains(volume)
                      ? "Remove from cart"
                      : "Buy now for \$${volume.sale?.price?.amount ?? "free"}"),
                ))
      ],
      body: CustomScrollView(slivers: <Widget>[
        _SliverAppBar(volume: volume),
        _Details(
          title: volume.info?.title ?? "",
          description: volume.info?.description ?? "",
          url: volume.info?.links?.thumbnail ?? "",
          authors: volume.info?.authors?.names() ?? "",
        )
      ]),
    );
  }
}

class _SliverAppBar extends StatelessWidget {
  final Volume volume;

  const _SliverAppBar({Key? key, required this.volume}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color? _backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return SliverAppBar(
      centerTitle: false,
      floating: true,
      backgroundColor: _backgroundColor,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.navigate_before, color: Colors.black)),
      actions: <Widget>[
        Consumer<BookmarksViewModel>(
            builder: (_, bookmarksViewModel, widget) => IconButton(
                onPressed: () {
                  bookmarksViewModel.insertOrRemove(volume);
                },
                icon: Icon(
                    bookmarksViewModel.bookmarks.contains(volume)
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    color: Colors.black))),
      ],
    );
  }
}

class _Details extends StatelessWidget {
  final String title;
  final String authors;
  final String description;
  final String url;

  const _Details(
      {Key? key,
      required this.title,
      required this.authors,
      required this.description,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? _titleStyle = Theme.of(context)
        .textTheme
        .headline5
        ?.copyWith(fontWeight: FontWeight.bold);
    final TextStyle? _authorStyle =
        Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.grey);
    final TextStyle? _contentStyle =
        Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.grey);

    return SliverList(
        delegate: SliverChildListDelegate(<Widget>[
      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(url, width: 212, height: 310, fit: BoxFit.cover),
              const SizedBox(height: 32),
              Text(title, style: _titleStyle, textAlign: TextAlign.center),
              const SizedBox(height: 8),
              Text(authors, style: _authorStyle, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              Text(description,
                  style: _contentStyle,
                  textAlign: TextAlign.justify,
                  maxLines: 12),
            ]),
      )
    ]));
  }
}
