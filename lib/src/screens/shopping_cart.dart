import 'package:bs_app/src/widgets/book_card.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatelessWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (_) => const ShoppingCart());

  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const CustomScrollView(
          slivers: <Widget>[_SliverAppBar(), _ShoppingCartList()],
        ),
        bottomSheet: BottomSheet(
            enableDrag: false,
            onClosing: () {},
            builder: (_) => const _ShoppingCardSheet()));
  }
}

class _SliverAppBar extends StatelessWidget {
  const _SliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color? _backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final TextStyle? _titleStyle =
        Theme.of(context).textTheme.headline6?.copyWith(color: Colors.black);

    return SliverAppBar(
      centerTitle: false,
      floating: false,
      backgroundColor: _backgroundColor,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.navigate_before, color: Colors.black),
      ),
      title: Text('Shopping Cart (3)', style: _titleStyle),
      actions: <Widget>[
        PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            itemBuilder: (_) =>
                const [PopupMenuItem(child: Text('Clear all items'))])
      ],
    );
  }
}

class _ShoppingCartList extends StatelessWidget {
  const _ShoppingCartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate(
            const <Widget>[BookCard(), BookCard(), BookCard()]));
  }
}

class _ShoppingCardSheet extends StatelessWidget {
  const _ShoppingCardSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color? _primaryColor = Theme.of(context).primaryColor;
    final TextStyle? _amountStyle = Theme.of(context)
        .textTheme
        .headline5
        ?.copyWith(fontWeight: FontWeight.bold, color: _primaryColor);
    final TextStyle? _payStyle = Theme.of(context)
        .textTheme
        .button
        ?.copyWith(fontWeight: FontWeight.bold, color: _primaryColor);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('\$120.90', style: _amountStyle),
          TextButton(
              onPressed: () {},
              child: Text('FINISH PURCHASE', style: _payStyle))
        ],
      ),
    );
  }
}
