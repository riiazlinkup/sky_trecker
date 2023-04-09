import 'package:flutter/material.dart';
import 'package:sky_trecker/widget/button.dart';

class EntryScreen extends StatefulWidget {
  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

final TextEditingController _nameController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();

enum NewSimValue { yes, no }

enum BlAppValue { yes, no }

enum ToffeeAppValue { yes, no }

enum DataCellValue { yes, no }

enum RechargeValue { yes, no }

enum GiftValue { yes, no }

NewSimValue? _newSim;
BlAppValue? _bLApp;
ToffeeAppValue? _toffeeApp;
RechargeValue? _recharge;
GiftValue? _gift;
DataCellValue? _dataCell;
bool _dataCellFieldVisible = false;
bool _rechargeFieldVisible = false;
bool _giftFieldVisible = false;
bool _textFieldVisible = false;
List<String> items = ["One", "Two", "Three"];
String? dropDownvalue;

class _EntryScreenState extends State<EntryScreen> {
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
                          value: NewSimValue.yes,
                          groupValue: _newSim,
                          activeColor: Colors.teal,
                          onChanged: (NewSimValue? value) {
                            setState(() {
                              _newSim = value;
                              //_textFieldVisible = value == Value.yes;
                            });
                          },
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
                          value: NewSimValue.no,
                          groupValue: _newSim,
                          activeColor: Colors.teal,
                          onChanged: (NewSimValue? value) {
                            setState(() {
                              _newSim = value;
                            });
                          },
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
                          value: BlAppValue.yes,
                          groupValue: _bLApp,
                          activeColor: Colors.teal,
                          onChanged: (BlAppValue? value) {
                            setState(() {
                              _bLApp = value;
                            });
                          },
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
                          value: BlAppValue.no,
                          groupValue: _bLApp,
                          activeColor: Colors.teal,
                          onChanged: (BlAppValue? value) {
                            setState(() {
                              _bLApp = value;
                            });
                          },
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
                          value: ToffeeAppValue.yes,
                          groupValue: _toffeeApp,
                          activeColor: Colors.teal,
                          onChanged: (ToffeeAppValue? value) {
                            setState(() {
                              _toffeeApp = value;
                            });
                          },
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
                          value: ToffeeAppValue.no,
                          groupValue: _toffeeApp,
                          activeColor: Colors.teal,
                          onChanged: (ToffeeAppValue? value) {
                            setState(() {
                              _toffeeApp = value;
                            });
                          },
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
                    child: Text("Data Cell"),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Radio(
                            value: DataCellValue.yes,
                            groupValue: _dataCell,
                            activeColor: Colors.teal,
                            onChanged: (DataCellValue? value) {
                              setState(() {
                                _dataCell = value;
                                _dataCellFieldVisible = value == DataCellValue.yes;
                              });
                            }),
                        const Text("Yes"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Row(
                      children: [
                        Radio(
                            value: DataCellValue.no,
                            groupValue: _dataCell,
                            activeColor: Colors.teal,
                            onChanged: (DataCellValue? value) {
                              setState(() {
                                _dataCell = value;
                              });
                            }),
                        const Text("No"),
                      ],
                    ),
                  ),
                ],
              ),
              if (_dataCell == DataCellValue.yes)
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
                            value: RechargeValue.yes,
                            groupValue: _recharge,
                            activeColor: Colors.teal,
                            onChanged: (RechargeValue? value) {
                              setState(() {
                                _recharge = value;
                                _rechargeFieldVisible = value == RechargeValue.yes;
                              });
                            }),
                        const Text("Yes"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Row(
                      children: [
                        Radio(
                          value: RechargeValue.no,
                          groupValue: _recharge,
                          activeColor: Colors.teal,
                          onChanged: (RechargeValue? value) {
                            setState(() {
                              _recharge = value;
                            });
                          },
                        ),
                        const Text("No"),
                      ],
                    ),
                  ),
                ],
              ),
              if (_recharge == RechargeValue.yes)
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a text',
                  ),
                ),

              // ////////////////////////////////////////////////////////
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
                          value: GiftValue.yes,
                          groupValue: _gift,
                          activeColor: Colors.teal,
                          onChanged: (GiftValue? value) {
                            setState(() {
                              _gift = value;
                              _giftFieldVisible = value == GiftValue.yes;
                            });
                          },
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
                          value: GiftValue.no,
                          groupValue: _gift,
                          activeColor: Colors.teal,
                          onChanged: (GiftValue? value) {
                            setState(() {
                              _gift = value;
                            });
                          },
                        ),
                        const Text("No"),
                      ],
                    ),
                  ),
                ],
              ),
              if (_gift == GiftValue.yes)
                Padding(
                  padding: const EdgeInsets.only(right: 45.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton(
                        underline: SizedBox.shrink(),
                        value: dropDownvalue,
                        hint: const Text("Select Gift"),
                        items: items.map((String mapValue) {
                          return DropdownMenuItem<String>(
                            value: mapValue,
                            child: Text(mapValue),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            dropDownvalue = value!;
                          });
                        },
                      ),
                    ],
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
