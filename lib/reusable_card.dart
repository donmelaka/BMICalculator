import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color _color;
  final Widget? _childCard;
  final Function _onTapFunction;

  ReusableCard(
      {required Color color, required onTapFunction, Widget? childCard = null})
      : _color = color,
        _childCard = childCard,
        _onTapFunction = onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onTapFunction();
      },
      child: Container(
        child: _childCard,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
