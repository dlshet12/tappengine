import 'package:flutter/material.dart';

class SelectScreen extends StatefulWidget {
  @override
  _SelectScreenState createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  String? selectedValue;
  int selectedToggleIndex = 0;
  String? selectedRadio;
  List<bool> isSelected = [true, false, false];
  List<String> options = ["Option 1", "Option 2", "Option 3"];
  List<bool> checkBoxValues = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Options")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Dropdown Select"),
            DropdownButtonFormField<String>(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
  ),
  value: selectedValue,
  items: options.map((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
  onChanged: (String? newValue) {
    setState(() {
      selectedValue = newValue;
    });
  },
  dropdownColor: Colors.white, // Ensures dropdown is visible properly
  elevation: 4, // Helps in rendering it below the field
  menuMaxHeight: 200, // Controls dropdown height
),
            SizedBox(height: 20),

            _buildSectionTitle("Segmented Buttons"),
            ToggleButtons(
              isSelected: isSelected,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    isSelected[i] = i == index;
                  }
                });
              },
              children: options
                  .map((text) => Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(text),
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),

            _buildSectionTitle("Radio Buttons"),
            Column(
              children: options.map((option) {
                return RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: selectedRadio,
                  onChanged: (String? value) {
                    setState(() {
                      selectedRadio = value;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            _buildSectionTitle("Checkboxes"),
            Column(
              children: List.generate(options.length, (index) {
                return CheckboxListTile(
                  title: Text(options[index]),
                  value: checkBoxValues[index],
                  onChanged: (bool? value) {
                    setState(() {
                      checkBoxValues[index] = value ?? false;
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 20),

            _buildSectionTitle("Popup Menu"),
            PopupMenuButton<String>(
              onSelected: (String value) {
                setState(() {
                  selectedValue = value;
                });
              },
              itemBuilder: (BuildContext context) {
                return options.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Show Popup Menu"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
