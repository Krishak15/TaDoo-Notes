import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tadoo/home.dart';
import 'package:http/http.dart';
import 'package:tadoo/classes/userid.dart';

class Addnote extends StatefulWidget {
  const Addnote({super.key});

  @override
  State<Addnote> createState() => _AddnoteState();
}

class _AddnoteState extends State<Addnote> {
  postData() async {
    print("Fn Called");
    FirebaseFirestore.instance
        .collection('TaDoo')
        .doc('${UserId.emailId}')
        .collection('notes')
        .add({'title': title.text, 'task': tass.text, 'date': DateTime.now()});
  }

  TextEditingController title = TextEditingController();
  TextEditingController tass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 45,
          ),
          Text(
            "Add Task",
            style: GoogleFonts.outfit(
                fontWeight: FontWeight.w600,
                fontSize: 35,
                color: Colors.black87),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 50.0, left: 30, right: 30, bottom: 30),
            child: Container(
              height: MediaQuery.of(context).size.height / 6,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: title,
                  maxLines: 10,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration.collapsed(
                    hintText: "Title",
                    hintStyle: GoogleFonts.fredokaOne(
                        color: Colors.black26, fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              height: MediaQuery.of(context).size.height / 2.2,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: tass,
                  maxLines: null,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration.collapsed(
                    hintText: "Task",
                    hintStyle: GoogleFonts.fredokaOne(
                        color: Colors.black26, fontSize: 25),
                    // border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(30),
                    //     borderSide: BorderSide(
                    //         width: 2, color: Color.fromRGBO(255, 80, 96, 1)))
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: InkWell(
              onTap: () {
                if (title.text.isNotEmpty) {
                  postData();
                  // setState(() {});
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (context) => HomeWid()));
                } else {
                  final snackBar = SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        "Add title",
                        style: GoogleFonts.outfit(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      duration: Duration(seconds: 2));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Container(
                height: 60,
                width: 180,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color:
                              Color.fromRGBO(255, 80, 96, 1).withOpacity(0.7),
                          offset: Offset(0, 6),
                          blurRadius: 7),
                    ],
                    color: Color.fromRGBO(255, 80, 96, 1),
                    borderRadius: BorderRadius.circular(40)),
                child: Center(
                  child: Text(
                    "Save",
                    style: GoogleFonts.fredoka(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
