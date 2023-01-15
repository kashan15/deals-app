import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/widgets/container_shadow.dart';
import 'package:deals_app/widgets/percent_off.dart';
import 'package:deals_app/widgets/percent_off_offer.dart';
import 'package:deals_app/widgets/rating_widget.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'newContainer_shadow.dart';

class ResturantVertical extends StatelessWidget {
  dynamic image;
  dynamic text;

  ResturantVertical({this.image,this.text});

  @override
  Widget build(BuildContext context) {
    return newContainerShadow(
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.only(right: 2.w,bottom: 1.h, left: 1.w),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Stack(
              children:[ Image.asset(
                image,
                height: 20.h,
              ),
            ]),
            // SizedBox(height: 1.h),
            TextWidget(
              textTitle:text,
              color: ColorUtils.textColor,
              fontFamily: FontUtils
                  .PoppinsSemibold,
              fontSize: 2.5.t,
            ),
            // SizedBox(height: 0.2.h),
            Container(
              width: 85.w,
              child: TextWidget(
                textTitle: Constants
                    .resturantAddress,
                color: ColorUtils.grey,
                fontFamily: FontUtils
                    .PoppinsRegular,
                fontSize: 1.5.t,
                overFlow:
                TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 0.5.h,),
            Row(
              children: [
                // SizedBox(
                //   width: 1.w,
                // ),
                Row(
                  children: [
                    RatingWidget(initialRating: 4.5,),
                    SizedBox(width: 0.5.w,),
                    TextWidget(
                      textTitle: Constants
                          .ratingPoint,
                      fontSize: 1.5.t,
                      fontFamily: FontUtils
                          .PoppinsRegular,
                      color: ColorUtils
                          .textColor,
                    ), SizedBox(width: 0.5.w,),
                    TextWidget(
                      textTitle: Constants
                          .ratingPoint1,
                      fontSize: 1.5.t,
                      fontFamily: FontUtils
                          .PoppinsRegular,
                      color: ColorUtils
                          .textColor,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 0.5.h,),
            Row(
              children: [
                TextWidget(
                  textTitle:
                  Constants.cutPriceCustom,
                  color: ColorUtils.grey,
                  fontSize: 1.7.t,
                  fontFamily: FontUtils
                      .PoppinsMedium,
                  decoration:
                  TextDecoration
                      .lineThrough,
                ),
                SizedBox(
                  width: 1.5.w,
                ),
                TextWidget(
                  textTitle:
                  Constants.from,
                  color: ColorUtils
                      .gradientColor,
                  fontSize: 1.7.t,
                  fontFamily: FontUtils
                      .PoppinsMedium,
                ),
                SizedBox(
                  width: 1.5.w,
                ),


                TextWidget(
                  textTitle:
                  Constants.cutPrice1Custom,
                  color: ColorUtils
                      .gradientColor,
                  fontSize: 2.t,
                  fontFamily: FontUtils
                      .PoppinsSemibold,
                ),
                SizedBox(
                  width: 3.5.w,
                ),
                PercentOffOffer(title: Constants.off,),
              ],
            ),
            SizedBox(height: 0.5.h,),
            TextWidget(
              textTitle:
              Constants.hotelCountry,
              color: ColorUtils.textColor,
              fontFamily: FontUtils
                  .PoppinsRegular,
              fontSize: 1.7.t,
            ),
          ],
        ),
      ),
    );
  }
}
