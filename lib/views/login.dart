import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:tadoo/classes/userid.dart';
import 'package:tadoo/home.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final fireauth = FirebaseAuth.instance;

  TextEditingController usnm = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController pass2 = TextEditingController();

  String t = "Login";
  String ss = "";

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: w,
          height: h,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: w / 8,
                ),
                w <= 400
                    ? Text(
                        t,
                        style: GoogleFonts.comfortaa(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      )
                    : Text(
                        t,
                        style: GoogleFonts.comfortaa(
                            fontSize: 35, fontWeight: FontWeight.w800),
                      ),

                Lottie.asset("assets/animations/login-and-sign-up.json"),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: w / 1.3,
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(30)),
                      child: TextField(
                        controller: usnm,
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: GoogleFonts.outfit(),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: w / 1.3,
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(30)),
                      child: TextField(
                        controller: pass,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: GoogleFonts.outfit(),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () async {
                          setState(() {
                            if (t == "Sign Up") {
                              t = "Login";
                            }
                          });
                          var dataLog =
                              await fireauth.signInWithEmailAndPassword(
                                  email: usnm.text, password: pass.text);

                          try {
                            var dataLog2 = await fireauth
                                .signInWithEmailAndPassword(
                                    email: usnm.text, password: pass.text)
                                .then((value) {
                              UserId.emailId = usnm.text;
                              final snack3 = SnackBar(
                                backgroundColor:
                                    Color.fromARGB(255, 0, 250, 112),
                                content: Text(
                                  "Login Successful",
                                  style: GoogleFonts.outfit(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                duration: Duration(seconds: 4),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snack3);
                            });
                          } on Exception catch (e) {
                            print(".............${e}");

                            String err = e.toString();

                            final containsDnull =
                                err.contains('Given String is empty or null');

                            print("======================${containsDnull}");

                            final containsd =
                                err.contains("email-already-in-use");
                            print(containsd);

                            if (containsDnull == true) {
                              final snack = SnackBar(
                                backgroundColor: Color.fromRGBO(255, 80, 96, 1),
                                content: Text(
                                  "Enter Credentials",
                                  style: GoogleFonts.outfit(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                duration: Duration(seconds: 4),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snack);
                            } else if (containsd == true) {
                              final snack2 = SnackBar(
                                backgroundColor: Color.fromRGBO(255, 80, 96, 1),
                                content: Text(
                                  "Email already exists",
                                  style: GoogleFonts.outfit(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                duration: Duration(seconds: 4),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snack2);
                            }
                          }

                          setState(() {
                            if (dataLog == dataLog) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeWid()));
                            }
                          });
                          // print("${data}");
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(255, 80, 96, 1)
                                        .withOpacity(0.7),
                                    offset: Offset(0, 6),
                                    blurRadius: 7),
                              ],
                              color: Color.fromRGBO(255, 80, 96, 1),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Text(
                            "Login",
                            style: GoogleFonts.outfit(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            if (t == "Login") {
                              t = "Sign Up";
                            }
                          });
                          try {
                            var user = await fireauth
                                .createUserWithEmailAndPassword(
                                    email: usnm.text, password: pass.text)
                                .then((value) {
                              UserId.emailId = usnm.text;
                              final snack3 = SnackBar(
                                backgroundColor:
                                    Color.fromARGB(255, 0, 250, 112),
                                content: Text(
                                  "Signed up successfully",
                                  style: GoogleFonts.outfit(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                duration: Duration(seconds: 4),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snack3);
                            });
                          } on Exception catch (e) {
                            print(".............${e}");

                            String err = e.toString();

                            final containsD = err.contains('weak-password');

                            print(containsD);
                            final containsd =
                                err.contains("email-already-in-use");
                            print(containsd);
                            if (containsD == true) {
                              final snack = SnackBar(
                                backgroundColor: Color.fromRGBO(255, 80, 96, 1),
                                content: Text(
                                  "Weak password",
                                  style: GoogleFonts.outfit(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                duration: Duration(seconds: 4),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snack);
                            } else if (containsd == true) {
                              final snack2 = SnackBar(
                                backgroundColor: Color.fromRGBO(255, 80, 96, 1),
                                content: Text(
                                  "Email already exists",
                                  style: GoogleFonts.outfit(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                duration: Duration(seconds: 4),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snack2);
                            }
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 45, 45, 45)
                                        .withOpacity(0.7),
                                    offset: Offset(0, 6),
                                    blurRadius: 7),
                              ],
                              color: Color.fromARGB(255, 34, 34, 34),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Text(
                            "Sign Up",
                            style: GoogleFonts.outfit(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 50,
                // ),
                // Center(child: Text("${w.toString()},${h.toString()}"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
