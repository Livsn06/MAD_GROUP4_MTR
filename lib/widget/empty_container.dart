import 'package:flutter/material.dart';
import 'package:gutlay_etr_mad/widget/dialogs.dart';

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
          if (widget.input.join('') == widget.answer) {
            return InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(221, 0, 255, 64)),
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
