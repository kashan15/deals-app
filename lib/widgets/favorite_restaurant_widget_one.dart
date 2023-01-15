import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/widgets/buy_one_get_one.dart';
import 'package:deals_app/widgets/container_shadow.dart';
import 'package:deals_app/widgets/percent_off.dart';
import 'package:deals_app/widgets/rating_widget.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'newContainer_shadow.dart';

class FavoriteResturantWidgetOne extends StatefulWidget {
  dynamic image;
  dynamic text;
  dynamic addressText;
  void Function()? onTap;
  FavoriteResturantWidgetOne({this.image, this.onTap,this.text, this.addressText});

  @override
  State<FavoriteResturantWidgetOne> createState() => _FavoriteResturantWidgetOneState();
}

class _FavoriteResturantWidgetOneState extends State<FavoriteResturantWidgetOne> {
  @override
  bool likebutton = true;

  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: widget.onTap,
        child: newContainerShadow(

          width: 80.w,
          padding: EdgeInsets.all(5.0),
          margin:
          EdgeInsets.only(
              left: 0.3.w, right: 5.w, bottom: 1.h, top: 1.h),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                    children:[
                      Container(
                        width: 78.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 10,
                          //     blurRadius: 5,
                          //     offset: Offset(0, 3),
                          //   )
                          // ],
                          borderRadius: BorderRadius.circular(3.w),

                        ),
                        child: Image.asset(widget.image),
                        // child: Image.asset(
                        //   image,
                        //   height: 20.h,
                        // ),
                      ),
                      Positioned(
                          top: 1.5.h,
                          left: 2.2.w,
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                likebutton = !likebutton;

                              });

                            },
                            child: CircleAvatar(
                                radius: 3.5.w,
                                backgroundColor: ColorUtils.white,
                                child: likebutton?
                                Icon(
                                  Icons.favorite_outline,
                                  color: ColorUtils.black,
                                  size: 4.5.w,
                                ):
                                Icon(
                                  Icons.favorite,
                                  color: ColorUtils.redColorExpiresIn,
                                  size: 4.5.w,
                                )
                            ),
                          ))
                    ]),
                SizedBox(height: 1.h),
                TextWidget(
                  textTitle: widget.text,
                  color: ColorUtils.textColor,
                  fontFamily: FontUtils.PoppinsSemibold,
                  fontSize: 2.5.t,
                ),
                Container(
                  width: 85.w,
                  child: TextWidget(
                    // textTitle: Constants.resturantAddress5,
                    textTitle: widget.addressText,
                    color: ColorUtils.grey,
                    fontFamily: FontUtils.PoppinsRegular,
                    fontSize: 1.7.t,
                    overFlow: TextOverflow.ellipsis,
                  ),
                ),



                // Row(
                //   children: [
                //     SizedBox(
                //       width: 1.w,
                //     ),
                //     Row(
                //       children: [
                //         RatingWidget(
                //           initialRating: 4.5,
                //         ),
                //         TextWidget(
                //           textTitle: Constants.ratingPoint,
                //           fontSize: 1.5.t,
                //           fontFamily: FontUtils.PoppinsRegular,
                //           color: ColorUtils.textColor,
                //         ),
                //         TextWidget(
                //           textTitle: Constants.ratingPoint1,
                //           fontSize: 1.5.t,
                //           fontFamily: FontUtils.PoppinsRegular,
                //           color: ColorUtils.textColor,
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                // Row(
                //   children: [
                //     TextWidget(
                //       textTitle: Constants.cutPrice,
                //       color: ColorUtils.grey,
                //       fontSize: 1.7.t,
                //       fontFamily: FontUtils.PoppinsMedium,
                //       decoration: TextDecoration.lineThrough,
                //     ),
                //     SizedBox(
                //       width: 1.w,
                //     ),
                //     TextWidget(
                //       textTitle: Constants.from,
                //       color: ColorUtils.gradientColor,
                //       fontSize: 1.7.t,
                //       fontFamily: FontUtils.PoppinsMedium,
                //     ),
                //     SizedBox(
                //       width: 1.w,
                //     ),
                //     TextWidget(
                //       textTitle: Constants.cutPrice1,
                //       color: ColorUtils.gradientColor,
                //       fontSize: 1.7.t,
                //       fontFamily: FontUtils.PoppinsSemibold,
                //     ),
                //     SizedBox(
                //       width: 1.w,
                //     ),
                //     Container(
                //       decoration: BoxDecoration(
                //         border: Border.all(color: ColorUtils.gradientColor),
                //         borderRadius: BorderRadius.circular(5),
                //         color: ColorUtils.gradientColor.withOpacity(0.1),
                //       ),
                //       child: Padding(
                //         padding: EdgeInsets.all(0.5),
                //         child: Row(
                //           children: [
                //             Image.asset(
                //               ImageUtils.discount,
                //               height: 2.h,
                //             ),
                //             SizedBox(
                //               width: 1.w,
                //             ),
                //             TextWidget(
                //               textTitle: Constants.off,
                //               color: ColorUtils.gradientColor,
                //               fontSize: 1.5.t,
                //               fontFamily: FontUtils.PoppinsRegular,
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 0.5.h,),
                // TextWidget(
                //   textTitle: Constants.hotelCountry,
                //   color: ColorUtils.textColor,
                //   fontFamily: FontUtils.PoppinsRegular,
                //   fontSize: 1.7.t,
                // ),

                Row(
                    children:[
                      TextWidget(
                        textTitle: Constants.foodCategories1,
                        textAlign: TextAlign.start,
                        color: ColorUtils.grey,
                        fontSize: 1.8.t,
                        fontFamily: FontUtils.PoppinsRegular,
                      ),
                      SizedBox(width: 1.w,),
                      CircleAvatar(
                        radius: 2,
                        backgroundColor: ColorUtils.gradientcolor2,
                      ),
                      SizedBox(width: 1.w,),
                      TextWidget(
                        textTitle: Constants.foodCategories2,
                        textAlign: TextAlign.start,
                        color: ColorUtils.grey,
                        fontSize: 1.8.t,
                        fontFamily: FontUtils.PoppinsRegular,
                      ),
                      SizedBox(width: 1.w,),
                      CircleAvatar(
                        radius: 2,
                        backgroundColor: ColorUtils.gradientcolor2,
                      ),
                      SizedBox(width: 1.w,),
                      TextWidget(
                        textTitle: Constants.foodCategories3,
                        textAlign: TextAlign.start,
                        color: ColorUtils.grey,
                        fontSize: 1.8.t,
                        fontFamily: FontUtils.PoppinsRegular,
                      ),

                    ]),
                SizedBox(height: 1.h,),
                Row(
                  children: [

                    ExpireTimeOne(
                      title: Constants.expireTime1,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    PercentOff(title: Constants.percentOff),
                  ],
                ),

              ],
            ),
          ),
        ),
      );
  }
}
