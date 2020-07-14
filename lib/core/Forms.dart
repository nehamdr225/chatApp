import 'package:flutter/material.dart';

class FForms extends StatelessWidget {
  final String initialValue;
  final bool obscure;
  final String text;
  final bool labeltext;
  final icon;
  final Widget trailingIcon;
  final prefix;
  final TextInputType type;
  final Function onChanged;
  final Function onSaved;
  final width;
  final underline;
  final borderColor;
  final formColor;
  final textColor;
  final Function validator;
  final controller;
  final key;
  final FocusNode currentFocus;
  final FocusNode nextFocus;
  final TextInputAction textInputAction;
  final style = TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Colors.grey[400]);
  FForms(
      {this.text,
      this.initialValue,
      this.labeltext: true,
      this.width,
      this.type,
      this.obscure: false,
      this.onChanged,
      this.onSaved,
      this.icon,
      this.trailingIcon,
      this.prefix,
      this.underline: false,
      this.formColor: Colors.white,
      this.borderColor: Colors.white,
      this.textColor,
      this.textInputAction: TextInputAction.none,
      this.validator,
      this.controller,
      this.currentFocus,
      this.nextFocus,
      this.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextFormField(
        initialValue: initialValue,
        onFieldSubmitted: (term) {
          textInputAction != TextInputAction.done
              ? _fieldFocusChange(context, currentFocus, nextFocus)
              : currentFocus.unfocus();
        },
        textInputAction: textInputAction, //TextInputAction.next,
        cursorColor: Theme.of(context).colorScheme.primary,
        key: key,
        controller: controller,
        onSaved: onSaved,
        validator: validator,
        keyboardType: type,
        autofocus: false,
        focusNode: currentFocus,
        obscureText: obscure,
        onChanged: onChanged,
        decoration: InputDecoration(
          border:
              OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
          prefix: prefix,
          prefixIcon: icon,
          suffixIcon: trailingIcon,
          hintText: labeltext == true ? text : '',
          enabled: true,
          labelStyle: style.copyWith(color: textColor),
          labelText: text,
          hintStyle: style.copyWith(color: textColor),
          enabledBorder: underline == false
              ? OutlineInputBorder(borderSide: BorderSide(color: borderColor))
              : UnderlineInputBorder(
                  borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primaryVariant,
                )),
          focusedBorder: underline == false
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          borderColor)) //Theme.of(context).colorScheme.primary))
              : UnderlineInputBorder(
                  borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primaryVariant,
                )),
        ),
      ),
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
