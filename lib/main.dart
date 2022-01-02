import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0D22),
          appBarTheme: ThemeData.dark().appBarTheme.copyWith(
                backgroundColor: Color(0xFF0A0D22),
              ),
          scaffoldBackgroundColor: Color(0xFF0A0D22),
          sliderTheme: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            inactiveTrackColor: kTextColor,
            thumbColor: bottomBarColor,
            overlayColor: Color(0x29EB1555),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
            trackHeight: 1,
          )),
      home: const InputPage(title: 'BMI Calculator'),
    );
  }
}
