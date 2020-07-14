import 'package:chatApp/UI/MsgList.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  final listViews;
  final border;
  final scrollDirection;

  HorizontalList({
    this.listViews,
    this.border: false,
    this.scrollDirection: Axis.horizontal,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: scrollDirection,
      itemCount: listViews.length,
      itemBuilder: (BuildContext context, int index) {
        return MsgList(
          name: listViews[index]['name'],
          unRead: listViews[index]['newMessage'],
          profileImg: listViews[index]['src'],
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => DoctorsTab(),
            //   ),
            // );
          },
        );
      }, //
    );
  }
}
