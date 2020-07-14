import 'package:chatApp/UI/ChatScreen.dart';
import 'package:chatApp/UI/MsgList.dart';
import 'package:chatApp/core/AppBarW.dart';
import 'package:chatApp/core/FancyText.dart';
import 'package:chatApp/core/Forms.dart';
import 'package:chatApp/core/theme.dart';
import 'package:chatApp/models/messageModel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String loading;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBarW(
          backButtonColor: textDark_Yellow,
          title: "Chat Screen",
        ),
      ),
      body: Column(children: <Widget>[
        Stack(
          children: <Widget>[
            Container(height: 20.0, color: theme.primaryVariant),
            SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                  color: theme.background,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              height: 20.0,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 18.0),
          child: SizedBox(
            height: 45.0,
            child: FForms(
              text: "Search",
              icon: Icon(
                Icons.search,
                color: blueGrey,
              ),

              //width: MediaQuery.of(context).size.width*0.90,
              borderColor: theme.primary.withOpacity(0.5),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 18.0, bottom: 8.0),
          child: FancyText(
            text: 'Recent',
            color: blueGrey.withOpacity(0.7),
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: chats.length,
              itemBuilder: (BuildContext context, int index) {
                return MsgList(
                  name: chats[index].sender.name,
                  unRead: chats[index].unread,
                  profileImg: chats[index].sender.imageUrl,
                  messageText: chats[index].text,
                  onTap: () =>
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(user: chats[index].sender,),
                      ),
                    ),
                );
              }, //
            ),
          ),
        )
      ]),
    );
  }
}
