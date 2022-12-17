// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popup_card/popup_card.dart';
import 'package:http/http.dart';
import 'package:swipeable_tile/swipeable_tile.dart';
import 'package:tadoo/addnote.dart';
import 'package:tadoo/classes/userid.dart';
import 'package:tadoo/editnotes.dart';
import 'package:tadoo/editt.dart';
import 'package:tadoo/views/login.dart';

class HomeWid extends StatefulWidget {
  HomeWid({super.key});

  @override
  State<HomeWid> createState() => _HomeWidState();
}

class _HomeWidState extends State<HomeWid> {
  // Future<dynamic> getData() async {
  //   final Url = "http://192.168.29.151:8080/getNotes";
  //   var response = await get(Uri.parse(Url));
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     return jsonDecode(response.body);
  //   }
  // }

  Future<dynamic> getData() async {
    // FirebaseFirestore.instance.collection('notes').add({'data': 'vhv'});
    var data = await FirebaseFirestore.instance.collection('notes').get();
    // data.docs[0].data()['data'];

    // final Url = "http://192.168.29.151:8080/removeNotes";
    // var body = {"id": a};
    // var response = await post(Uri.parse(Url), body: jsonEncode(body));
    // if (response.statusCode == 200) {
    //   return jsonDecode(response.body);
    // }
  }

  Future? deleteData(String id) {
    FirebaseFirestore.instance
        .collection("TaDoo")
        .doc('${UserId.emailId}')
        .collection("notes")
        .doc(id)
        .delete();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  var h;
  var w;
  double? scl = 1;

  var name = "Flutter Boy";
  var img;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    final LogOut = FirebaseAuth.instance;
    @override
    void initState() {
      super.initState();
    }

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: w / 1.8,
                    height: 50,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        w >= 350
                            ? Text(
                                "Hi,",
                                style: GoogleFonts.fredoka(
                                    fontSize: 34, fontWeight: FontWeight.w600),
                              )
                            : Text(
                                "Hi,",
                                style: GoogleFonts.fredoka(
                                    fontSize: 26, fontWeight: FontWeight.w600),
                              ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          name,
                          maxLines: 1,
                          textScaleFactor: scl,
                          overflow: TextOverflow.fade,
                          style: w >= 350
                              ? GoogleFonts.fredoka(
                                  color: Color.fromRGBO(255, 80, 96, 1),
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600)
                              : GoogleFonts.fredoka(
                                  color: Color.fromRGBO(255, 80, 96, 1),
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    // alignment: Alignment.topRight,
                    child: PopupItemLauncher(
                      tag: 'test',
                      // ignore: sort_child_properties_last
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 6),
                                  blurRadius: 6,
                                  color: Color.fromARGB(255, 202, 179, 171))
                            ],
                            image: DecorationImage(
                                image: AssetImage("assets/images/boy.png"))),
                      ),
                      popUp: PopUpItem(
                        padding:
                            EdgeInsets.all(10), // Padding inside of the card
                        color: Colors.white, // Color of the card
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(40)), // Shape of the card
                        elevation: 5, // Elevation of the card
                        tag:
                            'test', // MUST BE THE SAME AS IN `PopupItemLauncher`
                        child: Container(
                          height: 250,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Flexible(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          decoration: const BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: Offset(0, 6),
                                                    blurRadius: 6,
                                                    color: Color.fromARGB(
                                                        255, 202, 179, 171))
                                              ],
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/boy.png"))),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                        child: Text(
                                          "Or",
                                          style: GoogleFonts.fredokaOne(),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          decoration: const BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: Offset(0, 6),
                                                    blurRadius: 6,
                                                    color: Color.fromARGB(
                                                        255, 202, 179, 171))
                                              ],
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/girl.png"))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    width: 250,
                                    height: 59,
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              offset: Offset(0, 6),
                                              blurRadius: 6,
                                              color: Color.fromARGB(
                                                  255, 202, 179, 171))
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.mood),
                                          hintText: "Nick Name",
                                          hintStyle: GoogleFonts.fredokaOne(
                                              color: Colors.black26),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Color.fromRGBO(
                                                      255, 80, 96, 1)))),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Flexible(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          UserId.emailId = '';
                                          await LogOut.signOut().then((value) =>
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginWidget())));
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 90,
                                          decoration: BoxDecoration(
                                              boxShadow: const [
                                                BoxShadow(
                                                    offset: Offset(0, 6),
                                                    blurRadius: 6,
                                                    color: Color.fromARGB(
                                                        255, 202, 179, 171))
                                              ],
                                              color: Color.fromARGB(
                                                  255, 255, 185, 185),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Center(
                                            child: Text(
                                              "Logout",
                                              style: GoogleFonts.fredokaOne(
                                                  color: Colors.red,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ), // Your custom child widget.
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  setState(() {});
                },
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("TaDoo")
                        .doc('${UserId.emailId}')
                        .collection("notes")
                        .orderBy("date", descending: true)
                        .snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: Text("Loading"));
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data.docs.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              // var tt = snapshot.data;
                              QueryDocumentSnapshot data =
                                  snapshot.data.docs[index];
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, right: 14, left: 14),
                                child: Dismissible(
                                  direction: DismissDirection.endToStart,
                                  key: Key(data.id),
                                  background: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.red),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 18.0),
                                          child: Icon(
                                            Icons.delete_outlined,
                                            color: Colors.white,
                                            size: 35,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  onDismissed: (direction) async {
                                    await deleteData(
                                        snapshot.data.docs[index].id);
                                    final snackBar = SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(
                                          "Note Deleted",
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        duration: Duration(seconds: 1));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Editnote(
                                                    titleEditText: data["title"]
                                                        .toString(),
                                                    TaskEditText:
                                                        data["task"].toString(),
                                                    id: snapshot
                                                        .data.docs[index].id,
                                                    doc: data,
                                                  )));
                                    },
                                    child: Container(
                                      height: 110,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: const Color.fromARGB(
                                                        255, 194, 193, 193)
                                                    .withOpacity(0.7),
                                                offset: Offset(0, 6),
                                                blurRadius: 7),
                                          ],
                                          color: Color.fromARGB(
                                              255, 252, 207, 207),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  data["title"].toString(),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.fredoka(
                                                      color: Colors.black,
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  data["task"].toString(),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.fredoka(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    }),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.note_add_outlined),
          splashColor: Colors.white,
          backgroundColor: Color.fromRGBO(255, 80, 96, 1),
          onPressed: () {
            // FirebaseFirestore.instance
            //     .collection('collectionPath')
            //     .doc('')
            //     .delete();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Addnote()));
          }),
    );
  }
}
