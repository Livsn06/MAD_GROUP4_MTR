import 'package:flutter/material.dart';

class DialogCorrect extends StatelessWidget {
  DialogCorrect(
      {required this.answer,
      required this.nextStage,
      required this.output,
      super.key});

  String answer;
  Function nextStage;
  List<String> output;
  @override
  Widget build(BuildContext context) {
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
            const Padding(
              padding: EdgeInsets.all(6),
              child: Text(
                'ANSWER',
                style: TextStyle(color: Color.fromARGB(255, 27, 27, 27)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(5)),
                width: double.infinity,
                child: Text(
                  answer,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 12, 119, 0),
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 30)),
            ElevatedButton(
                onPressed: () {
                  nextStage();
                  output.clear();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2BC5DF),
                    fixedSize: const Size(260, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                child: const Text(
                  'Next Stage',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 15),
                )),
          ],
        ),
      ),
    );
  }
}
