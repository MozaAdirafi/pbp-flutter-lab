import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/budget.dart';


class BudgetFormPage extends StatefulWidget {
  const BudgetFormPage({super.key});

  @override
  State<BudgetFormPage> createState() => _BudgetFormPageState();
}

class _BudgetFormPageState extends State<BudgetFormPage> {

  final _formKey = GlobalKey<FormState>();
  String title = "";
  int _number = 0;
  String _type = 'Income';
  DateTime _date= DateTime.now();

  final _controllertitle = TextEditingController();
  final _controllernumber = TextEditingController();

  void clearText() {
    title = '';
    _number = 0;
  }

  bool isNumeric(String value){
    return int.tryParse(value) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Budget Info'),
      ),
      drawer: buildDrawer(context),
      // Form
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Sell Nintendo Switch",
                      labelText: "Title",
                      icon: const Icon(Icons.title),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        title = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        title = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'You need to fill the title';
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Example: 1000",
                      labelText: "Amount",
                      icon: const Icon(Icons.attach_money),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),

                    keyboardType: TextInputType.number,

                    onChanged: (String? value) {
                      setState(() {
                        _number = int.parse(value!);
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _number = value! as int;
                      });
                    },
                    
                    validator: (String? value) {

                      
                      if (value == null || value.isEmpty) {
                        return 'Amount needs to be filled';
                      }

                      
                      if (!isNumeric(value)) {
                        return 'Amount has to be an integer';
                      }
                      return null;
                    },
                  ),
                ),



                ListTile(
                  title: const Text(
                    'Budget Type: ',
                  ),
                  trailing: DropdownButton(
                    value: _type,
                    items: const <DropdownMenuItem<String>>[
                      DropdownMenuItem<String>(
                        value: 'Income',
                        child: Text('Income'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Expense',
                        child: Text('Expense'),
                      ),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        _type = newValue!;
                      });
                    },
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top:100.0),
                  child: ElevatedButton(
                    child: const Text("Date", style: TextStyle(fontSize: 15)),
      
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2099),
                      ).then((date) {
                        setState(() {
                          _date= date!;
                        });
                      });
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:20, bottom: 20),
                  child: Text(DateTime.now().toString()),
                ),
                

                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      addBudget(title, _number, _type, _date);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BudgetFormPage()),
                      );
                      clearText();
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}