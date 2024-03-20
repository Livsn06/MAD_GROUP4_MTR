import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gutlay_etr_mad/styles/custom_themes/color_theme.dart';
import 'package:gutlay_etr_mad/styles/custom_themes/text_theme.dart';
import 'package:quickalert/quickalert.dart';

class DialogIndicator {
  //* EXIT GAME
  static Future<void> exitDialog(
      {required BuildContext context, required String title}) async {
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      disableBackBtn: true,
      title: title,
      confirmBtnText: 'Yes, exit',
      cancelBtnText: 'No',
      cancelBtnTextStyle: CustomTextTheme.textStyle(
        color: Colors.black,
      ),
      confirmBtnColor: CustomColorTheme.errorColor,
      onCancelBtnTap: () {
        Navigator.of(context).pop();
        return;
      },
      onConfirmBtnTap: () {
        Navigator.of(context).pop();
        exit(0);
      },
    );
  }

  static AlertDialog leaveStage(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xffD6FAFF),
      content: const Text(
        'Leave the current stage?',
        style: TextStyle(fontSize: 15, color: Colors.black87),
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff2BC5DF),
          ),
          child: const Text(
            'No',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffEB0000),
          ),
          child: const Text(
            'Yes, Leave',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
