import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tadoo/home.dart';

class EditNt extends StatefulWidget {
  String? titlee;
  String? Contentee;
  int? idee;
  EditNt(
      {super.key,
      required this.Contentee,
      required this.titlee,
      required this.idee});

  @override
  State<EditNt> createState() => _EditNtState();
}

class _EditNtState extends State<EditNt> {
  Future<dynamic> postData() async {
    final Url = "http://192.168.29.151:8080/updateNotes";
    var body = {"id": widget.idee, "title": title.text, "content": tass.text};
    var response = await post(Uri.parse(Url), body: jsonEncode(body));
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => HomeWid())));

      return jsonDecode(response.body);
    }
  }

  TextEditingController title = TextEditingController();
  TextEditingController tass = TextEditingController();

  savedata() {
    setState(() {
      title.text = widget.titlee.toString();
      tass.text = widget.Contentee.toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    savedata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "Add Task",
            style:
                GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 45),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 50.0, left: 30, right: 30, bottom: 30),
            child: Container(
              height: MediaQuery.of(context).size.height / 6,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: TextField(
                controller: title,
                maxLines: 10,
                decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle: GoogleFonts.fredokaOne(color: Colors.black26),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 2, color: Color.fromRGBO(255, 80, 96, 1)))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: TextField(
                controller: tass,
                maxLines: 20,
                decoration: InputDecoration(
                    hintText: "Task",
                    hintStyle: GoogleFonts.fredokaOne(color: Colors.black26),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 2, color: Color.fromRGBO(255, 80, 96, 1)))),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: InkWell(
              onTap: () {
                postData();
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
