import 'package:flutter/material.dart';

class CustomTextarea extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextarea({
    Key? key,
    required this.controller,
    this.hintText = "Enter text...",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 4,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
      ),
    );
  }
}
