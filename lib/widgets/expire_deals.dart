import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ExpireDeals extends StatelessWidget {
  dynamic title;
  dynamic expireDate;
  ExpireDeals({this.title, this.expireDate});

  @override
  Widget build(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              TextWidget(
                textTitle: title,
                color: ColorUtils.textColor,
                fontFamily: FontUtils.PoppinsSemibold,
                fontSize: 2.2.t,
              ),
              SizedBox(
                width: 2.w,
              ),
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: ColorUtils.pink,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: ColorUtils.white,
                        size: 1.5.h,
                      ),
                      SizedBox(
                        width: 0.5.w,
                      ),
                      TextWidget(
                        textTitle: expireDate,
                        fontSize: 1.3.t,
                        color: ColorUtils.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: FontUtils.PoppinsRegular,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextWidget(
                textTitle: Constants.viewAll,
                color: ColorUtils.grey,
                fontSize: 1.3.t,
                fontFamily: FontUtils.PoppinsRegular,
              ),
              SizedBox(
                width: 1.w,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        // ColorUtils.gradientColor1,
                        // ColorUtils.gradientColor2,
                        // ColorUtils.gradientColor3,


                        // ColorUtils.gradientColor,

                        ColorUtils.gradientColor4,
                        // ColorUtils.gradientColor1,
                        ColorUtils.gradientColor,



                      ],
                    )
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(2.5),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: ColorUtils.white,
                      size: 1.5.h,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
  }
}
