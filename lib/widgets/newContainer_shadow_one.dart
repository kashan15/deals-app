import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class newContainerShadowOne extends StatelessWidget {
  Widget child;
  dynamic margin;
  dynamic height;
  dynamic width;
  dynamic padding;
  newContainerShadowOne (
      {required this.child,
        this.margin,
        this.height,
        this.width,
        required this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: ColorUtils.white,
        borderRadius: BorderRadius.circular(5),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.2),
        //     spreadRadius: 5,
        //     blurRadius: 3,
        //     offset: Offset(2, 4), // changes position of shadow
        //   ),
        // ],
        /// customize shadow
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.8),
        //     spreadRadius: 1,
        //     blurRadius: 7,
        //     offset: Offset(3, 3), // changes position of shadow
        //   ),
        // ],

        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(3, 3), // changes position of shadow
          ),
        ],

      ),
      child: Padding(padding: padding, child: child),
    );
  }
}
