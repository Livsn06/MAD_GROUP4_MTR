// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';

class DatabaseHelper {
  static final fourPicsOneword_box = Hive.box("4pics1Word_Box");
  //
  static void setlevelIndex({required int stageIndex}) {
    fourPicsOneword_box.put('level', stageIndex);
  }

  static int getLevelIndex() {
    var value = fourPicsOneword_box.get('level');

    if (value == null) {
      return 0;
    }

    return value;
  }
}
