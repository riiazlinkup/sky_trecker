import 'package:flutter/material.dart';
import 'package:sky_trecker/widget/button.dart';

class EntryScreen extends StatefulWidget {
  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

final TextEditingController _nameController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();

enum Value { yes, no }

Value? _newSim;
Value? _bLApp;
Value? _toffeeApp;
Value? _recharge;
Value? _gift;
Value? _value;
bool _textFieldVisible = false;

class _EntryScreenState extends State<EntryScreen> {
  // this Function represents
  void handleSelection(Value? value) {
    setState(() {
      _value = value;
      _textFieldVisible = value == Value.yes;
    });
  }
  ////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Name"),
              const SizedBox(height: 5),
              SizedBox(
                height: MediaQuery.of(context).size.height / 16,
                // width: MediaQuery.of(context).size.width / 2,
                child: TextField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Divider(color: Colors.transparent),
              const Text("Moblie Number"),
              const SizedBox(height: 5),
              SizedBox(
                height: MediaQuery.of(context).size.height / 16,
                child: TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Divider(color: Colors.transparent),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 3,
                    child: Text("New Sim"),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Radio(
                          value: Value.yes,
                          groupValue: _newSim,
                          activeColor: Colors.teal,
                          onChanged: handleSelection,
                        ),
                        const Text("Yes"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Row(
                      children: [
                        Radio(
                          value: Value.no,
                          groupValue: _newSim,
                          activeColor: Colors.teal,
                          onChanged: handleSelection,
                        ),
                        const Text("No"),
                      ],
                    ),
                  ),
                ],
              ),
              /////////////////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 3,
                    child: Text("My BL App"),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Radio(
                          value: Value.yes,
                          groupValue: _bLApp,
                          activeColor: Colors.teal,
                          onChanged: handleSelection,
                        ),
                        const Text("Yes"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Row(
                      children: [
                        Radio(
                          value: Value.no,
                          groupValue: _bLApp,
                          activeColor: Colors.teal,
                          onChanged: handleSelection,
                        ),
                        const Text("No"),
                      ],
                    ),
                  ),
                ],
              ),
              /////////////////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 3,
                    child: Text("Toffee App"),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Radio(
                          value: Value.yes,
                          groupValue: _toffeeApp,
                          activeColor: Colors.teal,
                          onChanged: handleSelection,
                        ),
                        const Text("Yes"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Row(
                      children: [
                        Radio(
                          value: Value.no,
                          groupValue: _toffeeApp,
                          activeColor: Colors.teal,
                          onChanged: handleSelection,
                        ),
                        const Text("No"),
                      ],
                    ),
                  ),
                ],
              ),
              ////////////////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 3,
                    child: Text("Data Sell"),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Radio(
                          value: Value.yes,
                          groupValue: _value,
                          activeColor: Colors.teal,
                          onChanged: handleSelection,
                        ),
                        const Text("Yes"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Row(
                      children: [
                        Radio(
                          value: Value.no,
                          groupValue: _value,
                          activeColor: Colors.teal,
                          onChanged: handleSelection,
                        ),
                        const Text("No"),
                      ],
                    ),
                  ),
                ],
              ),
              if (_textFieldVisible)
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a text',
                  ),
                ),
              // _textFieldVisible == true
              //     ? Container(
              //         width: 100.0,
              //         height: 50.0,
              //         color: Colors.amber,
              //       )
              //     : Container(),

              ///////// Recharge ////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 3,
                    child: Text("Recharge"),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Radio(
                          value: Value.yes,
                          groupValue: _recharge,
                          activeColor: Colors.teal,
                          onChanged: handleSelection,
                        ),
                        const Text("Yes"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Row(
                      children: [
                        Radio(
                          value: Value.no,
                          groupValue: _recharge,
                          activeColor: Colors.teal,
                          onChanged: handleSelection,
                        ),
                        const Text("No"),
                      ],
                    ),
                  ),
                ],
              ),
              if (_textFieldVisible)
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a text',
                  ),
                ),
              ////////////////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 3,
                    child: Text("Gift"),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Radio(
                          value: Value.yes,
                          groupValue: _gift,
                          activeColor: Colors.teal,
                          onChanged: handleSelection,
                        ),
                        const Text("Yes"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Row(
                      children: [
                        Radio(
                          value: Value.no,
                          groupValue: _gift,
                          activeColor: Colors.teal,
                          onChanged: handleSelection,
                        ),
                        const Text("No"),
                      ],
                    ),
                  ),
                ],
              ),
              if (_textFieldVisible)
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a text',
                  ),
                ),

              const SizedBox(height: 30.0),
              PurpleButton("Save", () => null),
            ],
          ),
        ),
      ),
    );
  }
}
