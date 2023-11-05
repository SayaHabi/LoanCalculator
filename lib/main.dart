import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
      home: LoanCalculatorApp(),
    ));

class LoanCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Loan Calculator'),
        ),
        body: LoanCalculatorScreen(),
      ),
    );
  }
}

class LoanCalculatorScreen extends StatefulWidget {
  @override
  _LoanCalculatorScreenState createState() => _LoanCalculatorScreenState();
}

class _LoanCalculatorScreenState extends State<LoanCalculatorScreen> {
  TextEditingController loanAmountController = TextEditingController();
  TextEditingController termController = TextEditingController();
  TextEditingController interestRateController = TextEditingController();
  double monthlyPayment = 0.0;
  double totalPayment = 0.0;
  double totalInterest = 0.0;
  int numberOfPayments = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[250]),
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          (Image.asset('assets/splash.png')),
          TextField(
            controller: loanAmountController,
            decoration: InputDecoration(labelText: 'Loan Amount'),
          ),
          TextField(
            controller: termController,
            decoration: InputDecoration(labelText: 'Loan Terms (In Years)'),
          ),
          TextField(
            controller: interestRateController,
            decoration: InputDecoration(labelText: 'Interest (%)'),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: calculateMonthlyPayment,
            child: Text('Calculate'),
          ),
          SizedBox(height: 20.0),
          Text('Monthly Payment: \$${monthlyPayment.toStringAsFixed(2)}'),
          Text('Total Payment: \$${totalPayment.toStringAsFixed(2)}'),
          Text('Total Interest: \$${totalInterest.toStringAsFixed(2)}'),
          Text('Number Of Payments: $numberOfPayments times'),
        ],
      ),
    );
  }

  void calculateMonthlyPayment() {
    double principal = double.parse(loanAmountController.text);
    double interestRate = double.parse(interestRateController.text) / 100;
    int term = int.parse(termController.text);

    double monthlyInterestRate = interestRate / 12;
    numberOfPayments = term * 12;

    if (monthlyInterestRate == 0) {
      monthlyPayment = principal / numberOfPayments;
    } else {
      monthlyPayment = (principal * monthlyInterestRate) /
          (1 - pow(1 + monthlyInterestRate, -numberOfPayments));
    }

    totalPayment = monthlyPayment * numberOfPayments;
    totalInterest = totalPayment - principal;

    setState(() {});
    loanAmountController.clear();
    termController.clear();
    interestRateController.clear();
  }
}
