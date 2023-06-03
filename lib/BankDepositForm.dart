import 'package:flutter/material.dart';

class BankDepositForm extends StatefulWidget {
  @override
  _BankDepositFormState createState() => _BankDepositFormState();
}

class _BankDepositFormState extends State<BankDepositForm> {
  final _formKey = GlobalKey<FormState>();
  String _userId = '';
  double _depositAmount = 0;
  String _depositStatus = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Deposit Form'),
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
                  labelText: 'User ID',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a user ID';
                  }
                  return null;
                },
                onSaved: (value) {
                  _userId = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Deposit Amount',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a deposit amount';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid amount';
                  }
                  return null;
                },
                onSaved: (value) {
                  _depositAmount = double.parse(value!);
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Deposit Status',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a deposit status';
                  }
                  return null;
                },
                onSaved: (value) {
                  _depositStatus = value!;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Here, you can perform actions like saving the bank deposit information
                    // to a database or displaying a success message.
                    // You can access the captured values using the _userId, _depositAmount, and _depositStatus variables.
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
