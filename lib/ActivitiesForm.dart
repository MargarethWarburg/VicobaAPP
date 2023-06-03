import 'package:flutter/material.dart';

class ActivityForm extends StatefulWidget {
  @override
  _ActivityFormState createState() => _ActivityFormState();
}

class _ActivityFormState extends State<ActivityForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _memberIdController = TextEditingController();
  TextEditingController _activityTypeController = TextEditingController();
  TextEditingController _activityDetailsController = TextEditingController();
  String _activityStatus = 'Pending';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Record Activity'),
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
                controller: _activityTypeController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter activity type';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Activity Type'),
              ),
              TextFormField(
                controller: _activityDetailsController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter activity details';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Activity Details'),
              ),
              DropdownButtonFormField<String>(
                value: _activityStatus,
                onChanged: (newValue) {
                  setState(() {
                    _activityStatus = newValue!;
                  });
                },
                items: <String>['Pending', 'Confirmed', 'Rejected']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Activity Status'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Activity recording logic goes here
                    String memberId = _memberIdController.text;
                    String activityType = _activityTypeController.text;
                    String activityDetails = _activityDetailsController.text;

                    // TODO: Perform activity recording API call or database insertion

                    // Show success message or navigate to the next screen
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Activity recorded successfully!')),
                    );
                  }
                },
                child: Text('Record Activity'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

