import 'package:flutter/material.dart';

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
        });
  }
}
