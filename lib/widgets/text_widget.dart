import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  dynamic textTitle;
  dynamic color;
  dynamic fontSize;
  dynamic fontFamily;
  dynamic textAlign;
  dynamic letterSpacing;
  dynamic height;
  dynamic maxLines;
  dynamic overFlow;
  dynamic fontWeight;
  dynamic decoration;

  TextWidget(
      {this.textAlign,
      this.textTitle,
      this.color,
      this.fontSize,
      this.fontFamily,
      this.letterSpacing,
      this.height,
      this.maxLines,
      this.fontWeight,
      this.overFlow,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return Text(
      textTitle,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
          decoration: decoration,
          color: color,
          fontSize: fontSize,
          fontFamily: fontFamily,
          letterSpacing: letterSpacing,
          height: height,
          fontWeight: fontWeight,
          overflow: overFlow),
    );
  }
}
