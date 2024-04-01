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

class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key});

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Consumer<LetterFunction>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: CustomColorTheme.secondaryColor,
          appBar: _appBar(height: screenHeight * 0.1),

          //
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(screenHeight * 0.07),

              //* TITLE IMAGE ITO
              Center(
                child: Image.asset("assets/images/title.png"),
              ),
              Gap(screenHeight * 0.04),

              //* BUTTON FOR PLAY
              ElevatedButton(
                style: CustomButtonTheme.primaryStyle(
                    isAutosize: false,
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.075),
                onPressed: () {
                  context.go('/ingame');
                },
                child: Text(
                  "Maglaro!",
                  style: CustomTextTheme.textStyle(
                    fontWeight: FontWeight.bold,
                    fontsize: screenHeight * 0.045,
                    color: Colors.white,
                  ),
                ),
              ),
              Gap(screenHeight * 0.04),

              //* BUTTON FOR LEADERBOARDS
              // ElevatedButton(
              //   style: CustomButtonTheme.secondaryStyle(
              //     isAutosize: false,
              //     width: screenWidth * 0.6,
              //     height: screenHeight * 0.06,
              //   ),
              //   onPressed: () {
              //     showDialog(
              //       context: context,
              //       builder: (context) =>
              //           DialogIndicator.showLeaderboard(context: context),
              //     );
              //   },
              //   child: Text(
              //     "Filipino Pride",
              //     style: CustomTextTheme.textStyle(
              //       fontWeight: FontWeight.w700,
              //       fontsize: screenHeight * 0.03,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),

              // const Spacer(),

              //* BUTTON FOR EXIT
              ElevatedButton(
                  style: CustomButtonTheme.tritaryStyle(
                    isAutosize: false,
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.06,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => DialogIndicator.exitDialog(
                              context: context,
                              title: "Gusto mo bang umalis sa laro?",
                            ));
                  },
                  child: Text(
                    "Umalis",
                    style: CustomTextTheme.textStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontsize: screenHeight * 0.03,
                    ),
                  )),
              const Gap(15),
            ],
          ),
        );
      },
    );
  }

  //? APP BAR NG TITLE
  PreferredSizeWidget _appBar({required double height}) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: height,
      backgroundColor: CustomColorTheme.primaryColor,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hanap Salita!",
              style: CustomTextTheme.textStyle(
                fontWeight: FontWeight.w800,
                color: Colors.white,
                fontsize: height * 0.35,
              )),
          Gap(height * 0.04),
          Text(
            "Halina't maging isang tunay na Pilipino.",
            style: CustomTextTheme.textStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontsize: height * 0.18,
            ),
          ),
        ],
      ),
    );
  }
}
