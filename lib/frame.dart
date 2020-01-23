import 'package:flutter/material.dart';

import 'content.dart';
import 'sidenavbar.dart';

final animationKey = GlobalKey<SideNavBarState>();
final pageViewKey = GlobalKey<ContentPageState>();

class FramePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      child: Row(
        children: <Widget>[
          SideNavBar(key: animationKey),
          Expanded(
            child: ContentPage(key: pageViewKey,),
          )],
      ),
    ));
  }
}