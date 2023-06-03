import 'package:flutter/material.dart';
import 'ActivitiesForm.dart';
import 'BankDepositForm.dart';
import 'BankTransactionsForm.dart';
import 'LoansForm.dart';
import 'PaymentForm.dart';
import 'ReportForm.dart';
import 'TransactionForm.dart';




void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/BankDeposit': (context) => BankDepositForm(),
      '/BankTransactions': (context) => BankTransactionForm(),
      '/payments': (context) => PaymentForm(),
      '/Loans': (context) => LoanForm(),
      '/Transactions': (context) => TransactionForm(),
      '/Activity': (context) => ActivityForm(),
      '/Report': (context) => ReportForm(),
      // Add more routes for other pages/forms
    },
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.green
      ),
    body: Container(
    color: Colors.grey, // Set the background color
    child: Center(
    child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Home Page'),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/BankTransactions');
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.swap_horiz,
                          color: Colors.blue, // Set the color of the icon
                        ),
                        SizedBox(height: 5),
                        // Add spacing between icon and text
                        Text('BankTransactions'),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/payments');
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.payment,
                          color: Colors.red, // Set the color of the icon
                        ),
                        SizedBox(height: 5),
                        Text('Payments'),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/BankDeposit');
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.payment,
                          color: Colors.green, // Set the color of the icon
                        ),
                        SizedBox(height: 5),
                        Text('BankDeposits'),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/Activity');
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.event,
                          color: Colors.orange, // Set the color of the icon
                        ),
                        SizedBox(height: 5),
                        Text('Activity'),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/Loans');
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: Colors.purple, // Set the color of the icon
                        ),
                        SizedBox(height: 5),
                        Text('Loans'),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/Transactions');
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.swap_horiz,
                          color: Colors.teal, // Set the color of the icon
                        ),
                        SizedBox(height: 5),
                        Text('Transactions'),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/Report');
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.report,
                          color: Colors.amber, // Set the color of the icon
                        ),
                        SizedBox(height: 5),
                        Text('Report'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}