import 'package:flutter/material.dart';

class DistanceCalculator extends StatefulWidget {
  const DistanceCalculator({Key? key}) : super(key: key);

  @override
  _DistanceCalculatorState createState() => _DistanceCalculatorState();
}

class _DistanceCalculatorState extends State<DistanceCalculator> {
  TextEditingController distanceController = TextEditingController();
  String selectedUnit = 'cm';
  double result = 0.0;

  void calculateDistance() {
    double distanceValue = double.tryParse(distanceController.text) ?? 0.0;
    switch (selectedUnit) {
      case 'cm':
        result = distanceValue / 100; // Convert cm to meter
        break;
      case 'dm':
        result = distanceValue / 10; // Convert dm to meter
        break;
      case 'm':
        result = distanceValue; // The input is already in meter
        break;
    }
    setState(() {});
  }

  @override
  void dispose() {
    distanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Distance Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'Distance',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: distanceController,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Unit',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedUnit,
              onChanged: (String? newValue) {
                setState(() {
                  selectedUnit = newValue ?? 'cm';
                });
              },
              items: <String>['cm', 'm', 'dm']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                calculateDistance();
              },
              child: Text(
                'Calculate',
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Distance in Meter: ${result.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DistanceCalculator(),
  ));
}