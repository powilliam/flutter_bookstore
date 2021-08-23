import 'package:bs_app/src/models/volume.dart';
import 'package:bs_app/src/screens/book.dart';
import 'package:bs_app/src/utils/formatters.dart';
import 'package:bs_app/src/viewmodels/shoppingcart_viewmodel.dart';
import 'package:bs_app/src/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Action { clear }

class ShoppingCart extends StatelessWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (_) => const ShoppingCart());

  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingCartViewModel>(
      builder: (_, shoppingCartViewModel, widget) => Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              _SliverAppBar(
                  total: shoppingCartViewModel.volumes.length,
                  onSelected: (action) {
                    switch (action) {
                      case Action.clear:
                        shoppingCartViewModel.clearCart();
                        break;
                    }
                  }),
              _ShoppingCartList(volumes: shoppingCartViewModel.volumes)
            ],
          ),
          bottomSheet: BottomSheet(
              enableDrag: false,
              onClosing: () {},
              builder: (_) => _ShoppingCardSheet(
                  amount: shoppingCartViewModel.amount,
                  onFinishPurchase: () {
                    shoppingCartViewModel.clearCart();
                  }))),
    );
  }
}

class _SliverAppBar extends StatelessWidget {
  final int total;
  final void Function(Action)? onSelected;

  const _SliverAppBar({Key? key, required this.total, this.onSelected})
      : super(key: key);

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
      title: Text('Shopping Cart ($total)', style: _titleStyle),
      actions: <Widget>[
        PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onSelected: onSelected,
            itemBuilder: (_) => const [
                  PopupMenuItem(
                      value: Action.clear, child: Text('Clear all items'))
                ])
      ],
    );
  }
}

class _ShoppingCartList extends StatelessWidget {
  final List<Volume> volumes;

  const _ShoppingCartList({Key? key, required this.volumes}) : super(key: key);

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
                  },
                ),
            childCount: volumes.length));
  }
}

class _ShoppingCardSheet extends StatelessWidget {
  final double amount;
  final void Function()? onFinishPurchase;

  const _ShoppingCardSheet(
      {Key? key, required this.amount, this.onFinishPurchase})
      : super(key: key);

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
          Text('\$${amount.toStringAsFixed(2)}', style: _amountStyle),
          TextButton(
              onPressed: onFinishPurchase,
              child: Text('FINISH PURCHASE', style: _payStyle))
        ],
      ),
    );
  }
}
