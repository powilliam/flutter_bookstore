import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String authors;
  final String url;
  final void Function()? onTap;

  const BookCard(
      {Key? key,
      required this.title,
      required this.authors,
      required this.url,
      this.onTap})
      : super(key: key);

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
          onTap: onTap,
          child: Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(url, width: 72, height: 106),
                  const SizedBox(width: 16),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        Text(title, style: _titleStyle),
                        const SizedBox(height: 4),
                        Text(authors, style: _authorStyle)
                      ])),
                ],
              ))),
    );
  }
}
