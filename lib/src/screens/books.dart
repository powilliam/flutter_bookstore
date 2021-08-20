import 'package:bs_app/src/screens/book.dart';
import 'package:bs_app/src/screens/bookmarks.dart';
import 'package:bs_app/src/screens/shopping_cart.dart';
import 'package:bs_app/src/widgets/book_card.dart';
import 'package:bs_app/src/widgets/counter_button.dart';
import 'package:flutter/material.dart';

class Books extends StatelessWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (_) => const Books());

  const Books({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        _SliverAppBar(),
        _BooksSectionTitle(
          title: 'Popular',
        ),
        _PopularBooks(),
        _BooksSectionTitle(
          title: 'Newest',
        ),
        _NewestBooks()
      ]),
    );
  }
}

class _SliverAppBar extends StatelessWidget {
  const _SliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color? _backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final TextStyle? _textStyle = Theme.of(context)
        .textTheme
        .headline6
        ?.copyWith(fontWeight: FontWeight.bold);

    return SliverAppBar(
      centerTitle: false,
      floating: true,
      backgroundColor: _backgroundColor,
      title: Text('Book Store', style: _textStyle),
      actions: <Widget>[
        LabeledButton(
            label: 0,
            icon: Icons.bookmarks,
            onPressed: () {
              Navigator.of(context).push(Bookmarks.route());
            }),
        LabeledButton(
            label: 0,
            icon: Icons.shopping_cart_outlined,
            labelAlwaysVisible: true,
            onPressed: () {
              Navigator.of(context).push(ShoppingCart.route());
            }),
        PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            itemBuilder: (_) => const [PopupMenuItem(child: Text('Refresh'))])
      ],
    );
  }
}

class _BooksSectionTitle extends StatelessWidget {
  final String title;

  const _BooksSectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? _titleStyle = Theme.of(context)
        .textTheme
        .headline6
        ?.copyWith(fontWeight: FontWeight.bold);

    return SliverList(
        delegate: SliverChildListDelegate(<Widget>[
      Padding(
          padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
          child: Text(title, style: _titleStyle))
    ]));
  }
}

class _PopularBooks extends StatelessWidget {
  const _PopularBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 8, right: 16, top: 16),
        scrollDirection: Axis.horizontal,
        child: Row(children: const <Widget>[
          _PopularBook(),
          _PopularBook(),
          _PopularBook(),
        ]),
      ),
    );
  }
}

class _PopularBook extends StatelessWidget {
  const _PopularBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color? _cardColor = Theme.of(context).scaffoldBackgroundColor;
    final TextStyle? _titleStyle = Theme.of(context)
        .textTheme
        .subtitle1
        ?.copyWith(fontWeight: FontWeight.bold);
    final TextStyle? _descriptionStyle =
        Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.grey);

    return Card(
      elevation: 0,
      color: _cardColor,
      child: InkWell(
          onTap: () {
            Navigator.of(context).push(Book.route());
          },
          child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset("images/chanel_catwalk.png",
                        width: 131, height: 192),
                    const SizedBox(height: 20),
                    Text('Chanel', style: _titleStyle),
                    const SizedBox(height: 4),
                    Text('Patrick Mauriès', style: _descriptionStyle)
                  ]))),
    );
  }
}

class _NewestBooks extends StatelessWidget {
  const _NewestBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate(const <Widget>[
      BookCard(),
      BookCard(),
      BookCard(),
      BookCard(),
      BookCard(),
      BookCard(),
      BookCard(),
      BookCard(),
    ]));
  }
}
