import 'dart:ui';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

class Result extends StatelessWidget {
  final double _bmi;
  final GenderType? _gender;

  const Result({required double bmi, required GenderType? gender, Key? key})
      : _bmi = bmi,
        _gender = gender,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Your Result',
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          ResultCard(
            bmi: _bmi,
            gender: _gender,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 20),
              child: Text('RE-ALCULATE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400)),
              color: kBottomBarColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          )
        ],
      ),
    );
  }
}

enum BMIValue {
  underWeight,
  normal,
  overWeight,
  obese,
  extremelyObese,
}

extension BMIValueExtension on BMIValue {
  Text get textField {
    switch (this) {
      case BMIValue.underWeight:
        return Text(
          'Underweight',
          style: TextStyle(
            color: Color(0xFF5BCAF7),
          ),
        );
      case BMIValue.normal:
        return Text(
          'Normal',
          style: TextStyle(
            color: Color(0xFF9CB23B),
          ),
        );
      case BMIValue.overWeight:
        return Text(
          'Over Weight',
          style: TextStyle(
            color: Color(0xFFFBC809),
          ),
        );
      case BMIValue.obese:
        return Text(
          'Obese',
          style: TextStyle(
            color: Color(0xFFEE8F40),
          ),
        );
      default:
        return Text(
          'Extremely Obese',
          style: TextStyle(
            color: Color(0xFFEB2127),
          ),
        );
    }
  }

  String get description {
    switch (this) {
      case BMIValue.overWeight:
        return 'You are under weight, gaining some weight would be good';
      case BMIValue.normal:
        return 'Your BMI is within the nomarl range. Great work!';
      case BMIValue.overWeight:
        return 'You are over weight. Would be nice to loose some weight';
      case BMIValue.obese:
        return 'You are over obese. Would be nice to loose some weight';
      default:
        return 'You are over obese. Would be nice to loose some weight';
    }
  }

  void talk() {
    print('meow');
  }
}

class ResultCard extends StatelessWidget {
  BMIValue calculateBMIValue(double bmi, GenderType? gender) {
    if (GenderType.male == gender) {
      if (bmi < 18.5) {
        return BMIValue.underWeight;
      } else if (18.5 <= bmi && bmi < 24.9) {
        return BMIValue.normal;
      } else if (25.0 <= bmi && bmi < 29.9) {
        return BMIValue.overWeight;
      } else if (30.0 <= bmi && bmi < 34.9) {
        return BMIValue.obese;
      } else {
        return BMIValue.extremelyObese;
      }
    } else {
      if (bmi < 18.5) {
        return BMIValue.underWeight;
      } else if (18.5 <= bmi && bmi < 24.9) {
        return BMIValue.normal;
      } else if (25.0 <= bmi && bmi < 29.9) {
        return BMIValue.overWeight;
      } else {
        return BMIValue.obese;
      }
    }
  }

  final double _bmi;
  final GenderType? _gender;

  const ResultCard({
    Key? key,
    required double bmi,
    required GenderType? gender,
  })  : this._bmi = bmi,
        this._gender = gender,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      color: kBackGroundColor,
      onTapFunction: () {},
      childCard: Container(
        height: 450,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            calculateBMIValue(_bmi, _gender).textField,
            Text(
              _bmi.toStringAsFixed(1),
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.w700),
            ),
            Column(
              children: [
                Text(
                  'Normal BMI range:',
                  style: TextStyle(
                      fontSize: 15,
                      color: kTextColor,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  '18,5 - 25 kg/m2',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Text(
              calculateBMIValue(_bmi, _gender).description,
            ),
            FlatButton(onPressed: () {}, child: Text('SAVE RESULT'))
          ],
        ),
      ),
    );
  }
}
