// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gutlay_etr_mad/screen/ingamescreen.dart';

class CustomScreenRoutes {
  //
  static void goto_IngameScreen(
      BuildContext context, int stageno, updaterBoard) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IngameScreen(
          stageNo: stageno,
          boardUpdator: updaterBoard,
        ),
      ),
    );
  }
}
