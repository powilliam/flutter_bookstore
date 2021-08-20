import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (_) => const Book());

  const Book({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: <Widget>[
        ElevatedButton(
          onPressed: () {},
          child: const Text('Buy now for \$46.99'),
        )
      ],
      body: const CustomScrollView(
          slivers: <Widget>[_SliverAppBar(), _Details()]),
    );
  }
}

class _SliverAppBar extends StatelessWidget {
  const _SliverAppBar({Key? key}) : super(key: key);

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
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border, color: Colors.black)),
      ],
    );
  }
}

class _Details extends StatelessWidget {
  const _Details({Key? key}) : super(key: key);

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
      Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Image.asset("images/chanel_catwalk.png",
            width: 212, height: 310, fit: BoxFit.cover),
        const SizedBox(height: 32),
        Text('Yves Saint Laurent', style: _titleStyle),
        const SizedBox(height: 8),
        Text('Suzy Menkes', style: _authorStyle),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
              'A spectacular visual journey through 40 years of haute couture from one of the best-known and most trend-setting brands in fashion.',
              style: _contentStyle),
        ),
      ])
    ]));
  }
}
