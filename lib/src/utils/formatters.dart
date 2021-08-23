extension FormattersExtension on List<String>? {
  String names() => this!.length > 1 ? this!.join(', ') : this!.first;
}
