import 'dart:math';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'gender_card.dart';
import 'reusable_card.dart';

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
  Color _maleCardColor = kBackGroundColorInactive;
  Color _femaleCardColor = kBackGroundColorInactive;
  double _currentHeight = 100.0;
  int _currentWeight = 0;
  int _currentAge = 0;

  void selectGender(GenderType genderType) {
    print('Pressed card' + genderType.toString());
    setState(() {
      _selectedGender = genderType;
      GenderType.male == genderType
          ? () {
              _maleCardColor = kBackGroundColor;
              _femaleCardColor = kBackGroundColorInactive;
            }()
          : () {
              _femaleCardColor = kBackGroundColor;
              _maleCardColor = kBackGroundColorInactive;
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
            color: kBackGroundColor,
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
                          style: kNumberStyle,
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
                  color: kBackGroundColor,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kTitleTextStyle,
                      ),
                      Text(
                        _currentWeight.toString(),
                        style: kNumberStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedButton(
                            icon: Icon(FontAwesomeIcons.minus),
                            onPressed: () {
                              setState(() {
                                _currentWeight == 0 ? () {} : _currentWeight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundedButton(
                            icon: Icon(FontAwesomeIcons.plus),
                            onPressed: () {
                              setState(() {
                                _currentWeight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onTapFunction: () {},
                  color: kBackGroundColor,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kTitleTextStyle,
                      ),
                      Text(
                        _currentAge.toString(),
                        style: kNumberStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedButton(
                            icon: Icon(FontAwesomeIcons.minus),
                            onPressed: () {
                              setState(() {
                                _currentAge == 0 ? () {} : _currentAge--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundedButton(
                            icon: Icon(FontAwesomeIcons.plus),
                            onPressed: () {
                              setState(() {
                                _currentAge++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (ctx) {
                return Result(
                  bmi: _currentWeight / (pow(_currentHeight / 100, 2)).toDouble(),
                  gender: _selectedGender,
                );
              },
            ));
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 20),
            child: Text('CALCULATE',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400)),
            color: kBottomBarColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
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

class RoundedButton extends StatelessWidget {
  final Icon _icon;
  final Function _onPressed;

  const RoundedButton(
      {Key? key, required Icon icon, required Function onPressed})
      : _icon = icon,
        _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        _onPressed();
      },
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: kTextColor,
      child: _icon,
      shape: CircleBorder(
        side: BorderSide.none,
      ),
    );
  }
}
