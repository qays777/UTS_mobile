import 'package:flutter/material.dart';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({Key? key}) : super(key: key);

  @override
  _CurrencyConverterPageState createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  double rupiah = 0.0;
  double dollar = 0.0;
  String? selectedCurrency;

  static const Map<String, double> currencyRates = {
    'USD': 0.00007,
    'EUR': 0.00006,
    'JPY': 0.0077,
    'GBP': 0.00005,
  };

  void convertCurrency() {
    if (selectedCurrency != null) {
      double rate = currencyRates[selectedCurrency] ?? 0.0;
      dollar = rupiah * rate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'Rupiah',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                rupiah = double.tryParse(value) ?? 0.0;
              },
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
              'Convert To',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedCurrency,
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value;
                });
              },
              items: currencyRates.keys.map((String currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                convertCurrency();
                setState(() {});
              },
              child: Text(
                'Convert',
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(height: 20),
            Text(
              selectedCurrency != null ? 'Result: \$${dollar.toStringAsFixed(2)}' : 'Result: ',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
