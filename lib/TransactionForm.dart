import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _paymentIdController = TextEditingController();
  TextEditingController _loanIdController = TextEditingController();
  TextEditingController _memberIdController = TextEditingController();
  TextEditingController _transactionAmountController = TextEditingController();
  String _transactionStatus = 'Pending';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Record Transaction'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _paymentIdController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter payment ID';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Payment ID'),
              ),
              TextFormField(
                controller: _loanIdController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter loan ID';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Loan ID'),
              ),
              TextFormField(
                controller: _memberIdController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter member ID';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Member ID'),
              ),
              TextFormField(
                controller: _transactionAmountController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter transaction amount';
                  }
                  // You can add additional validation logic for transaction amount here
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Transaction Amount'),
              ),
              DropdownButtonFormField<String>(
                value: _transactionStatus,
                onChanged: (newValue) {
                  setState(() {
                    _transactionStatus = newValue!;
                  });
                },
                items: <String>['Pending', 'Confirmed', 'Rejected']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Transaction Status'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Transaction recording logic goes here
                    String paymentId = _paymentIdController.text;
                    String loanId = _loanIdController.text;
                    String memberId = _memberIdController.text;
                    double transactionAmount =
                    double.parse(_transactionAmountController.text);

                    // TODO: Perform transaction recording API call or database insertion

                    // Show success message or navigate to the next screen
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Transaction recorded successfully!')),
                    );
                  }
                },
                child: Text('Record Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

