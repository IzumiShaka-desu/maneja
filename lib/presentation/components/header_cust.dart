import 'package:flutter/material.dart';

class HeaderCust extends StatelessWidget implements PreferredSizeWidget {
  HeaderCust({@required this.height, @required this.child});
  final Widget child;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(height: height, child: child);
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
