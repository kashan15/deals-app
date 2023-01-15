import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class DealsAll extends StatelessWidget {
  dynamic title,fontSize,fontSize1;
  DealsAll({this.title,this.fontSize,required this.fontSize1});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          textTitle: title,
          color: ColorUtils.black,
          fontFamily: FontUtils.PoppinsSemibold,
          fontSize:fontSize,
        ),
        Row(
          children: [
            TextWidget(
              textTitle: Constants.viewAll,
              color: ColorUtils.grey,
              fontSize: fontSize1,
              fontFamily:
              FontUtils.PoppinsRegular,
              // fontWeight: FontWeight.w100,
            ),
            SizedBox(
              width: 1.w,
            ),
            Container(

              decoration: BoxDecoration(
                  // BorderRadius.circular(5),

                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0)

                  ),
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
              // decoration: BoxDecoration(
              //   borderRadius:
              //
              //
              //   color: ColorUtils.gradientColor,
              // ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(2.5),
                  child: Icon(
                    Icons
                        .arrow_forward_ios_rounded,
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
