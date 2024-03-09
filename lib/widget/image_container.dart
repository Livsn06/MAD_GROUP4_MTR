import 'package:flutter/material.dart';
import 'package:gutlay_etr_mad/widget/showpicture.dart';

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
                      ));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: const Color.fromARGB(255, 188, 213, 255),
                      width: 3)),
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
        });
  }
}
