import 'package:chatApp/UI/HomeScreen.dart';
import 'package:chatApp/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xff091654),
  ));
  runApp(BootStrapper());
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class BootStrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new STheme()),
      ],
      child: HomeApp(),
    );
  }
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<STheme>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //darkTheme: theme.serviceDarkTheme,
      theme: theme.serviceLightTheme,
      home: SafeArea(child: HomeScreen() //AppointmentPage()
          ),
    );
  }
}
