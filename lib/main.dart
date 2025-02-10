import 'package:flutter/material.dart';
import 'widgets/custom_button.dart'; // Import the button component

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Button')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                label: "Next",
                onPressed: () {
                  print("Primary Button Clicked");
                },
                variant: ButtonVariant.primary,
              ),
              SizedBox(height: 16),
              CustomButton(
                label: "Next",
                onPressed: () {},
                variant: ButtonVariant.secondary,
              ),
              SizedBox(height: 16),
              CustomButton(
                label: "Loading Button",
                onPressed: () {},
                isLoading: true, // Show loading state
                variant: ButtonVariant.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
