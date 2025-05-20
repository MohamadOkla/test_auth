import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ElevatedButtonWidget extends StatefulWidget {
  ElevatedButtonWidget(
      {super.key, required this.text, required this.color, this.onPressed});
  final String text;
  final Color color;
  final VoidCallback? onPressed;

  @override
  State<ElevatedButtonWidget> createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.color,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      onPressed: () {
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      child: Text(
        widget.text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
