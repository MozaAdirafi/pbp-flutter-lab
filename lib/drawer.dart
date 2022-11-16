import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/budget.dart';


Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        ListTile(
          title: const Text('counter_7'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
        ListTile(
          title: const Text('Add Budget Info'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const BudgetFormPage()),
            );
          },
        ),
        ListTile(
          title: const Text('Budget Data'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DataBudgetPage()),
            );
          },
        ),
      ],
    ),
  );
}