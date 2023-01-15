import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class PercentOff extends StatelessWidget {
  dynamic title;
  PercentOff({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.3.h,
      width: 21.w,
      padding: EdgeInsets.symmetric(horizontal: 1.5.i, vertical: 0.6.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorUtils.lightpurple.withOpacity(0.1),
          border: Border.all(color: ColorUtils.lightpurple)),
      child: Row(
        children: [
          SizedBox(width: 1.w,),
          Image.asset(
            ImageUtils.discount,
            height: 5.i,
            width: 5.i,
          ),
          SizedBox(
            width: 0.5.w,
          ),
          TextWidget(
            textTitle: title,
            fontSize: 1.3.t,
            color: ColorUtils.lightpurple,
            fontFamily: FontUtils.PoppinsMedium,
          ),
        ],
      ),
    );
  }
}
