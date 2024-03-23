// ignore_for_file: must_be_immutable, non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';
import 'package:gutlay_etr_mad/providers/letter_functions.dart';
import 'package:gutlay_etr_mad/styles/custom_themes/color_theme.dart';
import 'package:gutlay_etr_mad/styles/custom_themes/text_theme.dart';
import 'package:gutlay_etr_mad/widget/dialog_indicator/dialogs.dart';
import 'package:provider/provider.dart';

class IngameScreen extends StatefulWidget {
  const IngameScreen({super.key});

  @override
  State<IngameScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<IngameScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LetterFunction>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: CustomColorTheme.secondaryColor,
          appBar: _appBar(indexstage: value.stageindex),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //* IMAGE CONTAINER
              //? dito mag papakita 4 na image
              Expanded(
                  flex: 7,
                  child: ImageContainer(
                    img: value.leveldata[value.stageindex].img,
                  )),

              //* EMPTY CONTAINER
              //? dito naman ung container para sa sagot
              Expanded(
                flex: 2,
                child: EmptyContainer(
                  input: value.handler,
                  answer: value.leveldata[value.stageindex].answer,
                ),
              ),

              //* LETTERS CONTAINER
              //? dto mo makikita lahat ng leters na available
              Expanded(
                flex: 3,
                child: LetterContainer(
                  letter: value.leveldata[value.stageindex].letter,
                ),
              ),
            ],
          ),
        );
      },
    );
  }


//? ITO SA APPBAR NITONG SCREEN NA TO
  PreferredSizeWidget _appBar({required int indexstage}) {
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
        (indexstage == 9 ||
                indexstage == 19 ||
                indexstage == 29 ||
                indexstage == 39 ||
                indexstage == 49)
            ? "Challenge Mode"
            : "Level ${indexstage + 1}",
        style: CustomTextTheme.textStyle(
          fontsize: 25,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

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
              builder: (context) =>
                  DialogIndicator.zoomPicture(imagePath: img[i]),
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
  EmptyContainer({required this.input, required this.answer, super.key});

  String answer;
  List<String> input;

  @override
  State<EmptyContainer> createState() => _EmptyContainerState();
}

class _EmptyContainerState extends State<EmptyContainer> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LetterFunction>(context, listen: false);
    return SizedBox(
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
          //
          if (widget.input.join('') == widget.answer) {
            return InkWell(
              onTap: () {},
              child: answerIndicator(index: i, isright: true),
            );
          }

          if (i < widget.input.length) {
            return (!widget.input.contains("") &&
                    widget.input.length == widget.answer.length &&
                    widget.input.join('') != widget.answer)
                ? InkWell(
                    onTap: () {
                      provider.reset(index: i);
                    },
                    child: answerIndicator(
                        index: i, isright: false, hasEmpty: false),
                  )
                : InkWell(
                    onTap: () {
                      provider.reset(index: i);
                    },
                    child: answerIndicator(
                        index: i, isright: false, hasEmpty: true),
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

  Widget answerIndicator(
      {required int index, required bool isright, bool hasEmpty = false}) {
    return (isright)
        ? Container(
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xDD00FF40)),
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 155, 255, 161)),
            child: Visibility(
              visible: true,
              child: Center(
                child: Text(
                  widget.input[index].toUpperCase(),
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        : (!hasEmpty)
            ? Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(221, 255, 10, 10)),
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 255, 209, 209)),
                child: Visibility(
                  visible: true,
                  child: Center(
                    child: Text(
                      widget.input[index].toUpperCase(),
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black87),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: Visibility(
                  visible: true,
                  child: Center(
                    child: Text(
                      widget.input[index].toUpperCase(),
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              );
  }
}

//
//? PARA SA LETTERS
class LetterContainer extends StatelessWidget {
  LetterContainer({required this.letter, super.key});

  List<String> letter;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LetterFunction>(context, listen: false);
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
            provider.addLetter(
              context: context,
              letter: letter[i].toUpperCase(),
              stageIndex: provider.stageindex,
            );
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
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
