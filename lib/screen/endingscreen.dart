// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:gutlay_etr_mad/providers/letter_functions.dart';
import 'package:gutlay_etr_mad/styles/custom_themes/button_theme.dart';
import 'package:gutlay_etr_mad/styles/custom_themes/color_theme.dart';
import 'package:gutlay_etr_mad/styles/custom_themes/text_theme.dart';
import 'package:gutlay_etr_mad/widget/dialog_indicator/dialogs.dart';
import 'package:provider/provider.dart';

class EndingScreen extends StatefulWidget {
  const EndingScreen({super.key});

  @override
  State<EndingScreen> createState() => _EndingScreenState();
}

class _EndingScreenState extends State<EndingScreen> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Consumer<LetterFunction>(
          builder: (context, value, child) {
            return Scaffold(
              backgroundColor: CustomColorTheme.secondaryColor,
              appBar: _appBar(height: screenHeight * 0.1),

              //
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //* TITLE IMAGE ITO
                    Text(
                      "I-Claim ang iyong Reward!",
                      textAlign: TextAlign.center,
                      style: CustomTextTheme.textStyle(
                        fontWeight: FontWeight.bold,
                        fontsize: screenHeight * 0.04,
                        color: const Color(0xFFE96D00),
                      ),
                    ),
                    Gap(screenHeight * 0.02),
                    Center(
                      child: Image.asset(
                        "assets/images/certificate.jpg",
                        height: screenWidth * 1.2,
                      ),
                    ),
                    Gap(screenHeight * 0.04),

                    //* BUTTON FOR PLAY
                    ElevatedButton(
                      style: CustomButtonTheme.primaryStyle(
                          isAutosize: false,
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.060),
                      onPressed: () {
                        context.go('/credit');
                      },
                      child: Text(
                        "Claim",
                        style: CustomTextTheme.textStyle(
                          fontWeight: FontWeight.bold,
                          fontsize: screenHeight * 0.035,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Image.asset(
          "assets/images/confetti.gif",
          fit: BoxFit.cover,
          height: screenHeight * 0.9,
        )
      ],
    );
  }

  //? APP BAR NG TITLE
  PreferredSizeWidget _appBar({required double height}) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: height,
      backgroundColor: CustomColorTheme.primaryColor,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Gap(height * 0.2),
          Text(
            "All Levels Cleared!",
            textAlign: TextAlign.center,
            style: CustomTextTheme.textStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontsize: height * 0.4,
            ),
          ),
        ],
      ),
    );
  }
}
