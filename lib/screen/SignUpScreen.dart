import 'package:flutter/material.dart';
import 'package:flutter_application_qays/screen/LoginScreen.dart';
import 'package:flutter_application_qays/widget/NavBarRoots.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage('assets/gradasi.png'),
        fit: BoxFit.cover,
        ),
        ),
        child: Column(
          children: [
            SizedBox(height:15),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                   builder:(context) => NavBarRoots(),
                   ));
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  color: Color(0xFF4461F2),
                  fontSize:18,
                ),
               ),
              ),
            ),
            SizedBox(height: 60),
          Padding(   
            padding:EdgeInsets.only(right:80 ),
            child:  Text(
             "Create Account Here",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w600,
                color: Color(0xFF000000),
              ),
             ),
             ),
            SizedBox(height:10 ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder( ),
                      label: Text("Email"),
                    ),  
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder( ),
                      label: Text("Username"),
                    ),  
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder( ),
                      label: Text("Password"),
                    ),  
                  ),
                ),
              SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: double.infinity,
                    child: Material(
                
                    color: Color(0xFF4461F2),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap:(){
                       Navigator.push(context, MaterialPageRoute(
                       builder:(context) => LoginPage()
                       ));
                      },
                      child: Padding(
                        padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        child: Center(
                          child: Text(
                            "Log in",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ),
                    ),
                                ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}