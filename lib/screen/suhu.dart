import 'package:flutter/material.dart';

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({Key? key}) : super(key: key);

  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  TextEditingController temperatureController = TextEditingController();
  String selectedUnit = 'Celsius';
  double result = 0.0;

  void convertTemperature() {
    double temperatureValue = double.tryParse(temperatureController.text) ?? 0.0;
    switch (selectedUnit) {
      case 'Celsius':
        result = temperatureValue;
        break;
      case 'Fahrenheit':
        result = (temperatureValue * 9 / 5) + 32;
        break;
      case 'Kelvin':
        result = temperatureValue + 273.15;
        break;
    }
    setState(() {});
  }

  @override
  void dispose() {
    temperatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'Temperature',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: temperatureController,
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
                  selectedUnit = newValue ?? 'Celsius';
                });
              },
              items: <String>['Celsius', 'Fahrenheit', 'Kelvin']
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
                convertTemperature();
              },
              child: Text(
                'Convert',
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Result: ${result.toStringAsFixed(2)} ${selectedUnit}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

