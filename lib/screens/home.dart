import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_toggle.dart';
import '../widgets/custom_tab.dart';
import '../widgets/custom_radio.dart';
import '../widgets/custom_textarea.dart';
import '../widgets/theme_provider.dart';
import './textfield_screen.dart';
import './select_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/modal.dart';

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
  child: Column(
    children: [
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

      CustomToggle(
        value: isToggled,
        onChanged: (value) {
          setState(() {
            isToggled = value;
          });
        },
      ),
      SizedBox(height: 20),

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
      SizedBox(height: 40), // Extra spacing before navigation buttons

      // Wrapping navigation buttons inside a flexible container
      Container(
        height: MediaQuery.of(context).size.height * 0.3, // 30% of screen height
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Equal spacing
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TextFieldScreen()),
                );
              },
              child: Text("Go to TextField"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectScreen()),
                );
              },
              child: Text("Go to Select Screen"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabsScreen()),
                );
              },
              child: Text("Go to Tabs Screen"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ModalScreen()),
                );
              },
              child: Text("Show All Modals"),
            ),
          ],
        ),
      ),
    ],
  ),
),

    );
  }
}
