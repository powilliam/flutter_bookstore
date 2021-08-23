import 'package:bs_app/src/models/volume.dart';
import 'package:bs_app/src/screens/book.dart';
import 'package:bs_app/src/screens/bookmarks.dart';
import 'package:bs_app/src/screens/shopping_cart.dart';
import 'package:bs_app/src/viewmodels/books_viewmodel.dart';
import 'package:bs_app/src/viewmodels/shoppingcart_viewmodel.dart';
import 'package:bs_app/src/widgets/book_card.dart';
import 'package:bs_app/src/widgets/counter_button.dart';
import 'package:bs_app/src/utils/formatters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Books extends StatelessWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (_) => const Books());

  const Books({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BooksViewModel>(builder: (_, booksViewModel, __) {
        final BooksViewModelState _uiState = booksViewModel.uiState;
        final bool shouldShowRelevant =
            !_uiState.loading && _uiState.relevant.isNotEmpty;
        final bool shouldShowNewest =
            !_uiState.loading && _uiState.newest.isNotEmpty;

        return CustomScrollView(slivers: <Widget>[
          const _SliverAppBar(),
          !shouldShowRelevant
              ? const SliverToBoxAdapter()
              : const _BooksSectionTitle(
                  title: 'Relevant',
                ),
          _RelevantBooks(volumes: _uiState.relevant),
          !shouldShowNewest
              ? const SliverToBoxAdapter()
              : const _BooksSectionTitle(
                  title: 'Newest',
                ),
          _NewestBooks(volumes: _uiState.newest)
        ]);
      }),
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
        Consumer<ShoppingCartViewModel>(
            builder: (_, shoppingCartViewModel, widget) => LabeledButton(
                label: shoppingCartViewModel.volumes.length,
                icon: Icons.shopping_cart_outlined,
                labelAlwaysVisible: true,
                onPressed: () {
                  Navigator.of(context).push(ShoppingCart.route());
                })),
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

class _RelevantBooks extends StatelessWidget {
  final List<Volume> volumes;

  const _RelevantBooks({Key? key, required this.volumes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 8, right: 16, top: 16),
        scrollDirection: Axis.horizontal,
        child: Row(
            children: volumes
                .map<Widget>((volume) => _RelevantBook(volume: volume))
                .toList()),
      ),
    );
  }
}

class _RelevantBook extends StatelessWidget {
  final Volume volume;

  const _RelevantBook({Key? key, required this.volume}) : super(key: key);

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
            Navigator.of(context).push(Book.route(volume));
          },
          child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(volume.info?.links?.thumbnail ?? "",
                        width: 131, height: 192),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 131,
                      child: Text(volume.info?.title ?? "",
                          style: _titleStyle, overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 131,
                      child: Text(volume.info?.authors?.names() ?? "",
                          style: _descriptionStyle,
                          overflow: TextOverflow.ellipsis),
                    )
                  ]))),
    );
  }
}

class _NewestBooks extends StatelessWidget {
  final List<Volume> volumes;

  const _NewestBooks({Key? key, required this.volumes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            (_, int index) => BookCard(
                title: volumes[index].info?.title ?? "",
                authors: volumes[index].info?.authors?.names() ?? "",
                url: volumes[index].info?.links?.thumbnail ?? "",
                onTap: () {
                  Navigator.of(context).push(Book.route(volumes[index]));
                }),
            childCount: volumes.length));
  }
}
