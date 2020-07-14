import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const textDark = Color(0xff171817); // black text
const textLight_Blue = Color(0xff1d2d44); // blueish for light mode
const textLight = Color(0xfff4f4fc); // white text
const textDark_Yellow = Color(0xffEEFAFF);
const textLight_Red = Color(0xffFFC6A7); 
const textLight_Red2=Color(0xffF7AD95);// yellow text for dark mode
const gradientColor = LinearGradient(colors: [
  Color(0xff6882AD),
  Color(0xff173A7B),
]);
const blueGrey= Color(0xff4D6A9C);

class STheme with ChangeNotifier {
  ThemeData serviceDarkTheme = ThemeData(
    iconTheme: IconThemeData(
      color: Color(0xfff5f5f5),
    ),
    colorScheme: ColorScheme(
      primary: Color(0xff173A7B),
      primaryVariant: Color(0xff091654),
      onPrimary: Color(0xff6882AD),
      secondary: Color(0xffC20114),
      secondaryVariant: Color(0xffD94B4B), //97010D),
      onSecondary: Color(0xff0c090d),
      background: Color(0xff191B24),
      onBackground: Color(0xff232633), //Color(0xff404e60),
      onError: Color(0xffc5032b),
      error: Color(0xffc5032b),
      surface: Color(0xffffffff),
      onSurface: Color(0xff232633),
      brightness: Brightness.dark,
    ),
    canvasColor: Colors.white,
    fontFamily: 'Montserrat',
    textSelectionColor: Colors.black38,
    textTheme: TextTheme(
      headline5: TextStyle(
          fontSize: 24.0, color: textLight, fontWeight: FontWeight.w500),
      headline6: TextStyle(fontSize: 18.0, color: textLight),
      bodyText1: TextStyle(fontSize: 16.0, color: textDark),
      bodyText2: TextStyle(fontSize: 14.0, color: textLight),
      overline: TextStyle(fontSize: 10.0, color: textLight),
      caption: TextStyle(fontSize: 12.0, color: textLight),
    ),
  );
  ThemeData serviceLightTheme = ThemeData(
    iconTheme: IconThemeData(
      color: Color(0xff173A7B),
    ),
    colorScheme: ColorScheme(
      primary: Color(0xff173A7B),
      primaryVariant: Color(0xff091654),
      onPrimary: Color(0xff0c090d),
      secondary: Color(0xffC20114),
      secondaryVariant: Color(0xffD94B4B), //97010D),
      onSecondary: Color(0xff0c090d),
      background: Color(0xfff5f5f5),
      onBackground: Color(0xffffffff),
      onError: Color(0xffc5032b),
      error: Color(0xffc5032b),
      onSurface: Color(0xff191B24),
      brightness: Brightness.light,
      surface: Color(0xffEEEEEE),
    ),
    canvasColor: Colors.white,
    fontFamily: 'Montserrat',
    textSelectionColor: Colors.black38,
    unselectedWidgetColor: Colors.grey[500],
    textTheme: TextTheme(
      headline5: TextStyle(
          fontSize: 24.0, color: textDark, fontWeight: FontWeight.w500),
      headline6: TextStyle(fontSize: 18.0, color: textDark),
      bodyText1: TextStyle(fontSize: 16.0, color: textLight),
      bodyText2: TextStyle(fontSize: 14.0, color: textDark),
      overline: TextStyle(fontSize: 10.0, color: textDark),
      caption: TextStyle(fontSize: 12.0, color: textDark),
    ),
  );

  ThemeData _themeData;
  bool isDark = false;

  STheme() {
    _themeData = serviceDarkTheme;
  }

  ThemeData getTheme() => _themeData;

  setTheme() {
    if (!isDark) {
      _themeData = serviceDarkTheme;
    } else {
      _themeData = serviceLightTheme;
    }

    isDark = !isDark;
    notifyListeners();
  }
  // void _darktheme(){
  //   setTheme() => serviceDarkTheme;
  // }
}
