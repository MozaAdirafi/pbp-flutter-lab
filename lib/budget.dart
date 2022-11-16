import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';


class DataBudgetPage extends StatefulWidget {
  const DataBudgetPage({super.key});

  @override
  State<DataBudgetPage> createState() => _DataBudgetPageState();
}

class _DataBudgetPageState extends State<DataBudgetPage> {

  static List<String> type = [];
  static List<DateTime> date = [];
  static List<String> title = [];
  static List<int> number = [];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budget Data'),
      ),

      drawer: buildDrawer(context),

      body:ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  children:[

                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                              title[index], style: const TextStyle(fontSize: 25),
                              textAlign: TextAlign.left),
                        ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(number[index].toString(), style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.left),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(type[index], style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.right),
                          ),
                        ),
                      ]
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(date[index].toString(),
                            textAlign: TextAlign.left),
                      ),
                    ),
                  ],
              )
            ),
          );
        },
        itemCount: title.length,
      ),
    );
  }
}


void addBudget(String title, int number, String type, DateTime date){
  _DataBudgetPageState.title.add(title);
  _DataBudgetPageState.number.add(number);
  _DataBudgetPageState.type.add(type);
  _DataBudgetPageState.date.add(date);
}