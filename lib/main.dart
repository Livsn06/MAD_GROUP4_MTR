import 'package:flutter/material.dart';
import 'package:gutlay_etr_mad/providers/letter_functions.dart';
import 'package:gutlay_etr_mad/routes/routes.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  //? Implementing Hive
  await Hive.initFlutter();
  //?creating a hivebox called 4pics1Word_Box later use
  await Hive.openBox("4pics1Word_Box");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => LetterFunction())],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          routerConfig: screenRouters,
        ));
  }
}
