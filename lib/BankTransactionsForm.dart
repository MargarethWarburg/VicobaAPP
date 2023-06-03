import 'package:flutter/material.dart';

class BankTransactionForm extends StatefulWidget {
  @override
  _BankTransactionFormState createState() => _BankTransactionFormState();
}

class _BankTransactionFormState extends State<BankTransactionForm> {
  final _formKey = GlobalKey<FormState>();
  String _chequeNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Transaction Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Cheque Number',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a cheque number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _chequeNumber = value!;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Here, you can perform actions like saving the bank transaction information
                    // to a database or displaying a success message.
                    // You can access the captured cheque number using the _chequeNumber variable.
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
