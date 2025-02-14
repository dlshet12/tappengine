import 'package:flutter/material.dart';
import '../widgets/custom_tab.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabs Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
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
            Text("Selected Tab: Tab ${selectedTab + 1}"),
          ],
        ),
      ),
    );
  }
}
