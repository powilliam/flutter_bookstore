import 'package:bs_app/src/screens/book.dart';
import 'package:bs_app/src/viewmodels/bookmarks_viewmodel.dart';
import 'package:bs_app/src/widgets/book_card.dart';
import 'package:bs_app/src/utils/formatters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Action { clear }

class Bookmarks extends StatelessWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (_) => const Bookmarks());

  const Bookmarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _SliverAppBar(
            onSelected: (action) {
              switch (action) {
                case Action.clear:
                  Provider.of<BookmarksViewModel>(context, listen: false)
                      .clearBookmarks();
                  break;
              }
            },
          ),
          const _BookmarksList()
        ],
      ),
    );
  }
}

class _SliverAppBar extends StatelessWidget {
  final void Function(Action)? onSelected;

  const _SliverAppBar({Key? key, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color? _backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final TextStyle? _tileStyle =
        Theme.of(context).textTheme.headline6?.copyWith(color: Colors.black);

    return SliverAppBar(
      centerTitle: false,
      floating: true,
      backgroundColor: _backgroundColor,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.navigate_before, color: Colors.black)),
      title: Text('Bookmarks', style: _tileStyle),
      actions: <Widget>[
        PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onSelected: onSelected,
            itemBuilder: (_) => const [
                  PopupMenuItem(
                      value: Action.clear, child: Text('Clear all bookmarks'))
                ])
      ],
    );
  }
}

class _BookmarksList extends StatelessWidget {
  const _BookmarksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BookmarksViewModel>(
        builder: (_, bookmarksViewModel, __) => SliverList(
            delegate: SliverChildBuilderDelegate(
                (buildContext, int index) => BookCard(
                      title:
                          bookmarksViewModel.bookmarks[index].info?.title ?? "",
                      authors: bookmarksViewModel.bookmarks[index].info?.authors
                              ?.names() ??
                          "",
                      url: bookmarksViewModel
                              .bookmarks[index].info?.links?.thumbnail ??
                          "",
                      onTap: () {
                        Navigator.of(buildContext).push(
                            Book.route(bookmarksViewModel.bookmarks[index]));
                      },
                    ),
                childCount: bookmarksViewModel.bookmarks.length)));
  }
}
