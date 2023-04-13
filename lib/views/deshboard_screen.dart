import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sky_trecker/views/random.dart';
import 'package:sky_trecker/widget/deshboard.dart';
import 'package:sky_trecker/widget/gap_height.dart';
import 'data_list_screen.dart';
import 'data_entry_screen.dart';

class DeshBoardScreen extends StatefulWidget {
  const DeshBoardScreen({super.key});

  @override
  State<DeshBoardScreen> createState() => _DeshBoardScreenState();
}

class _DeshBoardScreenState extends State<DeshBoardScreen> {
  Position? position;
  String stAddress = "";
  String stAdd = "";
  void setAddress() async {
    List<Location> locations = await locationFromAddress("Gronausestraat 710, Enschede");
    List<Placemark> placemarks = await placemarkFromCoordinates(52.2165157, 6.9437819);
    setState(() {
      stAddress = "${locations.last.longitude}${locations.last.latitude}";
      stAdd = "${placemarks.reversed.last.country}${placemarks.reversed.last.locality}${placemarks.reversed.last.subAdministrativeArea}";
    });
  }

  void getUserLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print("Latitude & Longitude ===>>>>>>> $position");
  }

  @override
  void initState() {
    getUserLocation();
    setAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Desh Board"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DeshBoard(
                title: "Data Entry",
                icon: Icons.receipt_long_outlined,
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => DataEntryScreen(
                          // position: position,
                          ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 10.0),
              DeshBoard(
                title: "Data List",
                icon: Icons.list_alt_outlined,
                onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => DataListScreen(),
                  ),
                ),
              ),
            ],
          ),
          gapHeight(height: 10.0),
          Expanded(
            child: SizedBox(
                height: MediaQuery.of(context).size.height / 20,
                child: Column(
                  children: [
                    Text(
                      position == null ? "Location is Empty" : position.toString(),
                    ),
                    gapHeight(height: 20.0),
                    Text(
                      stAddress == null ? "Location is not set" : stAddress.toString(),
                    ),
                    gapHeight(height: 20.0),
                    Text(
                      stAdd == null ? "Location is not sets" : stAdd.toString(),
                    ),
                  ],
                )
                // TextField(
                //   controller: _phoneController,
                //   // keyboardType: TextInputType.phone,
                //   decoration: const InputDecoration(
                //     // hintText: "Sadman",
                //     hintStyle: TextStyle(color: Colors.black26),
                //     contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                //     border: OutlineInputBorder(),
                //   ),
                // ),
                ),
          ),
        ],
      ),
    );
  }
}
