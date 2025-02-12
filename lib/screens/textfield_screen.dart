import 'package:flutter/material.dart';
import '../widgets/custom_textarea.dart';

class TextFieldScreen extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Field")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: CustomTextarea(controller: textController),
      ),
    );
  }
}
