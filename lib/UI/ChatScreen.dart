import 'package:chatApp/core/AppBarW.dart';
import 'package:chatApp/core/FancyText.dart';
import 'package:chatApp/core/Forms.dart';
import 'package:chatApp/core/theme.dart';
import 'package:chatApp/models/messageModel.dart';
import 'package:chatApp/models/userModel.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen({this.user});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessageComposer() {
    final theme = Theme.of(context).colorScheme;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        height: 70.0,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo),
              iconSize: 25.0,
              color: theme.primary.withOpacity(0.5),
              onPressed: () {},
            ),
            Expanded(
                child: TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration:
                  InputDecoration.collapsed(hintText: 'Send message...'),
              onChanged: (value) {},
            )),
            IconButton(
              icon: Icon(Icons.send),
              iconSize: 25.0,
              color: theme.primary.withOpacity(0.5),
              onPressed: () {},
            )
          ],
        ));
  }

  _buildMessage(Message message, bool isMe, imageUrl, String name, myImg) {
    final theme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        isMe
            ? SizedBox.shrink()
            : CircleAvatar(
                //backgroundImage: FileImage(_user.imageUrl),//Image.file(_user.imageUrl),
                backgroundColor: theme.background,
                foregroundColor: Colors.white,
                // radius: 10.0,
                child: imageUrl != null
                    ? Container(
                        height: 25.0,
                        width: 25.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(imageUrl),
                                fit: BoxFit.cover)),
                        //child: Image.file(_user.imageUrl)
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
        Container(
          width: MediaQuery.of(context).size.width * 0.65,
          decoration: BoxDecoration(
              color: isMe ? theme.onBackground : blueGrey.withOpacity(0.4),
              borderRadius: isMe
                  ? BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0))
                  : BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          margin: isMe
              ? EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                  left: MediaQuery.of(context).size.width * 0.20)
              : EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                  right: MediaQuery.of(context).size.width * 0.20),
          child: FancyText(
            text: message.text,
            textAlign: TextAlign.left,
            size: 15.0,
          ),
        ),
        isMe
            ? CircleAvatar(
                //backgroundImage: FileImage(_user.imageUrl),//Image.file(_user.imageUrl),
                backgroundColor: theme.background,
                foregroundColor: Colors.white,
                // radius: 10.0,
                child: myImg != null
                    ? Container(
                        height: 25.0,
                        width: 25.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(myImg),
                                fit: BoxFit.cover)),
                        //child: Image.file(_user.myImg)
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
              )
            : SizedBox.shrink(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.primaryVariant,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBarW(
            elevation: 0.0,
            backButtonColor: textDark_Yellow,
            title: widget.user.name,
            settings: true,
          ),
        ),
        body: GestureDetector(
          onTap: ()=> FocusScope.of(context).unfocus(),
                  child: Column(children: <Widget>[
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: theme.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Message message = messages[index];
                        final bool isMe = message.sender.id == currentUser.id;
                        final myImg = currentUser.imageUrl;
                        final imageUrl = widget.user.imageUrl;
                        final name = widget.user.name;
                        return _buildMessage(message, isMe, imageUrl, name, myImg);
                      })),
            )),
            _buildMessageComposer()
          ]),
        ),
      ),
    );
  }
}
