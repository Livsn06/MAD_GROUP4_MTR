// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:gutlay_etr_mad/providers/letter_functions.dart';
import 'package:gutlay_etr_mad/styles/custom_themes/button_theme.dart';
import 'package:gutlay_etr_mad/styles/custom_themes/color_theme.dart';
import 'package:gutlay_etr_mad/styles/custom_themes/text_theme.dart';
import 'package:end_credits/end_credits.dart';
import 'package:provider/provider.dart';

class EndCreditsScreen extends StatefulWidget {
  const EndCreditsScreen({super.key});

  @override
  State<EndCreditsScreen> createState() => _EndCreditsScreenState();
}

class _EndCreditsScreenState extends State<EndCreditsScreen> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var provider = Provider.of<LetterFunction>(context, listen: false);
    return Scaffold(
      backgroundColor: CustomColorTheme.secondaryColor,
      //
      body: Stack(
        children: [
          EndCredits(
              key: UniqueKey(),
              backgroundColor: Colors.transparent,
              titleTextStyle: CustomTextTheme.textStyle(
                color: CustomColorTheme.primaryColor,
                fontsize: screenWidth * 0.08,
                fontWeight: FontWeight.bold,
              ),
              roleTextStyle: CustomTextTheme.textStyle(
                color: CustomColorTheme.primaryColor,
                fontsize: screenWidth * 0.037,
                fontWeight: FontWeight.w700,
              ),
              responsableTextStyle: CustomTextTheme.textStyle(
                color: CustomColorTheme.primaryColor,
                fontsize: screenWidth * 0.037,
              ),
              curve: Curves.linear,
              delay: const Duration(seconds: 1),
              speedFactor: 30,
              [
                Section(title: 'Members', roles: [
                  Role(
                      name: 'Leader',
                      crew: [const Responsable('Tristan Rasco')]),
                  Role(
                      name: 'Sub-Leader',
                      crew: [const Responsable('Joel Gutlay')]),
                  Role(
                      name: 'Member 1',
                      crew: [const Responsable('Mark Neil Tanap')]),
                  Role(
                      name: 'Member 2',
                      crew: [const Responsable('Rochelle Alarcio')]),
                ]),
                Section(title: 'Programmers', roles: [
                  Role(
                      name: 'Front & Back end',
                      crew: [const Responsable('Joel Gutlay')]),
                  Role(
                      name: 'Back end',
                      crew: [const Responsable('Tristan Rasco')]),
                  Role(
                      name: 'Back end',
                      crew: [const Responsable('Mark Neil Tanap')]),
                ]),
                Section(title: 'Designer', roles: [
                  Role(
                      name: 'UI & Asset',
                      crew: [const Responsable('Tristan Rasco')]),
                  Role(
                      name: 'UI & Component',
                      crew: [const Responsable('Joel Gutlay')]),
                ]),
                Section(title: 'Documentation', roles: [
                  Role(
                      name: 'Editor 1',
                      crew: [const Responsable('Mark Neil Tanap')]),
                  Role(
                      name: 'Editor 2',
                      crew: [const Responsable('Rochelle Alarcio')]),
                ]),
                Section(title: 'Presentation', roles: [
                  Role(
                      name: 'Type',
                      crew: [const Responsable('MAD Game Application')]),
                  Role(name: 'Due', crew: [const Responsable('April 2, 2024')]),
                ]),
                const Section(title: 'Thankyou for playing...', roles: []),
              ]),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: CustomButtonTheme.primaryStyle(
                  isAutosize: false,
                  width: screenWidth,
                  height: screenHeight * 0.075),
              onPressed: () {
                provider.updateBoard(currentIndex: 0, context: context);
                provider.clearAnswer();
                context.go('/ingame');
              },
              child: Text(
                "Maglaro Ulit!",
                style: CustomTextTheme.textStyle(
                  fontWeight: FontWeight.bold,
                  fontsize: screenHeight * 0.045,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
