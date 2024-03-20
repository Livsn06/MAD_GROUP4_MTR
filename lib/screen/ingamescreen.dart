// ignore_for_file: must_be_immutable, non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';
import 'package:gutlay_etr_mad/data/levels.dart';
import 'package:gutlay_etr_mad/model/levels/level_model.dart';
import 'package:gutlay_etr_mad/styles/custom_themes/color_theme.dart';
import 'package:gutlay_etr_mad/widget/dialog_indicator/dialogs.dart';
import 'package:gutlay_etr_mad/widget/dialogs.dart';
import 'package:gutlay_etr_mad/widget/showpicture.dart';

class IngameScreen extends StatefulWidget {
  IngameScreen({required this.stageNo, required this.boardUpdator, super.key});
  int stageNo;
  Function boardUpdator;
  @override
  State<IngameScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<IngameScreen> {
  List<LevelsData> leveldata = LEVELSTAGES;

  List<String> OUT = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColorTheme.secondaryColor,
      appBar: _appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //* IMAGE CONTAINER
          //? dito mag papakita 4 na image
          Expanded(
              flex: 7,
              child: ImageContainer(
                img: leveldata[widget.stageNo].img,
              )),

          //* EMPTY CONTAINER
          //? dito naman ung container para sa sagot
          Expanded(
            flex: 2,
            child: EmptyContainer(
                resetter: _reset,
                input: OUT,
                answer: leveldata[widget.stageNo].answer),
          ),

          //* LETTERS CONTAINER
          //? dto mo makikita lahat ng leters na available
          Expanded(
            flex: 3,
            child: LetterContainer(
              adder: _addLetter,
              letter: leveldata[widget.stageNo].letter,
            ),
          ),
        ],
      ),
    );
  }

// TODO: Kasama to sa lalagyan ko ng Provider
//? ITO SA APPBAR NITONG SCREEN NA TO
  PreferredSizeWidget _appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: CustomColorTheme.primaryColor,
      //
      leading: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => DialogIndicator.leaveStage(context),
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
    );
  }

  _reset(int index) {
    setState(() {
      OUT[index] = "";
    });
  }

  _addstage() {
    setState(() {
      if (widget.stageNo == 14) {
        widget.stageNo = 0;
        widget.boardUpdator(0);
      } else {
        ++widget.stageNo;
      }
    });
  }

  _addLetter(String ch) {
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
                  nextStage: _addstage,
                  output: OUT,
                ));
        widget.boardUpdator(widget.stageNo + 1);
      }

      print(OUT.join(''));
    });
  }
}

//
//? PARA SA 4 NA IMAGE
class ImageContainer extends StatelessWidget {
  ImageContainer({required this.img, super.key});

  List img;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(15),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: img.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 4, crossAxisSpacing: 4),
      itemBuilder: (_, i) {
        return InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => ZoomPicture(
                picture: img[i],
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: const Color.fromARGB(255, 188, 213, 255), width: 3)),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.network(
                img[i],
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}

//
//? PARA SA ANSWER CONTAINER
class EmptyContainer extends StatefulWidget {
  EmptyContainer(
      {required this.resetter,
      required this.input,
      required this.answer,
      super.key});

  Function resetter;
  String answer;
  List<String> input;

  @override
  State<EmptyContainer> createState() => _EmptyContainerState();
}

class _EmptyContainerState extends State<EmptyContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: (widget.answer.length < 4)
          ? 200
          : (widget.answer.length < 5)
              ? 270
              : (widget.answer.length < 6)
                  ? 300
                  : (widget.answer.length < 8)
                      ? 400
                      : double.infinity,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.answer.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.answer.length,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemBuilder: (_, i) {
          if (widget.input.join('') == widget.answer) {
            return InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xDD00FF40)),
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 155, 255, 161)),
                child: Visibility(
                  visible: true,
                  child: Center(
                    child: Text(
                      widget.input[i].toUpperCase(),
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            );
          } else if (i < widget.input.length) {
            return (!widget.input.contains("") &&
                    widget.input.length == widget.answer.length &&
                    widget.input.join('') != widget.answer)
                ? InkWell(
                    onTap: () {
                      widget.resetter(i);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(221, 255, 10, 10)),
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 255, 209, 209)),
                      child: Visibility(
                        visible: true,
                        child: Center(
                          child: Text(
                            widget.input[i].toUpperCase(),
                            style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      widget.resetter(i);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black87),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Visibility(
                        visible: true,
                        child: Center(
                          child: Text(
                            widget.input[i].toUpperCase(),
                            style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  );
          } else {
            return InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black87),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: const Visibility(
                  visible: false,
                  child: Center(
                    child: Text(""),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

//
//? PARA SA LETTERS
class LetterContainer extends StatelessWidget {
  LetterContainer({required this.adder, required this.letter, super.key});

  Function adder;
  List<String> letter;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      itemCount: letter.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: letter.length <= 12 ? 6 : 7,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4),
      itemBuilder: (_, i) {
        return InkWell(
          onTap: () {
            adder(letter[i].toUpperCase());
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black87),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white),
            child: Center(
              child: Text(
                letter[i].toUpperCase(),
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        );
      },
    );
  }
}
