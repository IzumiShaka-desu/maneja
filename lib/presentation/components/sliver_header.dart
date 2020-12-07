import 'package:flutter/material.dart';

class SliverCustHeader extends StatelessWidget {
  SliverCustHeader(this._child);
  final PreferredSizeWidget _child;
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: SliverAppBarDelegate(_child),
      pinned: true,
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(this._child);

  final PreferredSizeWidget _child;

  @override
  double get minExtent => _child.preferredSize.height;
  @override
  double get maxExtent => _child.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _child,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
