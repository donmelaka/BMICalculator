import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'gender_card.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const backGroundColor = Color(0xFF201F34);
const backGroundColorInactive = Color(0xFF111328);
const bottomBarColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  const InputPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<InputPage> createState() => _InputPageState();
}

enum GenderType {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  GenderType? _selectedGender;
  Color _maleCardColor = backGroundColorInactive;
  Color _femaleCardColor = backGroundColorInactive;
  double _currentHeight = 100.0;

  void selectGender(GenderType genderType) {
    print('Pressed card' + genderType.toString());
    setState(() {
      _selectedGender = genderType;
      GenderType.male == genderType
          ? () {
              _maleCardColor = backGroundColor;
              _femaleCardColor = backGroundColorInactive;
            }()
          : () {
              _femaleCardColor = backGroundColor;
              _maleCardColor = backGroundColorInactive;
            }();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onTapFunction: () {
                    selectGender(GenderType.male);
                  },
                  color: _maleCardColor,
                  childCard: GenderCard(
                    iconData: FontAwesomeIcons.mars,
                    gender: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onTapFunction: () {
                    selectGender(GenderType.female);
                  },
                  color: _femaleCardColor,
                  childCard: GenderCard(
                    iconData: FontAwesomeIcons.venus,
                    gender: 'FEMALE',
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            onTapFunction: () {},
            color: backGroundColor,
            childCard: Container(
              margin: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kTitleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          _currentHeight.round().toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          'cm',
                          textAlign: TextAlign.center,
                        )
                      ]),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.zero,
                    child: Slider(
                      divisions: 200,
                      value: _currentHeight,
                      min: 0,
                      max: 200,
                      onChanged: (d) {
                        setState(() {
                          _currentHeight = d;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onTapFunction: () {},
                  color: backGroundColor,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onTapFunction: () {},
                  color: backGroundColor,
                ),
              ),
            ],
          ),
        ),
        Container(
          color: bottomBarColor,
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          height: bottomContainerHeight,
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
