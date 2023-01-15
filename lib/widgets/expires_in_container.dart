import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:timer_count_down/timer_count_down.dart';

class ExpiresInContainer extends StatelessWidget {
  dynamic expiresInHours;
  ExpiresInContainer({Key? key, required this.expiresInHours})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 6.h,
      height: 3.2.h,
      width: 27.w,
      // padding: EdgeInsets.symmetric(horizontal: 2.5.i, vertical: 1.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorUtils.redColorExpiresIn,
      ),
      child: Center(
        child: TextWidget(
        textTitle: expiresInHours,
        fontSize: 1.2 .t,
        color: ColorUtils.white,
        fontFamily: FontUtils.PoppinsMedium,
          ),
      ),
    );
  }
}
