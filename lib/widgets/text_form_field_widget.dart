import 'package:flutter/material.dart';

class TextFormFiledWidget extends StatefulWidget {
  TextFormFiledWidget({super.key, required this.labelText, this.controller});
  final String labelText;
  final TextEditingController? controller;

  @override
  State<TextFormFiledWidget> createState() => _TextFormFiledWidgetState();
}

class _TextFormFiledWidgetState extends State<TextFormFiledWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        fillColor: Colors.grey[100],
        filled: true,
        labelText: widget.labelText,
        hintStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
