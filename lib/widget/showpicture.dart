import 'package:flutter/material.dart';

class ZoomPicture extends StatelessWidget {
  ZoomPicture({required this.picture, super.key});

  String picture;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xffD6FAFF),
      insetPadding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 185, 211, 255),
              borderRadius: BorderRadius.circular(5)),
          width: double.infinity,
          child: Image.network(
            picture,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
