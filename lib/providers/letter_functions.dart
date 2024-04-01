// ignore_for_file: non_constant_identifier_names, unused_field

import 'package:flutter/material.dart';
import 'package:gutlay_etr_mad/data/levels.dart';
import 'package:gutlay_etr_mad/helpers/dbase_hive.dart';
import 'package:gutlay_etr_mad/model/letters/letter.dart';
import 'package:gutlay_etr_mad/model/levels/level_model.dart';
import 'package:gutlay_etr_mad/widget/dialog_indicator/dialogs.dart';

class LetterFunction extends ChangeNotifier {
  final List<LevelsData> _leveldata = LEVELSTAGES;
  final List<Letter> _handler = [];
  final List<Letter> _selectedLetter = [];
//? Opening the created HiveBox

  int _stageNo = DatabaseHelper.getLevelIndex();
  final int _percentage = 0;

  int get stageindex => _stageNo;
  List<Letter> get handler => _handler;
  List<LevelsData> get leveldata => _leveldata;
  List<Letter> get isselected => _selectedLetter;

  //? PARA MA UPDATE STAGE
  void updateBoard({required int currentIndex, required BuildContext context}) {
    _stageNo = (_stageNo > 49) ? 0 : currentIndex;

    DatabaseHelper.setlevelIndex(stageIndex: _stageNo);
    notifyListeners();
  }

  //? PARA MA RESET UNG ANSWER FIELD
  void reset({required Letter letter, required int index}) {
    _handler[index] = Letter(letter: '', indexAt: letter.indexAt);
    notifyListeners();
  }

  void clearAnswer() {
    _handler.clear();
    _selectedLetter.clear();
    notifyListeners();
  }

  void addLetter(
      {required BuildContext context,
      required String letter,
      required int indexAt}) {
    //

    if (_handler.any((element) => element.letter.contains(''))) {
      int j = _handler.indexWhere((element) => element.letter == '');
      if (j != -1) {
        _handler[j] = Letter(letter: letter, indexAt: indexAt);
      } else {
        _handler.add(Letter(letter: letter, indexAt: indexAt));
      }
    } else if (_handler.length < leveldata[_stageNo].answer.length) {
      _handler.add(Letter(letter: letter, indexAt: indexAt));
    }

    if (validateAnswer()) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return DialogIndicator.showCorrectAnswer(context: context);
          });
    }
    notifyListeners();
    // print(_handler.join(''));
  }

  //? VALIDATE ANSWER
  bool validateAnswer() {
    var temp = _handler.map((element) => element.letter).toList();
    var val =
        (temp.join('').trim() == leveldata[_stageNo].answer) ? true : false;
    return val;
  }

  void setSelectedLetter({required String letter, required int index}) {
    _selectedLetter.add(Letter(letter: letter, indexAt: index));
  }

  void removeSelectedLetter({required int indexAt}) {
    if (_selectedLetter.isNotEmpty) {
      _selectedLetter.removeWhere((item) => item.indexAt == indexAt);
    }
  }

}
