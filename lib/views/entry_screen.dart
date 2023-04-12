import 'package:flutter/material.dart';
import 'package:sky_trecker/views/otp_screen.dart';
import 'package:sky_trecker/widget/button.dart';

import '../helper/api_save_data.dart';
import '../widget/gap_height.dart';

class EntryScreen extends StatefulWidget {
  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

final TextEditingController _nameController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _fiveQuestionController = TextEditingController();
final TextEditingController _seventhQuestionController = TextEditingController();

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
List<String> items = ["Dhaka", "Pabna", "Kustia"];
String? dropDownvalue;

enum QuestionAns {
  Veryhappy,
  Somewhathappy,
  Neitherhappyorunhappy,
  Somewhatunhappy,
  Veryunhappy,
}

enum SixthQuestionAns {
  Verysatisfied,
  Satisfied,
  Disssatisfied,
  Verydissatisfied,
}

QuestionAns? firstQuestionAns;
QuestionAns? SecondQuestionAns;
QuestionAns? thirdQuestionAns;
QuestionAns? fourthQuestionAns;
SixthQuestionAns? sixthQuestionAns;

class _EntryScreenState extends State<EntryScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // FocusManager.instance.primaryFocus?.unfocus();
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //This Row is Enter Name
                Row(
                  children: [
                    const Expanded(
                      flex: 6,
                      child: Text("Enter Name"),
                    ),
                    Expanded(
                      flex: 7,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                        child: TextField(
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            hintText: "Enter Name",
                            hintStyle: TextStyle(color: Colors.black26),
                            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.transparent),
                // This Row is Moblie Number
                Row(
                  children: [
                    const Expanded(
                      flex: 6,
                      child: Text("Mobile Number"),
                    ),
                    Expanded(
                      flex: 7,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                        child: TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: "Mobile Number",
                            hintStyle: TextStyle(color: Colors.black26),
                            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.transparent),
                // This Row is Buy New Sim?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 7,
                      child: Text("Buy New Sim?"),
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          Radio(
                            value: NewSimValue.yes,
                            groupValue: _newSim,
                            activeColor: Colors.teal,
                            onChanged: (NewSimValue? value) {
                              setState(() {
                                _newSim = value;
                              });
                            },
                          ),
                          const Text("Yes"),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
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
                // This Row is MyBL App Install?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 7,
                      child: Text("MyBL App Install?"),
                    ),
                    Expanded(
                      flex: 4,
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
                      flex: 6,
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
                // This Row is Toffee App Install?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 7,
                      child: Text("Toffee App Install?"),
                    ),
                    Expanded(
                      flex: 4,
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
                      flex: 6,
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
                // This Row is Data Sell Package?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 7,
                      child: Text("Data Sell Package?"),
                    ),
                    Expanded(
                      flex: 4,
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
                      flex: 6,
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
                  Row(
                    children: [
                      const Expanded(
                        flex: 6,
                        child: Text("Data Sell (GB)"),
                      ),
                      Expanded(
                        flex: 7,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          child: const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'GB',
                              hintStyle: TextStyle(color: Colors.black45),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                // This Row is Recharge Package?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 7,
                      child: Text("Recharge Package?"),
                    ),
                    Expanded(
                      flex: 4,
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
                      flex: 6,
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
                  Row(
                    children: [
                      const Expanded(
                        flex: 6,
                        child: Text("Recharge (Amount)"),
                      ),
                      Expanded(
                        flex: 7,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          child: const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Amount',
                              hintStyle: TextStyle(color: Colors.black45),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                // This Row is Gift Item?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 7,
                      child: Text("Gift Item?"),
                    ),
                    Expanded(
                      flex: 4,
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
                      flex: 6,
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
                  Row(
                    children: [
                      const Expanded(
                        flex: 6,
                        child: Text("Gift Name"),
                      ),
                      Expanded(
                        flex: 7,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          child: const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Gift Name',
                              hintStyle: TextStyle(color: Colors.black45),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                const Divider(color: Colors.transparent),
                //This Row is Select Area
                Row(
                  children: [
                    const Expanded(
                      flex: 6,
                      child: Text("Select Area"),
                    ),
                    Expanded(
                      flex: 17,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton(
                            underline: const SizedBox.shrink(),
                            value: dropDownvalue,
                            hint: const Text(
                              "Select Area",
                              style: TextStyle(color: Colors.black45),
                            ),
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
                  ],
                ),
                gapHeight(height: 10.0),
                // This Column 1st Question ?
                gapHeight(height: 10.0),
                Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.black87,
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                            "How do you feel about this program of Banglalink?",
                            softWrap: false,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: QuestionAns.Veryhappy,
                            groupValue: firstQuestionAns,
                            onChanged: (QuestionAns? newVlaue) {
                              setState(() {
                                firstQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Very happy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: QuestionAns.Somewhathappy,
                            groupValue: firstQuestionAns,
                            onChanged: (QuestionAns? newVlaue) {
                              setState(() {
                                firstQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Somewhat happy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: QuestionAns.Neitherhappyorunhappy,
                            groupValue: firstQuestionAns,
                            onChanged: (QuestionAns? newVlaue) {
                              setState(() {
                                firstQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Neither happy or unhappy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: QuestionAns.Somewhatunhappy,
                            groupValue: firstQuestionAns,
                            onChanged: (QuestionAns? newVlaue) {
                              setState(() {
                                firstQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Somewhat unhappy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: QuestionAns.Veryunhappy,
                            groupValue: firstQuestionAns,
                            onChanged: (QuestionAns? newVlaue) {
                              setState(() {
                                firstQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Very unhappy"),
                      ],
                    ),
                  ],
                ),
                //const Divider(color: Colors.transparent),
                gapHeight(height: 10.0),
                // This Column 2nd Question ?
                gapHeight(height: 10.0),
                const Divider(color: Colors.transparent),
                Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.black87,
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                            "How do you like about BL 4G experience ?",
                            softWrap: false,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: QuestionAns.Veryhappy,
                            groupValue: SecondQuestionAns,
                            onChanged: (QuestionAns? newVlaue) {
                              setState(() {
                                SecondQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Very happy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: QuestionAns.Somewhathappy,
                            groupValue: SecondQuestionAns,
                            onChanged: (QuestionAns? newVlaue) {
                              setState(() {
                                SecondQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Somewhat happy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: QuestionAns.Neitherhappyorunhappy,
                            groupValue: SecondQuestionAns,
                            onChanged: (QuestionAns? newVlaue) {
                              setState(() {
                                SecondQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Neither happy or unhappy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: QuestionAns.Somewhatunhappy,
                            groupValue: SecondQuestionAns,
                            onChanged: (QuestionAns? newVlaue) {
                              setState(() {
                                SecondQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Somewhat unhappy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: QuestionAns.Veryunhappy,
                            groupValue: SecondQuestionAns,
                            onChanged: (QuestionAns? newVlaue) {
                              setState(() {
                                SecondQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Very unhappy"),
                      ],
                    ),
                  ],
                ),
                // This Column 3rd Question ?
                gapHeight(height: 10.0),
                const Divider(color: Colors.transparent),
                Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.black87,
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                            " How do you like about My BL app experience ?",
                            softWrap: false,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: QuestionAns.Veryhappy,
                            groupValue: thirdQuestionAns,
                            onChanged: (QuestionAns? newVlaue) {
                              setState(() {
                                thirdQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Very happy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: QuestionAns.Somewhathappy,
                            groupValue: thirdQuestionAns,
                            onChanged: (QuestionAns? newVlaue) {
                              setState(() {
                                thirdQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Somewhat happy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: QuestionAns.Neitherhappyorunhappy,
                            groupValue: thirdQuestionAns,
                            onChanged: (QuestionAns? newVlaue) {
                              setState(() {
                                thirdQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Neither happy or unhappy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: QuestionAns.Somewhatunhappy,
                            groupValue: thirdQuestionAns,
                            onChanged: (QuestionAns? newVlaue) {
                              setState(() {
                                thirdQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Somewhat unhappy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: QuestionAns.Veryunhappy,
                            groupValue: thirdQuestionAns,
                            onChanged: (QuestionAns? newVlaue) {
                              setState(() {
                                thirdQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Very unhappy"),
                      ],
                    ),
                  ],
                ),
                gapHeight(height: 10.0),
                const Divider(color: Colors.transparent),
                // This Column 4th Question ?
                Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.black87,
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                            "How do you like about BL gaming experience ?",
                            softWrap: false,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: QuestionAns.Veryhappy,
                            groupValue: fourthQuestionAns,
                            onChanged: (QuestionAns? newVlaue) {
                              setState(() {
                                fourthQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Very happy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: QuestionAns.Somewhathappy,
                            groupValue: fourthQuestionAns,
                            onChanged: (QuestionAns? newVlaue) {
                              setState(() {
                                fourthQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Somewhat happy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: QuestionAns.Neitherhappyorunhappy,
                            groupValue: fourthQuestionAns,
                            onChanged: (QuestionAns? newVlaue) {
                              setState(() {
                                fourthQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Neither happy or unhappy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: QuestionAns.Somewhatunhappy,
                            groupValue: fourthQuestionAns,
                            onChanged: (QuestionAns? newVlaue) {
                              setState(() {
                                fourthQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Somewhat unhappy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: QuestionAns.Veryunhappy,
                            groupValue: fourthQuestionAns,
                            onChanged: (QuestionAns? newVlaue) {
                              setState(() {
                                fourthQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Very unhappy"),
                      ],
                    ),
                  ],
                ),
                gapHeight(height: 10.0),
                const Divider(color: Colors.transparent),
                // This Column 5th Question ?
                Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.black87,
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                            "What do you think, what other features can be added to this type of event?",
                            softWrap: false,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const Divider(color: Colors.transparent),
                    TextField(
                      controller: _fiveQuestionController,
                      keyboardType: TextInputType.text,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.transparent),
                // This Column 6th Question ?
                Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.black87,
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                            "Are you satisfied with Banglalink’s overall service?",
                            softWrap: false,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: SixthQuestionAns.Verysatisfied,
                            groupValue: sixthQuestionAns,
                            onChanged: (SixthQuestionAns? newVlaue) {
                              setState(() {
                                sixthQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Very satisfied"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: SixthQuestionAns.Satisfied,
                            groupValue: sixthQuestionAns,
                            onChanged: (SixthQuestionAns? newVlaue) {
                              setState(() {
                                sixthQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Satisfied"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: SixthQuestionAns.Disssatisfied,
                            groupValue: sixthQuestionAns,
                            onChanged: (SixthQuestionAns? newVlaue) {
                              setState(() {
                                sixthQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Disssatisfied"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: SixthQuestionAns.Verydissatisfied,
                            groupValue: sixthQuestionAns,
                            onChanged: (SixthQuestionAns? newVlaue) {
                              setState(() {
                                sixthQuestionAns = newVlaue;
                              });
                            }),
                        const Text("Very dissatisfied"),
                      ],
                    ),
                  ],
                ),
                gapHeight(height: 10.0),
                const Divider(color: Colors.transparent),
                // This Column 7th Question ?
                Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.black87,
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                            "Where do you want to see Bangllink as a brand in the future?",
                            softWrap: false,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const Divider(color: Colors.transparent),
                    TextField(
                      controller: _seventhQuestionController,
                      keyboardType: TextInputType.text,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                gapHeight(height: 20.0),
                PurpleButton(
                  "Save",
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => OTPScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
