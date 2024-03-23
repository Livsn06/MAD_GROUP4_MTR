// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gutlay_etr_mad/providers/letter_functions.dart';
import 'package:gutlay_etr_mad/routes/routes.dart';
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
          appBar: _appBar(),

          //
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(100),

              //* TITLE IMAGE ITO
              Center(
                child: Image.asset("assets/images/title.png"),
              ),
              const Gap(50),

              //* BUTTON FOR PLAY
              ElevatedButton(
                style: CustomButtonTheme.primaryStyle(
                    isAutosize: false, width: screenWidth * 0.9),
                onPressed: () {
                  context.go('/ingame');
                },
                child: Text(
                  "Let's Play!",
                  style: CustomTextTheme.textStyle(
                    fontWeight: FontWeight.bold,
                    fontsize: 35,
                    color: Colors.white,
                  ),
                ),
              ),
              const Gap(20),

              //* BUTTON FOR LEADERBOARDS
              ElevatedButton(
                style: CustomButtonTheme.secondaryStyle(
                  isAutosize: false,
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.03,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        DialogIndicator.showLeaderboard(context: context),
                  );
                },
                child: Text(
                  "Leaderboards",
                  style: CustomTextTheme.textStyle(
                    fontWeight: FontWeight.w700,
                    fontsize: 25,
                    color: Colors.white,
                  ),
                ),
              ),

              const Spacer(),

              //* BUTTON FOR EXIT
              ElevatedButton(
                  style: CustomButtonTheme.tritaryStyle(
                    isAutosize: false,
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.03,
                  ),
                  onPressed: () async {
                    await DialogIndicator.exitDialog(
                      context: context,
                      title: "Do you want to exit the game?",
                    );
                  },
                  child: Text(
                    "Quit",
                    style: CustomTextTheme.textStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontsize: 25,
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
  PreferredSizeWidget _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: CustomColorTheme.primaryColor,
      title: Text(
        "Explore Words!",
        style: GoogleFonts.fredoka(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }
}
