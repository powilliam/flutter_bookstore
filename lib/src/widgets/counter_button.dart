import 'package:flutter/material.dart';

class LabeledButton extends StatelessWidget {
  final int label;
  final bool labelAlwaysVisible;
  final IconData icon;
  final void Function()? onPressed;

  const LabeledButton(
      {Key? key,
      required this.label,
      this.labelAlwaysVisible = false,
      this.onPressed,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        (labelAlwaysVisible || label > 0)
            ? Positioned(right: 0, top: 4, child: _Label(label: "$label"))
            : const SizedBox(),
        IconButton(onPressed: onPressed, icon: Icon(icon, color: Colors.black))
      ],
    );
  }
}

class _Label extends StatelessWidget {
  final String label;

  const _Label({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? _labelStyle = Theme.of(context)
        .textTheme
        .caption
        ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold);

    return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.red,
        ),
        child: Center(child: Text(label, style: _labelStyle)));
  }
}
