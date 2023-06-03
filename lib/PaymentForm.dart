import 'package:flutter/material.dart';

class PaymentForm extends StatefulWidget {
  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _memberIdController = TextEditingController();
  TextEditingController _paymentTypeController = TextEditingController();
  TextEditingController _paymentAmountController = TextEditingController();
  String _paymentStatus = 'Pending';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Record Payment'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
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
                controller: _paymentTypeController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter payment type';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Payment Type'),
              ),
              TextFormField(
                controller: _paymentAmountController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter payment amount';
                  }
                  // You can add additional validation logic for payment amount here
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Payment Amount'),
              ),
              DropdownButtonFormField<String>(
                value: _paymentStatus,
                onChanged: (newValue) {
                  setState(() {
                    _paymentStatus = newValue!;
                  });
                },
                items: <String>['Pending', 'Confirmed', 'Rejected']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Payment Status'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Payment recording logic goes here
                    String memberId = _memberIdController.text;
                    String paymentType = _paymentTypeController.text;
                    double paymentAmount =
                    double.parse(_paymentAmountController.text);

                    // TODO: Perform payment recording API call or database insertion

                    // Show success message or navigate to the next screen
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Payment recorded successfully!')),
                    );
                  }
                },
                child: Text('Record Payment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

