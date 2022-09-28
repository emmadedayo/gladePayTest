import 'package:flutter/material.dart';
import 'package:weather/core/themes/app_color.dart';

class ButtonWidget extends StatelessWidget{
  const ButtonWidget({
    Key? key,
    required this.containerHeight,
    required this.containerWidth,
    required this.buttonText,
    required this.buttonTextSize,
    required this.onTap,
    required this.color,
    required this.radius,
    required this.textColor,
  }): super (key: key);

  final double containerHeight;
  final double containerWidth;
  final String buttonText;
  final double buttonTextSize;
  final double radius;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final ButtonStyle style =
    ElevatedButton.styleFrom(
      onPrimary: textColor,
      primary: color,
      elevation: 10,
      minimumSize: Size(containerWidth, containerHeight),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
    );
    return ElevatedButton(
      style: style,
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(buttonText,
            style: AppStyle.textStyle(
                context, textColor, buttonTextSize, FontWeight.normal,[]),
          ),
          Icon(Icons.keyboard_arrow_up_sharp,color: textColor,)
        ],
      )
    );
  }}