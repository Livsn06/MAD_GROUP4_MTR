import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  Leaderboard({required this.StageNo, super.key});

  int StageNo;

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
                    '${StageNo + 1}/50',
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
}
