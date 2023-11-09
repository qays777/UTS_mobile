import 'package:flutter/material.dart';

class FinalScoreCalculator extends StatefulWidget {
  const FinalScoreCalculator({Key? key}) : super(key: key);

  @override
  _FinalScoreCalculatorState createState() => _FinalScoreCalculatorState();
}

class _FinalScoreCalculatorState extends State<FinalScoreCalculator> {
  TextEditingController assignmentController = TextEditingController();
  TextEditingController midtermExamController = TextEditingController();
  TextEditingController finalExamController = TextEditingController();

  double assignmentScore = 0.0;
  double midtermExamScore = 0.0;
  double finalExamScore = 0.0;

  double finalScore = 0.0;

  void calculateFinalScore() {
    double assignment = double.tryParse(assignmentController.text) ?? 0.0;
    double midtermExam = double.tryParse(midtermExamController.text) ?? 0.0;
    double finalExam = double.tryParse(finalExamController.text) ?? 0.0;

    finalScore = (assignment * 0.3) + (midtermExam * 0.3) + (finalExam * 0.4);
    setState(() {});
  }

  @override
  void dispose() {
    assignmentController.dispose();
    midtermExamController.dispose();
    finalExamController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Final Score Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'Assignment Score',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: assignmentController,
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
              'Midterm Exam Score',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: midtermExamController,
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
              'Final Exam Score',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: finalExamController,
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
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                calculateFinalScore();
              },
              child: Text(
                'Calculate',
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Final Score: ${finalScore.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
