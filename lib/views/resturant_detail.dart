import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/friend/chatScreen.dart';
import 'package:deals_app/widgets/rating_widget.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ResturantDetail extends StatefulWidget {
  @override
  State<ResturantDetail> createState() => _ResturantDetailState();
}

class _ResturantDetailState extends State<ResturantDetail> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.selectHourly = 0;
        model.selectDaily = 0;
        model.selectWeekly = 0;
        model.notifyListeners();
      },
      builder: (context, model, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.transparent.withOpacity(0.1),
                                //     spreadRadius: 3,
                                //     blurRadius: 10,
                                //     offset: Offset(0, 5), // changes position of shadow
                                //   ),
                                // ],
                                border: Border.all(
                                    color: ColorUtils.gradientColor,
                                    width: 1.w),
                                shape: BoxShape.circle),
                            child: CircleAvatar(
                              backgroundColor: ColorUtils.white,
                              radius: 35,
                              child: CircleAvatar(
                                radius: 32,
                                backgroundImage: AssetImage(ImageUtils.r1),
                              ),
                            )),
                        Positioned(
                          bottom: 0.4.h,
                          right: -2.w,
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorUtils.pink,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Center(
                                child: Icon(
                                  Icons.favorite_outlined,
                                  color: ColorUtils.white,
                                  size: 2.5.h,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 1.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 1.h,
                              ),
                              TextWidget(
                                textTitle: Constants.resturantName1,
                                fontSize: 2.t,
                                fontFamily: FontUtils.PoppinsSemibold,
                                color: ColorUtils.textColor,
                              ),
                              SizedBox(
                                width: 14.w,
                              ),
                              //Icon(Icons.favorite_outlined,color: ColorUtils.gradientColor,size: 2.5.h,),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 1.3.w,
                              ),
                              RatingWidget(
                                initialRating: 4.0,
                              ),
                              TextWidget(
                                textTitle:
                                    '${Constants.ratingPoint} ${Constants.ratingPoint1}',
                                fontFamily: FontUtils.PoppinsRegular,
                                fontSize: 1.5.t,
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 2.w),
                            child: TextWidget(
                              textTitle: Constants.rendomText,
                              fontSize: 1.8.t,
                              fontFamily: FontUtils.PoppinsRegular,
                              color: ColorUtils.grey,
                            ),
                          ),
                          Container(
                            width: 65.w,
                            margin: EdgeInsets.only(left: 2.w),
                            child: TextWidget(
                              textTitle: Constants.resturantAddress,
                              fontSize: 1.6.t,
                              fontFamily: FontUtils.PoppinsRegular,
                              color: ColorUtils.grey,
                              overFlow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 2.w),
                            child: TextWidget(
                              textTitle: Constants.twentyMeter,
                              fontSize: 1.5.t,
                              fontFamily: FontUtils.PoppinsRegular,
                              color: ColorUtils.grey,
                              overFlow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                  child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            model.selectIcon = index;
                            model.notifyListeners();
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: model.selectIcon == index
                                  ? ColorUtils.gradientColor
                                  : ColorUtils.grey.withOpacity(0.13),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Icon(model.generalIcon[index]['icon'],
                                    size: 3.5.h,
                                    color: model.selectIcon == index
                                        ? ColorUtils.white
                                        : ColorUtils.gradientColor),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Divider(),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      textTitle: Constants.photos,
                      color: ColorUtils.textColor,
                      fontSize: 2.t,
                      fontFamily: FontUtils.PoppinsSemibold,
                    ),
                    TextWidget(
                      textTitle: Constants.seeAll,
                      color: ColorUtils.gradientColor,
                      fontSize: 2.t,
                      fontFamily: FontUtils.PoppinsRegular,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 20.h,
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: EdgeInsets.only(right: 2.w),
                            child: Image.asset(
                              ImageUtils.r1,
                              height: 20.h,
                              fit: BoxFit.cover,
                            ));
                      }),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 5.h,
                  width: double.infinity,
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: model.resturantTabbar.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                model.resturantselect = index;
                                model.notifyListeners();
                              },
                              child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.w),
                                  height: 5.h,
                                  // margin: EdgeInsets.only(
                                  //     left: 5.w),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            model.resturantselect == index
                                                ? ColorUtils.gradientcolor1
                                                : ColorUtils.white,
                                            model.resturantselect == index
                                                ? ColorUtils.gradientcolor2
                                                : ColorUtils.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                          stops: [0.1, 0.6]),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(
                                        model.resturantTabbar[index]["tab"],
                                        style: TextStyle(
                                          fontSize: 2.t,
                                          fontFamily: FontUtils.PoppinsMedium,
                                          color: model.resturantselect == index
                                              ? ColorUtils.white
                                              : ColorUtils.black,
                                        )),
                                  )),
                            ),

                            // SizedBox(width: 2.w,)
                          ],
                        );
                      }),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 5.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: model.delivery.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 2.4.h,
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              TextWidget(
                                textTitle: model.delivery[index]['title'],
                                fontSize: 1.8.t,
                                fontFamily: FontUtils.PoppinsRegular,
                                color: ColorUtils.textColor,
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: ColorUtils.textColor,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Container(
                      width: 80.w,
                      child: TextWidget(
                        textTitle: Constants.resturantAddress,
                        maxLines: 2,
                        fontFamily: FontUtils.PoppinsMedium,
                        fontSize: 1.6.t,
                        color: ColorUtils.textColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.watch_later,
                      color: ColorUtils.textColor,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TextWidget(
                              textTitle: Constants.open,
                              color: ColorUtils.gradientColor,
                              fontSize: 1.8.t,
                              fontFamily: FontUtils.PoppinsMedium,
                            ),
                            TextWidget(
                              textTitle: '  .  ',
                              color: ColorUtils.textColor,
                              fontSize: 1.8.t,
                              fontFamily: FontUtils.PoppinsMedium,
                            ),
                            TextWidget(
                              textTitle: Constants.close,
                              color: ColorUtils.textColor,
                              fontSize: 1.8.t,
                              fontFamily: FontUtils.PoppinsMedium,
                            ),
                          ],
                        ),
                        TextWidget(
                          textTitle: Constants.update,
                          color: ColorUtils.grey,
                          fontSize: 1.2.t,
                          fontFamily: FontUtils.PoppinsRegular,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextWidget(
                  textTitle: Constants.offers,
                  color: ColorUtils.textColor,
                  fontSize: 2.t,
                  fontFamily: FontUtils.PoppinsSemibold,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      textTitle: Constants.hourly,
                      color: ColorUtils.grey,
                      fontSize: 2.t,
                      fontFamily: FontUtils.PoppinsSemibold,
                    ),
                    TextWidget(
                      textTitle: Constants.seeAll,
                      color: ColorUtils.gradientColor,
                      fontSize: 2.t,
                      fontFamily: FontUtils.PoppinsMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 25.h,
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            model.selectHourly = index;
                            model.notifyListeners();
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 2.w),
                            height: 25.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: model.selectHourly == index
                                  ? ColorUtils.gradientColor
                                  : ColorUtils.grey.withOpacity(0.1),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          TextWidget(
                                            textTitle: Constants.percent,
                                            color: model.selectHourly == index
                                                ? ColorUtils.white
                                                : ColorUtils.textColor,
                                            fontSize: 4.t,
                                            fontFamily:
                                                FontUtils.PoppinsSemibold,
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 1.h),
                                            child: TextWidget(
                                              textTitle: Constants.oFF,
                                              color: model.selectHourly == index
                                                  ? ColorUtils.white
                                                  : ColorUtils.textColor,
                                              fontSize: 1.4.t,
                                              fontFamily:
                                                  FontUtils.PoppinsMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(3.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.watch_later_outlined,
                                                  color: model.selectHourly ==
                                                          index
                                                      ? ColorUtils.white
                                                      : ColorUtils.grey,
                                                  size: 2.h,
                                                ),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                TextWidget(
                                                  textTitle: Constants.expireIn,
                                                  color: model.selectHourly ==
                                                          index
                                                      ? ColorUtils.white
                                                      : ColorUtils.grey,
                                                  fontSize: 1.3.t,
                                                  fontFamily:
                                                      FontUtils.PoppinsRegular,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 7.w),
                                            decoration: BoxDecoration(
                                                color:
                                                    model.selectHourly == index
                                                        ? ColorUtils.white
                                                        : ColorUtils.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Padding(
                                              padding: EdgeInsets.all(3.0),
                                              child: Center(
                                                child: TextWidget(
                                                  textTitle:
                                                      Constants.timeInSeconds,
                                                  color:
                                                      ColorUtils.gradientColor,
                                                  fontFamily:
                                                      FontUtils.PoppinsRegular,
                                                  fontSize: 1.3.t,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  TextWidget(
                                    textTitle: Constants.onTotalBill,
                                    color: model.selectHourly == index
                                        ? ColorUtils.white
                                        : ColorUtils.grey,
                                    fontSize: 1.8.t,
                                    fontFamily: FontUtils.PoppinsRegular,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      textTitle: Constants.daily,
                      color: ColorUtils.grey,
                      fontSize: 2.t,
                      fontFamily: FontUtils.PoppinsSemibold,
                    ),
                    TextWidget(
                      textTitle: Constants.seeAll,
                      color: ColorUtils.gradientColor,
                      fontSize: 2.t,
                      fontFamily: FontUtils.PoppinsMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 25.h,
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            model.selectDaily = index;
                            model.notifyListeners();
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 2.w),
                            height: 25.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: model.selectDaily == index
                                  ? ColorUtils.gradientColor
                                  : ColorUtils.grey.withOpacity(0.1),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          TextWidget(
                                            textTitle: Constants.percent,
                                            color: model.selectDaily == index
                                                ? ColorUtils.white
                                                : ColorUtils.textColor,
                                            fontSize: 4.t,
                                            fontFamily:
                                                FontUtils.PoppinsSemibold,
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 1.h),
                                            child: TextWidget(
                                              textTitle: Constants.oFF,
                                              color: model.selectDaily == index
                                                  ? ColorUtils.white
                                                  : ColorUtils.textColor,
                                              fontSize: 1.4.t,
                                              fontFamily:
                                                  FontUtils.PoppinsMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(3.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.watch_later_outlined,
                                                  color:
                                                      model.selectDaily == index
                                                          ? ColorUtils.white
                                                          : ColorUtils.grey,
                                                  size: 2.h,
                                                ),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                TextWidget(
                                                  textTitle: Constants.expireIn,
                                                  color:
                                                      model.selectDaily == index
                                                          ? ColorUtils.white
                                                          : ColorUtils.grey,
                                                  fontSize: 1.3.t,
                                                  fontFamily:
                                                      FontUtils.PoppinsRegular,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 7.w),
                                            decoration: BoxDecoration(
                                                color:
                                                    model.selectDaily == index
                                                        ? ColorUtils.white
                                                        : ColorUtils.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Padding(
                                              padding: EdgeInsets.all(3.0),
                                              child: Center(
                                                child: TextWidget(
                                                  textTitle:
                                                      Constants.timeInSeconds,
                                                  color:
                                                      ColorUtils.gradientColor,
                                                  fontFamily:
                                                      FontUtils.PoppinsRegular,
                                                  fontSize: 1.3.t,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  TextWidget(
                                    textTitle: Constants.onTotalBill,
                                    color: model.selectDaily == index
                                        ? ColorUtils.white
                                        : ColorUtils.grey,
                                    fontSize: 1.8.t,
                                    fontFamily: FontUtils.PoppinsRegular,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      textTitle: Constants.weekly,
                      color: ColorUtils.grey,
                      fontSize: 2.t,
                      fontFamily: FontUtils.PoppinsSemibold,
                    ),
                    TextWidget(
                      textTitle: Constants.seeAll,
                      color: ColorUtils.gradientColor,
                      fontSize: 2.t,
                      fontFamily: FontUtils.PoppinsMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 25.h,
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            model.selectWeekly = index;
                            model.notifyListeners();
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 2.w),
                            height: 25.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: model.selectWeekly == index
                                  ? ColorUtils.gradientColor
                                  : ColorUtils.grey.withOpacity(0.1),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          TextWidget(
                                            textTitle: Constants.percent,
                                            color: model.selectWeekly == index
                                                ? ColorUtils.white
                                                : ColorUtils.textColor,
                                            fontSize: 4.t,
                                            fontFamily:
                                                FontUtils.PoppinsSemibold,
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 1.h),
                                            child: TextWidget(
                                              textTitle: Constants.oFF,
                                              color: model.selectWeekly == index
                                                  ? ColorUtils.white
                                                  : ColorUtils.textColor,
                                              fontSize: 1.4.t,
                                              fontFamily:
                                                  FontUtils.PoppinsMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(3.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.watch_later_outlined,
                                                  color: model.selectWeekly ==
                                                          index
                                                      ? ColorUtils.white
                                                      : ColorUtils.grey,
                                                  size: 2.h,
                                                ),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                TextWidget(
                                                  textTitle: Constants.expireIn,
                                                  color: model.selectWeekly ==
                                                          index
                                                      ? ColorUtils.white
                                                      : ColorUtils.grey,
                                                  fontSize: 1.3.t,
                                                  fontFamily:
                                                      FontUtils.PoppinsRegular,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 7.w),
                                            decoration: BoxDecoration(
                                                color:
                                                    model.selectWeekly == index
                                                        ? ColorUtils.white
                                                        : ColorUtils.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Padding(
                                              padding: EdgeInsets.all(3.0),
                                              child: Center(
                                                child: TextWidget(
                                                  textTitle:
                                                      Constants.timeInSeconds,
                                                  color:
                                                      ColorUtils.gradientColor,
                                                  fontFamily:
                                                      FontUtils.PoppinsRegular,
                                                  fontSize: 1.3.t,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  TextWidget(
                                    textTitle: Constants.onTotalBill,
                                    color: model.selectWeekly == index
                                        ? ColorUtils.white
                                        : ColorUtils.grey,
                                    fontSize: 1.8.t,
                                    fontFamily: FontUtils.PoppinsRegular,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      textTitle: "Check-Ins",
                      color: ColorUtils.black,
                      fontSize: 2.t,
                      fontFamily: FontUtils.PoppinsSemibold,
                    ),
                    TextWidget(
                      textTitle: Constants.seeAll,
                      color: ColorUtils.gradientColor,
                      fontSize: 2.t,
                      fontFamily: FontUtils.PoppinsMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 25.h,
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            model.selectWeekly = index;
                            model.notifyListeners();
                          },
                          child: Container(
                              margin: EdgeInsets.only(right: 2.w),
                              height: 25.h,
                              width: 45.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: model.selectWeekly == index
                                    ? ColorUtils.gradientColor
                                    : ColorUtils.grey.withOpacity(0.1),
                              ),
                              child: Image.asset(
                                ImageUtils.r1,
                                fit: BoxFit.fill,
                              )),
                        );
                      }),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      textTitle: Constants.ratingAndReviews,
                      color: ColorUtils.textColor,
                      fontSize: 2.5.t,
                      fontFamily: FontUtils.PoppinsSemibold,
                    ),
                    TextWidget(
                      textTitle: Constants.seeAll,
                      color: ColorUtils.gradientColor,
                      fontSize: 2.t,
                      fontFamily: FontUtils.PoppinsMedium,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          textTitle: Constants.ratingPoint,
                          color: ColorUtils.textColor,
                          fontSize: 5.t,
                          fontFamily: FontUtils.PoppinsSemibold,
                        ),
                        RatingWidget(
                          initialRating: 4.8,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Container(
                      width: 0.4.w,
                      height: 8.h,
                      color: ColorUtils.grey.withOpacity(0.5),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Image.asset(
                          ImageUtils.progressbar,
                          height: 7.h,
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        TextWidget(
                          textTitle: Constants.twentyeight,
                          fontSize: 1.5.t,
                          color: ColorUtils.textColor,
                          fontFamily: FontUtils.PoppinsMedium,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Divider(
                  height: 0.0,
                ),
                SizedBox(
                  height: 2.h,
                ),
                ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    ImageUtils.profileImage,
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      TextWidget(
                                        textTitle:
                                            '${Constants.userFirstName} ${Constants.userLastName}',
                                        fontFamily: FontUtils.PoppinsSemibold,
                                        color: ColorUtils.textColor,
                                        fontSize: 1.8.t,
                                      ),
                                      TextWidget(
                                        textTitle: Constants.randomDate,
                                        fontFamily: FontUtils.PoppinsSemibold,
                                        color: ColorUtils.grey,
                                        fontSize: 1.3.t,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star, color: ColorUtils.yellow),
                                  TextWidget(
                                    textTitle: '(${Constants.ratingPoint})',
                                    fontSize: 1.8.t,
                                    fontFamily: FontUtils.PoppinsSemibold,
                                    color: ColorUtils.textColor,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 11.w),
                            child: TextWidget(
                              textTitle: Constants.userReviews,
                              fontSize: 1.8.t,
                              fontFamily: FontUtils.PoppinsRegular,
                              color: ColorUtils.grey,
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: 5),
                SizedBox(
                  height: 2.h,
                ),
                TextWidget(
                  textTitle: Constants.about,
                  color: ColorUtils.textColor,
                  fontSize: 2.5.t,
                  fontFamily: FontUtils.PoppinsSemibold,
                ),
                TextWidget(
                  textTitle: Constants.yourMessage,
                  color: ColorUtils.grey,
                  fontSize: 1.7.t,
                  fontFamily: FontUtils.PoppinsRegular,
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextWidget(
                  textTitle: Constants.address,
                  color: ColorUtils.textColor,
                  fontSize: 2.5.t,
                  fontFamily: FontUtils.PoppinsSemibold,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: ColorUtils.gradientColor,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 1.h),
                      width: 82.w,
                      child: TextWidget(
                        overFlow: TextOverflow.ellipsis,
                        textTitle: Constants.resturantAddress,
                        color: ColorUtils.grey,
                        fontSize: 1.6.t,
                        fontFamily: FontUtils.PoppinsRegular,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Image.asset(
                  ImageUtils.mapImage,
                  height: 40.h,
                  width: 90.w,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              model.navigationService.navigateTo(to: ChatScreenOne());
            },
            // backgroundColor: Colors.green,
            child: Container(
              height: 9.h,
              width: 28.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    ColorUtils.gradientcolor1,
                    ColorUtils.gradientcolor2,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  stops: [0.4, 0.9],
                ),
              ),
              child: Icon(Icons.message),
            ),
          ),
        );
      },
    );
  }
}
