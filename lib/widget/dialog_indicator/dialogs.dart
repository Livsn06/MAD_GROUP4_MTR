import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gutlay_etr_mad/providers/letter_functions.dart';
import 'package:gutlay_etr_mad/styles/custom_themes/color_theme.dart';
import 'package:gutlay_etr_mad/styles/custom_themes/text_theme.dart';
import 'package:provider/provider.dart';

class DialogIndicator {
  //* EXIT GAME
  static AlertDialog exitDialog(
      {required BuildContext context, required String title}) {
    return AlertDialog(
      backgroundColor: CustomColorTheme.secondaryColor,
      content: Text(
        title,
        style: const TextStyle(fontSize: 24, color: Colors.black87),
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: CustomColorTheme.primaryColor,
          ),
          child: const Text(
            'Hindi',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffEB0000),
          ),
          child: const Text(
            'Oo, Umalis',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            exit(0);
          },
        )
      ],
    );
  }

  //* LEAVING IN GAME LEVEL
  static AlertDialog leaveStage(BuildContext context) {
    return AlertDialog(
      backgroundColor: CustomColorTheme.secondaryColor,
      content: const Text(
        'Umalis sa kasalukuyang stage?',
        style: TextStyle(fontSize: 15, color: Colors.black87),
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: CustomColorTheme.primaryColor,
          ),
          child: const Text(
            'Hindi',
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
            'Oo, Umalis',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            context.go('/title');
          },
        )
      ],
    );
  }

  //* Show Answer
  static Dialog showCorrectAnswer({required BuildContext context}) {
    var provider = Provider.of<LetterFunction>(context, listen: false);
    return Dialog(
      backgroundColor: CustomColorTheme.secondaryColor,
      insetPadding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: SizedBox(
        height: 200,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(6),
              child: Text('ANSWER',
                  style: CustomTextTheme.textStyle(
                    color: const Color(0xFF242424),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(5)),
                width: double.infinity,

                // tatawain dto ung provider _hanlder
                child: Text(
                  provider.leveldata[provider.stageindex].answer,
                  textAlign: TextAlign.center,
                  style: CustomTextTheme.textStyle(
                    fontsize: 25,
                    fontWeight: FontWeight.w600,
                    color: CustomColorTheme.btnBorderColor1,
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 30)),
            ElevatedButton(
              onPressed: () {
                int index = provider.stageindex + 1;

                if (index <= 49) {
                  provider.updateBoard(currentIndex: index, context: context);
                  provider.clearAnswer();
                  Navigator.of(context).pop();
                } else {
                  context.go('/ending');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColorTheme.primaryColor,
                fixedSize: const Size(260, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                'Next Stage',
                style: CustomTextTheme.textStyle(
                  color: Colors.white,
                  fontsize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //* ZOOM PICTURES
  static Dialog zoomPicture({required String imagePath}) {
    return Dialog(
      backgroundColor: CustomColorTheme.secondaryColor,
      insetPadding: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
              color: CustomColorTheme.primaryColor,
              borderRadius: BorderRadius.circular(5)),
          width: double.infinity,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  //* Show leaderboard
  static Dialog showLeaderboard({required BuildContext context}) {
    var provider = Provider.of<LetterFunction>(context, listen: false);
    return Dialog(
      backgroundColor: const Color(0xffD6FAFF),
      insetPadding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), //this right here
      child: SizedBox(
        height: 200,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 185, 211, 255),
                    borderRadius: BorderRadius.circular(5)),
                width: double.infinity,
                child: const Text(
                  "Classic Mode",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Current Level: ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 27, 27, 27), fontSize: 18),
                  ),
                  Text(
                    '${provider.stageindex + 1}/15',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 27, 27, 27), fontSize: 18),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 30)),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2BC5DF),
                    fixedSize: const Size(260, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                child: const Text(
                  'Close',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 15),
                )),
          ],
        ),
      ),
    );
  }

  //
  //
  //
}
