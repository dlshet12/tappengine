import 'package:flutter/material.dart';

enum ButtonVariant { filled, outlined }

class CustomButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final ButtonVariant variant;
  final double width;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.variant = ButtonVariant.filled,
    this.width = 99,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool showLoader = false;

  @override
  void didUpdateWidget(covariant CustomButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (widget.isLoading && !oldWidget.isLoading) {
      // Delay the appearance of the loading indicator for a smooth effect
      Future.delayed(Duration(milliseconds: 150), () {
        if (mounted) {
          setState(() {
            showLoader = true;
          });
        }
      });
    } else if (!widget.isLoading) {
      setState(() {
        showLoader = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200), // Smooth transition for color
        child: widget.variant == ButtonVariant.filled
            ? ElevatedButton(
                onPressed: widget.isLoading ? null : widget.onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.isLoading
                      ? Colors.grey[400] // Temporary disabled color
                      : const Color.fromARGB(255, 73, 91, 193),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: showLoader
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(widget.label),
              )
            : OutlinedButton(
                onPressed: widget.onPressed,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: const Color.fromARGB(255, 87, 101, 183),
                    width: 2,
                  ),
                  foregroundColor: const Color.fromARGB(255, 93, 108, 194),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text(widget.label),
              ),
      ),
    );
  }
}
