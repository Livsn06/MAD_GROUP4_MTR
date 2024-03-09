import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gutlay_etr_mad/screen/ingamescreen.dart';
import 'package:gutlay_etr_mad/widget/leaderboards.dart';

class TitleScreen extends StatefulWidget {
  TitleScreen({required this.stageNo, super.key});
  int stageNo;

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  updateBoard(int Nooflevel) {
    setState(() {
      widget.stageNo = Nooflevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffA0E0E9),
      appBar: AppBar(
        backgroundColor: const Color(0xff2BC5DF),
        title: Text(
          "Explore Words!",
          style: GoogleFonts.fredoka(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 60,
          ),
          Center(
            child: Image.asset("assets/images/title.png"),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff00D13A),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(color: Color(0xff009A34), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size(double.infinity, 65)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IngameScreen(
                                stageNo: widget.stageNo,
                                boardUpdator: updateBoard,
                              )));
                },
                child: Text(
                  "Let's Play!",
                  style: GoogleFonts.fredoka(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 40),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffEB7F00),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(color: Color(0xffBD6600), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size(40, 40)),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) =>
                          Leaderboard(StageNo: widget.stageNo));
                },
                child: Text(
                  "Leaderboards",
                  style: GoogleFonts.fredoka(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 25),
                )),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 110),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffEB0000),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(color: Color(0xff990000), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size(40, 40)),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        backgroundColor: const Color(0xffD6FAFF),
                        content: const Text(
                          'Do you want to exit the game?',
                          style: TextStyle(fontSize: 15, color: Colors.black87),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff2BC5DF),
                            ),
                            child: const Text(
                              'No',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffEB0000),
                            ),
                            child: const Text(
                              'Yes, Exit',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(true);
                              exit(0);
                            },
                          )
                        ]),
                  );
                },
                child: Text(
                  "Quit",
                  style: GoogleFonts.fredoka(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 25),
                )),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
