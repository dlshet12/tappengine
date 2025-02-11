import 'package:flutter/material.dart';

class CustomToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomToggle({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: Colors.blue,
    );
  }
}
