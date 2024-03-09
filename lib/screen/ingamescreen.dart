import 'package:flutter/material.dart';
import 'package:gutlay_etr_mad/data/levels.dart';
import 'package:gutlay_etr_mad/model/level_data.dart';
import 'package:gutlay_etr_mad/screen/mainscreen.dart';
import 'package:gutlay_etr_mad/screen/titlescreen.dart';
import 'package:gutlay_etr_mad/widget/dialogs.dart';
import 'package:gutlay_etr_mad/widget/empty_container.dart';
import 'package:gutlay_etr_mad/widget/image_container.dart';
import 'package:gutlay_etr_mad/widget/leaveindicator.dart';
import 'package:gutlay_etr_mad/widget/letter_container.dart';

class IngameScreen extends StatefulWidget {
  IngameScreen({required this.stageNo, required this.boardUpdator, super.key});
  int stageNo;
  Function boardUpdator;
  @override
  State<IngameScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<IngameScreen> {
  reset(int index) {
    setState(() {
      OUT[index] = "";
    });
  }

  addstage() {
    setState(() {
      if (widget.stageNo == 14) {
        widget.stageNo = 0;
        widget.boardUpdator(0);
      } else {
        ++widget.stageNo;
      }
    });
  }

  addLetter(String ch) {
    setState(() {
      if (OUT.contains("")) {
        int j = OUT.indexOf("");
        OUT[j] = ch.toUpperCase();
      } else {
        if (OUT.length < leveldata[widget.stageNo].answer.length) {
          OUT.add(ch.toUpperCase());
        }
      }
      if (OUT.join('').trim() == leveldata[widget.stageNo].answer) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => DialogCorrect(
                  answer: leveldata[widget.stageNo].answer,
                  nextStage: addstage,
                  output: OUT,
                ));
        widget.boardUpdator(widget.stageNo + 1);
      }

      print(OUT.join(''));
    });
  }

  List<LevelsData> leveldata = LEVELSTAGES;

  List<String> OUT = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffD6FAFF),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                    backgroundColor: const Color(0xffD6FAFF),
                    content: const Text(
                      'Leave the current stage?',
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
                          'Yes, Leave',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                          Navigator.of(context).pop();
                        },
                      )
                    ]),
              );
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          title: Text(
              (widget.stageNo == 9 ||
                      widget.stageNo == 19 ||
                      widget.stageNo == 29 ||
                      widget.stageNo == 39 ||
                      widget.stageNo == 49)
                  ? "Challenge Mode"
                  : "Level ${widget.stageNo + 1}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              )),
          centerTitle: true,
          backgroundColor: const Color(0xff2BC5DF),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 7,
                child: ImageContainer(
                  img: leveldata[widget.stageNo].img,
                )),
            Expanded(
              flex: 2,
              child: EmptyContainer(
                  resetter: reset,
                  input: OUT,
                  answer: leveldata[widget.stageNo].answer),
            ),
            Expanded(
              flex: 3,
              child: LetterContainer(
                  adder: addLetter, letter: leveldata[widget.stageNo].letter),
            ),
          ],
        ));
  }
}
