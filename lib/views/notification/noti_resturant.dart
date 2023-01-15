import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/widgets/buy_one_get_one.dart';
import 'package:deals_app/widgets/container_shadow.dart';
import 'package:deals_app/widgets/expires_in_container.dart';
import 'package:deals_app/widgets/percent_off.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationResturant extends StatefulWidget {
  dynamic images;
  NotificationResturant({this.images});

  @override
  State<NotificationResturant> createState() => _NotificationResturantState();
}

class _NotificationResturantState extends State<NotificationResturant> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        height: 47.5.h,
        margin: EdgeInsets.symmetric(horizontal: 1.5.w),
        // padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(

          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(3, 3), // changes position of shadow
            ),
          ],
          color: ColorUtils.white,

            borderRadius: BorderRadius.circular(2.w),
            border: Border.all
              (color: ColorUtils.grey.withOpacity(0.5), width: 0.5.w),


        ),
        child: Padding(
          padding: EdgeInsets.all(2.5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    textTitle: Constants.notificationTitle,
                    color: ColorUtils.textColor,
                    fontFamily: FontUtils.PoppinsSemibold,
                    fontSize: 2.t,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: ColorUtils.grey,
                        size: 2.5.h,
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      TextWidget(
                        textTitle: Constants.twoHours,
                        color: ColorUtils.grey,
                        fontFamily: FontUtils.PoppinsRegular,
                        fontSize: 1.5.t,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              TextWidget(
                textTitle: Constants.resturantAddress3,
                color: ColorUtils.textColor,
                fontFamily: FontUtils.PoppinsRegular,
                fontSize: 1.5.t,
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(ImageUtils.Location_Icon,
                  height: 5.i,
                  width: 5.i,),
                  SizedBox(
                    width: 1.w,
                  ),
                  TextWidget(
                    textTitle: Constants.twentyMeter1,
                    color: ColorUtils.lightpurple,
                    fontFamily: FontUtils.PoppinsRegular,
                    fontSize: 1.5.t,
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              TextWidget(
                textTitle: Constants.fiftyPercent,
                color: ColorUtils.textColor,
                fontFamily: FontUtils.PoppinsSemibold,
                fontSize: 1.7.t,
              ),
              SizedBox(height: 1.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.images,
                  height: 45.i,
                  width: 83.i,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 3.h),
              Padding(
                padding: EdgeInsets.all(00),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ExpiresInContainer(expiresInHours: "Expires in 2 hours"),

                    ByeOneGetOne(
                      title: Constants.getoneFree,
                    ),

                    PercentOff(title: Constants.percentOff),
                  ],
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //
              //
              //       Container(
              //         padding: EdgeInsets.all(8),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(20),
              //           color: ColorUtils.pink,
              //         ),
              //         child: Center(
              //           child: TextWidget(
              //             textTitle: Constants.expire2Hour,
              //             fontSize: 1.3.t,
              //             color: ColorUtils.white,
              //             fontFamily: FontUtils.PoppinsMedium,
              //           ),
              //         ),
              //       ),
              //       Container(
              //         padding: EdgeInsets.all(6),
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(20),
              //             color: ColorUtils.blue.withOpacity(0.1),
              //             border: Border.all(color: ColorUtils.blue)),
              //         child: Row(
              //           children: [
              //             Image.asset(
              //               ImageUtils.ticket,
              //               height: 5.i,
              //               width: 5.i,
              //             ),
              //             SizedBox(
              //               width: 0.5.w,
              //             ),
              //             TextWidget(
              //               textTitle: Constants.getoneFree,
              //               fontSize: 1.3.t,
              //               color: ColorUtils.blue,
              //               fontFamily: FontUtils.PoppinsMedium,
              //             ),
              //           ],
              //         ),
              //       ),
              //       Container(
              //         padding: EdgeInsets.all(6),
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(20),
              //             color: ColorUtils.lightpurple.withOpacity(0.1),
              //             border: Border.all(color: ColorUtils.blue)),
              //         child: Row(
              //           children: [
              //             Image.asset(
              //               ImageUtils.discount,
              //               height: 5.i,
              //               width: 5.i,
              //             ),
              //             SizedBox(
              //               width: 0.5.w,
              //             ),
              //             TextWidget(
              //               textTitle: Constants.percentOff,
              //               fontSize: 1.3.t,
              //               color: ColorUtils.lightpurple,
              //               fontFamily: FontUtils.PoppinsMedium,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
