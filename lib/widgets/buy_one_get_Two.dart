import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ByeOneGetTwo extends StatelessWidget {
  dynamic title;
  ByeOneGetTwo({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.5.i, vertical: 0.6.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorUtils.blue.withOpacity(0.1),
          border: Border.all(color: ColorUtils.blue)),
      child: Row(
        children: [
          Image.asset(
            ImageUtils.ticket,
            height: 5.i,
            width: 5.i,
          ),
          SizedBox(
            width: 0.5.w,
          ),
          TextWidget(
            textTitle: title,
            fontSize: 1.3.t,
            color: ColorUtils.blue,
            fontFamily: FontUtils.PoppinsMedium,
          ),
        ],
      ),
    );
  }
}

class ExpireTime extends StatelessWidget {
  dynamic title;
  ExpireTime({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.5.i, vertical: 0.6.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorUtils.redColorExpiresIn,
          border: Border.all(color: ColorUtils.redColorExpiresIn)),
      child: Row(
        children: [
          // Image.asset(
          //   ImageUtils.ticket,
          //   height: 5.i,
          //   width: 5.i,
          // ),
          SizedBox(
            width: 0.5.w,
          ),
          TextWidget(
            textTitle: title,
            fontSize: 1.3.t,
            color: ColorUtils.white,
            fontFamily: FontUtils.PoppinsMedium,
          ),
        ],
      ),
    );
  }
}
