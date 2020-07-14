import 'package:chatApp/core/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppBarW extends StatelessWidget {
  final elevation;
  final color;
  final Color backButtonColor;
  final bool logo;
  final bool settings;
  final String title;
  AppBarW({this.elevation: 0.0, this.logo, this.settings, this.title: "", this.color, this.backButtonColor});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
          elevation: 0.0,
          primary: false,
          iconTheme: theme.iconTheme.copyWith(color: color),
          backgroundColor: Theme.of(context).colorScheme.primaryVariant,
          centerTitle: true,
          title: Text(title,
              style: theme.textTheme.bodyText1),
          leading: 
          logo == true
          ? Padding(padding: EdgeInsets.only(top:16.0, left: 8.0),child:Text('LOGO', style: theme.textTheme.bodyText2.copyWith(fontWeight: FontWeight.w800),))
          : IconButton(
            icon: Icon(CupertinoIcons.back, color: backButtonColor,),
            onPressed: (){},
          ),
          actions: <Widget>[
            settings == true
                ? IconButton(icon: Icon(Icons.settings), onPressed: (){}, color: textDark_Yellow,)
                : Text(''),
            
          ],      
    );
  }
}