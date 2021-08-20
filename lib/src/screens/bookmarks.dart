import 'package:bs_app/src/widgets/book_card.dart';
import 'package:flutter/material.dart';

class Bookmarks extends StatelessWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (_) => const Bookmarks());

  const Bookmarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[_SliverAppBar(), _BookmarksList()],
      ),
    );
  }
}

class _SliverAppBar extends StatelessWidget {
  const _SliverAppBar({Key? key}) : super(key: key);

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
            itemBuilder: (_) =>
                const [PopupMenuItem(child: Text('Clear all bookmarks'))])
      ],
    );
  }
}

class _BookmarksList extends StatelessWidget {
  const _BookmarksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate(const <Widget>[
      BookCard(),
      BookCard(),
      BookCard(),
      BookCard(),
      BookCard(),
      BookCard()
    ]));
  }
}
