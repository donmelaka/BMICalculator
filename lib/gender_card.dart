import 'package:flutter/material.dart';

import 'constants.dart';

class GenderCard extends StatelessWidget {
  final IconData _iconData;
  final String _gender;

  GenderCard({required IconData iconData, required String gender})
      : this._gender = gender,
        this._iconData = iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          _iconData,
          size: kIconSize,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          _gender,
          style: kTitleTextStyle,
        ),
      ],
    );
  }
}
