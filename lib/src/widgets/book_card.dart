import 'package:bs_app/src/screens/book.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? _titleStyle = Theme.of(context)
        .textTheme
        .subtitle1
        ?.copyWith(fontWeight: FontWeight.bold);
    final TextStyle? _authorStyle =
        Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.grey);

    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      child: InkWell(
          onTap: () {
            Navigator.of(context).push(Book.route());
          },
          child: Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset("images/fashinopolis_datathomas.png",
                      width: 72, height: 106),
                  const SizedBox(width: 16),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        Text('Yves Saint Laurent', style: _titleStyle),
                        const SizedBox(height: 4),
                        Text('Suzy Menkes', style: _authorStyle)
                      ])),
                ],
              ))),
    );
  }
}
