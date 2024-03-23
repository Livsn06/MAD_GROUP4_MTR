import 'package:flutter/material.dart';
import 'package:gutlay_etr_mad/data/levels.dart';
import 'package:gutlay_etr_mad/model/levels/level_model.dart';
import 'package:gutlay_etr_mad/widget/dialog_indicator/dialogs.dart';

class LetterFunction extends ChangeNotifier {
  final List<LevelsData> _leveldata = LEVELSTAGES;
  final List<String> _handler = [];
  int _stageNo = 0;
  final int _percentage = 0;

  int get stageindex => _stageNo;
  List<String> get handler => _handler;
  List<LevelsData> get leveldata => _leveldata;

  //? PARA MA UPDATE STAGE
  void updateBoard({required int currentIndex}) {
    _stageNo = (_stageNo == 14) ? 0 : ++_stageNo;
    notifyListeners();
  }

  //? PARA MA RESET UNG ANSWER FIELD
  void reset({required int index}) {
    handler[index] = '';
    notifyListeners();
  }

  void clearAnswer() {
    _handler.clear();
    notifyListeners();
  }

  // _addstage(int stageno) {

  //     _stageNo = (_stageNo == 14)? 0 :  ++_stageNo;
  //     notifyListeners();
  // }

  void addLetter(
      {required BuildContext context,
      required String letter,
      required int stageIndex}) {
    if (_handler.contains("")) {
      int j = _handler.indexOf("");
      _handler[j] = letter.toUpperCase();
    } else if (_handler.length < leveldata[_stageNo].answer.length) {
      _handler.add(letter.toUpperCase());
    }

    if (validateAnswer()) {
      showDialog(
          context: context,
          builder: (context) {
            return DialogIndicator.showCorrectAnswer(context: context);
          });
    }
    notifyListeners();
    print(_handler.join(''));
  }

  //? VALIDATE ANSWER
  bool validateAnswer() {
    var val =
        (_handler.join('').trim() == leveldata[_stageNo].answer) ? true : false;
    return val;
  }

  // void addHive({required int index, required int percentage}) {
  //   hivename.put('index': index);
  //   hivename.put('pecntage': index);
  // }

  // void setStageno() {
  //   _stageNo = hivename.get('index');
  // }

  // void setPoints() {
  //   _percentage = hivename.get('pecntage');
  // }
}
