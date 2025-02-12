import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';

class TextFieldScreen extends StatefulWidget {
  @override
  _TextFieldScreenState createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  final TextEditingController textController1 = TextEditingController();
  final TextEditingController textController2 = TextEditingController();
  final TextEditingController textController3 = TextEditingController();
  final TextEditingController textController4 = TextEditingController();
  final TextEditingController textController6 = TextEditingController();
  final TextEditingController textController7 = TextEditingController();

  int counter = 0; // Counter for Increment & Decrement field
  final TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    numberController.text = counter.toString();
  }

  void _increment() {
    setState(() {
      counter++;
      numberController.text = counter.toString();
    });
  }

  void _decrement() {
    setState(() {
      if (counter > 0) {
        counter--;
        numberController.text = counter.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Field Variants")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(label: "Standard", controller: textController1),
            CustomTextField(label: "With Icon", controller: textController2, icon: Icons.search),
            CustomTextField(label: "Password", controller: textController3, isPassword: true),
            CustomTextField(label: "Error", controller: textController4, isError: true),
            CustomTextField(label: "Disabled", controller: textController6),

            // Increment & Decrement Field Inside TextField
            TextFormField(
              controller: numberController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: "Quantity",
                border: OutlineInputBorder(),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: _decrement,
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: _increment,
                    ),
                  ],
                ),
              ),
              onChanged: (value) {
                setState(() {
                  counter = int.tryParse(value) ?? 0;
                });
              },
            ),

            SizedBox(height: 20),

            // Textarea with Cancel Icon
            TextFormField(
              controller: textController7,
              decoration: InputDecoration(
                labelText: "Textarea with Clear Icon",
                border: OutlineInputBorder(),
                suffixIcon: textController7.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.cancel, color: Colors.grey),
                        onPressed: () {
                          setState(() {
                            textController7.clear();
                          });
                        },
                      )
                    : null,
              ),
              maxLines: 3,
              onChanged: (text) {
                setState(() {}); // Update UI when text changes
              },
            ),
          ],
        ),
      ),
    );
  }
}
