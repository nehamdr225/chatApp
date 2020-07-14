import 'package:chatApp/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:chatApp/core/FancyText.dart';

class MsgList extends StatelessWidget {
  final profileImg;
  final name;
  final unRead;
  final messageText;
  final onTap;
  MsgList(
      {this.profileImg,
      this.name,
      this.unRead,
      this.messageText,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
          child: Container(
            
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 0.7),
          color:
              unRead == true ? blueGrey.withOpacity(0.2) : theme.background,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),//left: 8.0, top: 8.0, bottom: 8.0, right: 20.0),
        width: MediaQuery.of(context).size.width,
        height: 80.0,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                //backgroundImage: FileImage(_profileImg),//Image.file(_profileImg),
                backgroundColor: theme.background,
                foregroundColor: Colors.white,
                radius: 40.0,
                child: profileImg != null
                    ? Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(profileImg),
                                fit: BoxFit.cover)),
                        //child: Image.file(_profileImg)
                      )
                    : Text(
                        name.split(' ').reduce((a, b) {
                          return '${a[0]} ${b[0]}';
                        }),
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: theme.primary,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FancyText(
                        text: name,
                        fontWeight: FontWeight.w600,
                        size: 15.0,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        width: MediaQuery.of(context).size.width *0.45,
                        child: FancyText(
                          text: messageText == null? "Message": messageText,
                          textAlign: TextAlign.start,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      )
                    ]),
              ),
              SizedBox(width: 15.0),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    FancyText(
                      text: "10:00 AM",
                      fontWeight: FontWeight.w600,
                      size: 14.0,
                      textAlign: TextAlign.start,
                      color: blueGrey.withOpacity(0.5),
                    ),
                    unRead == true
                        ? SizedBox(height: 5.0)
                        : SizedBox.shrink(),
                    unRead  == true
                        ? Container(
                          padding: EdgeInsets.all(4.0),
                            
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11.0),
                               color: theme.primary),
                            child: FancyText(
                              text: "New",
                              color: textDark_Yellow,
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Text("")
                  ])
            ]),
      ),
    );
  }
}
