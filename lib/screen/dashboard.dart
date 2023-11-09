import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_qays/screen/BMI.dart';
import 'package:flutter_application_qays/screen/Calculator.dart';
import 'package:flutter_application_qays/screen/MataUang.dart';
import 'package:flutter_application_qays/screen/NilaiAkhir.dart';
import 'package:flutter_application_qays/screen/jarak.dart';
import 'package:flutter_application_qays/screen/suhu.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

List imgs =[
  "doctor1.jpg",
  "doctor2.jpg",
  "doctor3.jpg",
  "doctor4.jpg",

];
final List<Menu> menus = [
    Menu(
      title: 'Calculator',
      page: CalculatorApp(), 
      image: 'assets/images/1.png',
    ),
    
    Menu(
      title: 'BMI Calculator',
      page: BmiCalculatorPage(), 
      image: 'assets/images/3.png',
    ),

     Menu(
      title: 'Currency Converter',
      page: CurrencyConverterPage(),
      image: 'assets/images/2.png',
    ),

     Menu(
      title: 'Final Score',
      page: FinalScoreCalculator(),
      image: 'assets/images/0.png',
    ),

     Menu(
      title: 'Distance',
      page: DistanceCalculator(),
      image: 'assets/images/1.png',
    ),

     Menu(
      title: 'temperature ',
      page: TemperatureConverter(),
      image: 'assets/images/1.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
  color: Color(0xFF4461F2),
  child: SingleChildScrollView(
    child: SafeArea(
      child: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Halo Qays",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                      ),
                      CircleAvatar(
                      radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30), 
                      topRight: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(right: 200),
                        child: Text(
                          "Categories",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.8, // Atur tinggi container sesuai kebutuhan
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: 6,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder:(context) => menus[index].page,
                                ));
                              },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundImage: AssetImage(menus[index].image),
                                    ),
                                    Text(
                                      menus[index].title,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);
  }
}
class Menu {
  final String title;
  final Widget page;
  final String image;

  Menu({
  required this.title,
  required this.page,
  required this.image,
  });
}

