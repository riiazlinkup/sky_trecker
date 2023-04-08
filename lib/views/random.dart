import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


enum Place { road, home, work }
class _HomePageState extends State<HomePage> {
  
  Place? _place;
  bool _homeFieldVisible = false;

  void handleSelection(Place? value) {
    setState(() {
      _place = value;
      _homeFieldVisible = value == Place.home;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              RadioListTile(
                title: const Text('on the road'),
                value: Place.road,
                groupValue: _place,
                onChanged: handleSelection,
              ),
              RadioListTile(
                title: const Text('at home'),
                value: Place.home,
                groupValue: _place,
                onChanged: handleSelection,
              ),
              if (_homeFieldVisible)
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                  ),
                ),
              RadioListTile(
                title: const Text('at work'),
                value: Place.work,
                groupValue: _place,
                onChanged: handleSelection,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
