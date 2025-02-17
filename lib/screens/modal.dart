import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class ModalScreen extends StatefulWidget {
  @override
  _ModalScreenState createState() => _ModalScreenState();
}

class _ModalScreenState extends State<ModalScreen> {
  final SignatureController _signatureController = SignatureController();

  void _showModal(BuildContext context, Widget modalContent) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: EdgeInsets.all(16),
        content: modalContent,
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Selected date: ${pickedDate.toLocal()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Modals")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Agreement Modal
            ElevatedButton(
              onPressed: () => _showModal(
                context,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.description, size: 40, color: Colors.blue),
                    SizedBox(height: 10),
                    Text(
                      "Agreement",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Please read and accept the agreement before proceeding.",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Continue"),
                    ),
                  ],
                ),
              ),
              child: Text("Show Agreement Modal"),
            ),

            SizedBox(height: 10),

            // Success Modal
            ElevatedButton(
              onPressed: () => _showModal(
                context,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, size: 40, color: Colors.green),
                    SizedBox(height: 10),
                    Text(
                      "Success!",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Your order has been placed successfully.",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Close"),
                    ),
                  ],
                ),
              ),
              child: Text("Show Success Modal"),
            ),

            SizedBox(height: 10),

            // Trade Confirmation Modal
            ElevatedButton(
              onPressed: () => _showModal(
                context,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.trending_up, size: 40, color: Colors.blue),
                    SizedBox(height: 10),
                    Text(
                      "Trade Confirmation",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Trade details: Stock - NFLX, Price - 450, Quantity - 10",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Submit"),
                    ),
                  ],
                ),
              ),
              child: Text("Show Trade Modal"),
            ),

            SizedBox(height: 10),

            // Signature Modal
            ElevatedButton(
              onPressed: () => _showModal(
                context,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Add Signature", style: TextStyle(fontSize: 20)),
                    SizedBox(height: 10),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Signature(
                        controller: _signatureController,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () => _signatureController.clear(),
                          child: Text("Clear"),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Save"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              child: Text("Show Signature Modal"),
            ),

            SizedBox(height: 10),

            // Date Picker Modal
            ElevatedButton(
              onPressed: () => _showDatePicker(context),
              child: Text("Show Date Picker"),
            ),

            SizedBox(height: 10),

            // Withdrawal Confirmation Modal
            ElevatedButton(
              onPressed: () => _showModal(
                context,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.account_balance_wallet, size: 40, color: Colors.orange),
                    SizedBox(height: 10),
                    Text(
                      "Withdrawal Request",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text("Amount: \$500.00", textAlign: TextAlign.center),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Confirm"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              child: Text("Show Withdrawal Modal"),
            ),
          ],
        ),
      ),
    );
  }
}
