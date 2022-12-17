import 'dart:convert';
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tadoo/home.dart';
import 'package:tadoo/views/login.dart';

class WelcmPg extends StatefulWidget {
  const WelcmPg({super.key});
  static String id = 'welcomepage';
  @override
  State<WelcmPg> createState() => _WelcmPgState();
}

class _WelcmPgState extends State<WelcmPg> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    var fsize;

    @override
    void initState() {
      super.initState();
    }

    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      "Tadoo",
                      style: GoogleFonts.fredoka(
                          fontWeight: FontWeight.w600, fontSize: 40),
                    ),
                  ),
                ],
              ),
              h >= 800
                  ? SizedBox(
                      height: 50,
                    )
                  : SizedBox(
                      height: 20,
                    ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Manage your\ndaily tasks efficiently",
                  textAlign: TextAlign.left,
                  style: w >= 350
                      ? GoogleFonts.outfit(
                          fontWeight: FontWeight.w600, fontSize: 40)
                      : GoogleFonts.outfit(
                          fontWeight: FontWeight.w600, fontSize: 30),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 21),
                    child: Text(
                      "with",
                      style: w >= 350
                          ? GoogleFonts.outfit(
                              fontWeight: FontWeight.w600, fontSize: 40)
                          : GoogleFonts.outfit(
                              fontWeight: FontWeight.w600, fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        "Tadoo",
                        speed: Duration(milliseconds: 100),
                        textStyle: w >= 350
                            ? GoogleFonts.outfit(
                                decoration: TextDecoration.underline,
                                color: Color.fromRGBO(255, 80, 96, 1),
                                fontWeight: FontWeight.w600,
                                fontSize: 40,
                              )
                            : GoogleFonts.outfit(
                                decoration: TextDecoration.underline,
                                color: Color.fromRGBO(255, 80, 96, 1),
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                              ),
                      ),
                      TyperAnimatedText(
                        "Tadoo!!",
                        textStyle: w >= 350
                            ? GoogleFonts.outfit(
                                decoration: TextDecoration.underline,
                                color: Color.fromARGB(255, 255, 0, 0),
                                fontWeight: FontWeight.w600,
                                fontSize: 40,
                              )
                            : GoogleFonts.outfit(
                                decoration: TextDecoration.underline,
                                color: Color.fromARGB(255, 255, 0, 0),
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                              ),
                      )
                    ],
                    repeatForever: true,
                    pause: const Duration(milliseconds: 1000),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                ],
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.2,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("assets/images/welcm.jpg"))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: LoginWidget(),
                            childCurrent: WelcmPg(),
                            type: PageTransitionType.rightToLeftPop,
                            duration: Duration(milliseconds: 300)));
                  },
                  child: w >= 350
                      ? Container(
                          height: 60,
                          width: 200,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(255, 80, 96, 1)
                                        .withOpacity(0.7),
                                    offset: Offset(0, 6),
                                    blurRadius: 7),
                              ],
                              color: Color.fromRGBO(255, 80, 96, 1),
                              borderRadius: BorderRadius.circular(40)),
                          child: Center(
                            child: Text(
                              "Let's Start",
                              style: GoogleFonts.fredoka(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      : Container(
                          height: 50,
                          width: 160,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(255, 80, 96, 1)
                                        .withOpacity(0.7),
                                    offset: Offset(0, 6),
                                    blurRadius: 7),
                              ],
                              color: Color.fromRGBO(255, 80, 96, 1),
                              borderRadius: BorderRadius.circular(40)),
                          child: Center(
                            child: Text(
                              "Let's Start",
                              style: GoogleFonts.fredoka(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
