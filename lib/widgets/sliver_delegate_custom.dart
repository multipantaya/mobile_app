
import 'package:flutter/material.dart';

class SliverPersistentHeaderCustom extends SliverPersistentHeaderDelegate {
  final double maxHeigth;
  final double minHeigth;
  final Widget child;

  SliverPersistentHeaderCustom({
    required this.maxHeigth,
    required this.minHeigth,
    required this.child
  });
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child,);
  }

  @override
  double get maxExtent => maxHeigth;

  @override
  double get minExtent => minHeigth;

  @override
  bool shouldRebuild(SliverPersistentHeaderCustom oldDelegate) {
    return maxHeigth != oldDelegate.maxHeigth || minHeigth != oldDelegate.minHeigth || child != oldDelegate.child;
  }

}