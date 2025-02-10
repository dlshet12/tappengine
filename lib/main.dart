import 'package:flutter/material.dart';
import './widgets/custom_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = false;

  void handleClick() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Buttons')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CustomButton(
                label: "Next",
                onPressed: handleClick,
                isLoading: isLoading,
                variant: ButtonVariant.filled,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: CustomButton(
                label: "Cancel",
                onPressed: () {},
                variant: ButtonVariant.outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
