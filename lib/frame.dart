import 'package:flutter/material.dart';
import 'sidenavbar.dart';
import 'content.dart';

class FramePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      child: Row(
        children: <Widget>[
          SideNavBar(),
          Expanded(
            child: ContentPage(),
          )],
      ),
    ));
  }
}
