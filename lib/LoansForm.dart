import 'package:flutter/material.dart';

class LoanForm extends StatefulWidget {
  @override
  _LoanFormState createState() => _LoanFormState();
}

class _LoanFormState extends State<LoanForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _memberIdController = TextEditingController();
  TextEditingController _loanAmountController = TextEditingController();
  String _loanStatus = 'Pending';
  TextEditingController _repaymentScheduleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Record Loan'),
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
                controller: _loanAmountController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter loan amount';
                  }
                  // You can add additional validation logic for loan amount here
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Loan Amount'),
              ),
              DropdownButtonFormField<String>(
                value: _loanStatus,
                onChanged: (newValue) {
                  setState(() {
                    _loanStatus = newValue!;
                  });
                },
                items: <String>['Pending', 'Approved', 'Rejected']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Loan Status'),
              ),
              TextFormField(
                controller: _repaymentScheduleController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter repayment schedule';
                  }
                  // You can add additional validation logic for repayment schedule here
                  return null;
                },
                decoration: InputDecoration(labelText: 'Repayment Schedule'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Loan recording logic goes here
                    String memberId = _memberIdController.text;
                    double loanAmount = double.parse(_loanAmountController.text);
                    String repaymentSchedule =
                        _repaymentScheduleController.text;

                    // TODO: Perform loan recording API call or database insertion

                    // Show success message or navigate to the next screen
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Loan recorded successfully!')),
                    );
                  }
                },
                child: Text('Record Loan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

