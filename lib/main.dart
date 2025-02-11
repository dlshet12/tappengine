import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widgets/custom_button.dart';
import './widgets/custom_toggle.dart';
import './widgets/custom_tab.dart';
import './widgets/custom_radio.dart';
import './widgets/custom_textarea.dart';
import './widgets/theme_provider.dart';

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
          home: HomeScreen(),
        );
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  bool isToggled = false;
  int selectedTab = 0;
  String selectedRadio = 'Option 1';
  TextEditingController textController = TextEditingController();

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
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Custom Button
            CustomButton(
              label: "Next",
              onPressed: handleClick,
              isLoading: isLoading,
              variant: ButtonVariant.filled,
            ),
            SizedBox(height: 20),

            CustomButton(
              label: "Cancel",
              onPressed: () {},
              variant: ButtonVariant.outlined,
            ),
            SizedBox(height: 20),

            // Toggle Button
            CustomToggle(
              value: isToggled,
              onChanged: (value) {
                setState(() {
                  isToggled = value;
                });
              },
            ),
            SizedBox(height: 20),

            // Tab Switch Buttons
            CustomTabs(
              tabs: ["Tab 1", "Tab 2", "Tab 3"],
              selectedIndex: selectedTab,
              onTabSelected: (index) {
                setState(() {
                  selectedTab = index;
                });
              },
            ),
            SizedBox(height: 20),

            // Radio Buttons
            CustomRadio(
              label: "Option 1",
              value: "Option 1",
              groupValue: selectedRadio,
              onChanged: (value) {
                setState(() {
                  selectedRadio = value!;
                });
              },
            ),
            CustomRadio(
              label: "Option 2",
              value: "Option 2",
              groupValue: selectedRadio,
              onChanged: (value) {
                setState(() {
                  selectedRadio = value!;
                });
              },
            ),
            SizedBox(height: 20),

            // Textarea
            CustomTextarea(controller: textController),
          ],
        ),
      ),
    );
  }
}
