import 'package:flutter/material.dart';
import 'package:sky_trecker/widget/button.dart';
import 'package:sky_trecker/widget/gap_height.dart';

class OTPScreen extends StatelessWidget {
  // const OTPScreen({super.key});
  final TextEditingController _OTPController = TextEditingController();
  String? phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Phone"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          gapHeight(height: 40.0),
          Center(
            child: Text(
              "OTP Sent to your number $phoneNumber,\nPlease verify using this 4 digit OTP!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                color: Colors.amberAccent,
              ),
            ),
          ),
          gapHeight(height: 10.0),
          const Divider(color: Colors.transparent),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 8.0, 19.0, 0.0),
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text("OTP Code"),
                ),
                Expanded(
                  flex: 7,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextFormField(
                      controller: _OTPController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Enter OTP",
                        hintStyle: TextStyle(color: Colors.black26),
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          gapHeight(height: 10.0),
          const Divider(color: Colors.transparent),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 20,
              child: PurpleButton("Submit", () => null),
            ),
          ),
        ],
      ),
    );
  }
}
