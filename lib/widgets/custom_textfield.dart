import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isPassword;
  final bool isError;
  final IconData? icon;
  final TextInputType? keyboardType;

  CustomTextField({
    required this.label,
    required this.controller,
    this.validator,
    this.isPassword = false,
    this.isError = false,
    this.icon,
    this.keyboardType,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscured = false;

  @override
  void initState() {
    super.initState();
    isObscured = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: isObscured,
          decoration: InputDecoration(
            prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      isObscured ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                  )
                : null,
            hintText: "Enter ${widget.label.toLowerCase()}",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: widget.isError ? Colors.red : Colors.grey,
                width: 1,
              ),
            ),
          ),
          validator: widget.validator,
        ),
        if (widget.isError)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              "Invalid ${widget.label.toLowerCase()}",
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
        SizedBox(height: 16),
      ],
    );
  }
}
