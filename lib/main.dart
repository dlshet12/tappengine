import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widgets/theme_provider.dart';
import './screens/home.dart';  // Import HomeScreen

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(ThemeData.light()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.getTheme(),
          home: HomeScreen(),  // Now using HomeScreen from home.dart
        );
      },
    );
  }
}
