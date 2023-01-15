import 'package:deals_app/utils/color_utils.dart';
import 'package:flutter/material.dart';

class ListViewSeparated extends StatefulWidget {
  Widget child;
  dynamic physics;
  dynamic itemCount;
  ListViewSeparated({required this.child,required this.physics,required this.itemCount});


  @override
  State<ListViewSeparated> createState() => _ListViewSeparatedState();
}

class _ListViewSeparatedState extends State<ListViewSeparated> {
  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        padding: EdgeInsets.zero,
        physics: widget.physics,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return widget.child;
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount:widget.itemCount);
  }
}
