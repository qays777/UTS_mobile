import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_qays/screen/welcomescreen.dart';
import 'package:flutter_application_qays/widget/NavBarRoots.dart';
import 'SignUpScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passToggle = true;
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
         child:Column (
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
            padding:EdgeInsets.only(right:150),
            child:  Text(
             "Welcome Back!",
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
                      label: Text("Username"),
                    ),  
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: TextField(
                    obscureText: passToggle ? true : false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Password"),
                      suffixIcon: InkWell(
                        onTap: (){
                          if (passToggle == true ) {
                            passToggle = false;
                          }else{
                            passToggle = true;
                          }
                          setState(() {});
                        },
                        child: passToggle
                        ? Icon(CupertinoIcons.eye_slash_fill)
                        : Icon(CupertinoIcons.eye_fill),
                      ),
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
                       builder:(context) => NavBarRoots(),
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have any account?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                        builder:(context) => SignUp(),
                        ));
                      },
                       child: Text(
                        "create account",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4461F2),
                        ),
                       ),
                    ),
                  ],
                ),
          ],
       ),
      ),
    );
  }
}