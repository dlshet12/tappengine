import 'package:flutter/material.dart';

class CustomTabs extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const CustomTabs({
    Key? key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        tabs.length,
        (index) => GestureDetector(
          onTap: () => onTabSelected(index),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: selectedIndex == index ? Colors.blue : Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              tabs[index],
              style: TextStyle(
                color: selectedIndex == index ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
