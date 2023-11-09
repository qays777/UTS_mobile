import 'package:flutter/material.dart';

enum Gender { Female, Male }

class BmiCalculatorPage extends StatefulWidget {
  const BmiCalculatorPage({Key? key}) : super(key: key);

  @override
  _BmiCalculatorPageState createState() => _BmiCalculatorPageState();
}

class _BmiCalculatorPageState extends State<BmiCalculatorPage> {
  double _height = 170.0;
  double _weight = 70.0;
  Gender _selectedGender = Gender.Female;
  double _bmiResult = 0.0;

  void calculateBMI() {
    double heightInMeters = _height / 100;
    double bmi = _weight / (heightInMeters * heightInMeters);
    setState(() {
      _bmiResult = bmi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Gender',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedGender = Gender.Female;
                    });
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: _selectedGender == Gender.Female
                          ? Colors.blueGrey[100]
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.female,
                          size: 30,
                          color: Colors.pink,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Female',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedGender = Gender.Male;
                    });
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: _selectedGender == Gender.Male
                          ? Colors.blueGrey[100]
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.male,
                          color: Colors.blue,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Male',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Height (cm)',
              style: TextStyle(fontSize: 20),
            ),
            Slider(
              value: _height,
              min: 100.0,
              max: 220.0,
              onChanged: (newValue) {
                setState(() {
                  _height = newValue.roundToDouble();
                });
              },
            ),
            Text(
              _height.round().toString(),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Weight (kg)',
              style: TextStyle(fontSize: 20),
            ),
            Slider(
              value: _weight,
              min: 30.0,
              max: 150.0,
              onChanged: (newValue) {
                setState(() {
                  _weight = newValue.roundToDouble();
                });
              },
            ),
            Text(
              _weight.round().toString(),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                calculateBMI();
              },
              child: Text(
                'Calculate BMI',
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'BMI Result: ${_bmiResult.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
