import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:flutter/material.dart';

class ContainerBorder extends StatelessWidget {
  Widget child;

  ContainerBorder({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.5 .h,
      width: 34.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ColorUtils.grey),
      ),
      child: child
    );
  }
}
