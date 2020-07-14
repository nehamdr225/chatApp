import 'package:chatApp/core/theme.dart';
import 'package:flutter/material.dart';

class FancyText extends StatelessWidget {
  final String text;
  final double size;
  final fontWeight;
  final Function onTap;
  final TextDecoration decoration;
  final Color decorationColor;
  final Color color;
  final bool defaultStyle;
  final opacity;
  final letterSpacing;
  final wordSpacing;
  final fontfamily;
  final TextAlign textAlign;
  final TextOverflow textOverflow;

  FancyText(
      {this.text,
      this.color,
      this.fontWeight,
      this.fontfamily: 'Montserrat',
      this.size,
      this.onTap,
      this.opacity: 0.6,
      this.defaultStyle: false,
      this.decoration,
      this.letterSpacing,
      this.wordSpacing,
      this.decorationColor: textDark,
      this.textAlign: TextAlign.center,
      this.textOverflow: TextOverflow.visible,});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        overflow: textOverflow,
        textAlign: textAlign,
        style: defaultStyle == true
            ? Theme.of(context).textTheme.bodyText2.copyWith(
                fontSize: size,
                fontWeight: fontWeight,
                color: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .color
                    .withOpacity(opacity))
            : TextStyle(
                letterSpacing: letterSpacing,
                wordSpacing: wordSpacing,
                fontWeight: fontWeight,
                fontFamily: fontfamily,
                fontSize: size,
                color: color,
                decoration: decoration,
                decorationColor: decorationColor),
      ),
    );
  }
}
