import 'package:flutter/material.dart';

class ReportForm extends StatefulWidget {
  @override
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _memberIdController = TextEditingController();
  TextEditingController _reportDateController = TextEditingController();
  TextEditingController _reportTypeController = TextEditingController();
  TextEditingController _reportTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Report'),
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
                controller: _reportDateController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter report date';
                  }
                  // You can add additional validation logic for report date here
                  return null;
                },
                decoration: InputDecoration(labelText: 'Report Date'),
              ),
              TextFormField(
                controller: _reportTypeController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter report type';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Report Type'),
              ),
              TextFormField(
                controller: _reportTextController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter report text';
                  }
                  return null;
                },
                maxLines: 5,
                decoration: InputDecoration(labelText: 'Report Text'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Report creation logic goes here
                    String memberId = _memberIdController.text;
                    String reportDate = _reportDateController.text;
                    String reportType = _reportTypeController.text;
                    String reportText = _reportTextController.text;

                    // TODO: Perform report creation API call or database insertion

                    // Show success message or navigate to the next screen
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Report created successfully!')),
                    );
                  }
                },
                child: Text('Create Report'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

