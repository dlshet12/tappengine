import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int? selectedTab; // Nullable for deselect functionality
  int? selectedPillTab;
  bool isDarkMode = false; // Toggle between light & dark mode

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabs Screen'),
        actions: [
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
            },
          ),
        ],
      ),
      body: Container(
        color: isDarkMode ? Colors.black : Colors.white,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Standard Tabs
            Text("Standard Tabs", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return ChoiceChip(
                  label: Text("Tab ${index + 1}"),
                  selected: selectedTab == index,
                  onSelected: (selected) {
                    setState(() {
                      selectedTab = selectedTab == index ? null : index; // Deselect logic
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 20),

            // Pill-shaped Tabs
            Text("Pill-shaped Tabs", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black)),
            Wrap(
              spacing: 10,
              children: List.generate(4, (index) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    backgroundColor: selectedPillTab == index ? Colors.blue : Colors.grey[300],
                    foregroundColor: selectedPillTab == index ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedPillTab = selectedPillTab == index ? null : index;
                    });
                  },
                  child: Text("Pill ${index + 1}"),
                );
              }),
            ),
            SizedBox(height: 20),

            // Ready-made Light & Dark Mode Example
            Text("Ready-made examples", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black)),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[900] : Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text("Example Tabs", style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ChoiceChip(
                          label: Text("Tab ${index + 1}"),
                          selected: selectedTab == index,
                          onSelected: (selected) {
                            setState(() {
                              selectedTab = selectedTab == index ? null : index;
                            });
                          },
                        ),
                      );
                    }),
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
