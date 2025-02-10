import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final ButtonVariant variant;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.variant = ButtonVariant.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonStyle style = getButtonStyle(variant);

    return MouseRegion(
      cursor: onPressed != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: style,
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.indigo,
                  strokeWidth: 2,
                ),
              )
            : Text(label),
      ),
    );
  }

  ButtonStyle getButtonStyle(ButtonVariant variant) {
    switch (variant) {
      case ButtonVariant.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo, // Changed to navy blue
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6), // Lesser border radius
          ),
        );
      case ButtonVariant.secondary:
        return OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.indigo), // Changed border color to navy blue
          foregroundColor: Colors.indigo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6), // Lesser border radius
          ),
        );
      case ButtonVariant.disabled:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6), // Lesser border radius
          ),
        );
      default:
        return ElevatedButton.styleFrom();
    }
  }
}

enum ButtonVariant { primary, secondary, disabled }
