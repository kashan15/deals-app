import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/favourite/resturant_list.dart';
import 'package:deals_app/views/offers/offer_list_three.dart';
import 'package:deals_app/views/offers/offer_list_two.dart';
import 'package:deals_app/views/resturant_detail.dart';
import 'package:deals_app/views/search_restaurant_details.dart';
import 'package:deals_app/widgets/buy_one_get_one.dart';
import 'package:deals_app/widgets/container_shadow.dart';
import 'package:deals_app/widgets/deals_all.dart';
import 'package:deals_app/widgets/expire_deals.dart';
import 'package:deals_app/widgets/percent_off.dart';
import 'package:deals_app/widgets/rating_widget.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stacked/stacked.dart';

import '../widgets/newContainer_shadow.dart';
import 'notification/noti_resturant.dart';

class HotDeals extends StatefulWidget {
  const HotDeals({Key? key}) : super(key: key);

  @override
  State<HotDeals> createState() => _HotDealsState();
}

class _HotDealsState extends State<HotDeals> {
  final controller =
      PageController(initialPage: 0, viewportFraction: 1.1, keepPage: false);

  @override
  Widget build(BuildContext context) {
    dynamic pages = [];

    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.selectHotDate = 0;
        pages = List.generate(
            model.homeSlider.length,
            (index) => Container(
                  child: Image.asset(
                    model.homeSlider[index]['images'],
                  ),
                ));
      },
      builder: (context, model, child) {
        pages = List.generate(
            model.homeSlider.length,
            (index) => Container(
                  child: Image.asset(
                    model.homeSlider[index]['images'],
                  ),
                ));
        return SafeArea(
          top: false,
          bottom: false,
          child: WillPopScope(
            onWillPop: () async {
              return true;
            },
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Scaffold(
                backgroundColor: ColorUtils.white,
                body: Stack(
                  children: <Widget>[
                    Container(
                      height: 25.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            ColorUtils.gradientcolor1,
                            ColorUtils.gradientcolor2,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          stops: [0.1, 0.6],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(50))),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 12.h),
                      child: Card(
                        margin: EdgeInsets.zero,
                        borderOnForeground: false,
                        color: ColorUtils.white,
                        shadowColor: ColorUtils.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: ColorUtils.white, width: 1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      ImageUtils.profileImage,
                                      height: 8.h,
                                    ),
                                    TextWidget(
                                      textTitle: Constants.hotDeals,
                                      color: ColorUtils.textColor,
                                      fontSize: 2.5.t,
                                      fontFamily: FontUtils.PoppinsSemibold,
                                    ),
                                    TextWidget(
                                      textTitle: Constants.discountOffer,
                                      color: Colors.transparent,
                                      fontSize: 1.t,
                                      fontFamily: FontUtils.PoppinsSemibold,
                                    ),
                                  ],
                                ),
                                Container(
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        height: 25.h,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                10.w,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: PageView.builder(
                                            controller: controller,
                                            // itemCount: pages.length,
                                            itemBuilder: (_, index) {
                                              return FractionallySizedBox(
                                                widthFactor: 1 /
                                                    controller.viewportFraction,
                                                child: pages[index],
                                              );
                                            },
                                            itemCount: pages.length,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 4.h,
                                          left: 35.w,
                                          child: SmoothPageIndicator(
                                              controller: controller,
                                              // PageController
                                              axisDirection: Axis.horizontal,
                                              count: model.homeSlider.length,
                                              effect: ExpandingDotsEffect(
                                                  dotColor: Colors.white,
                                                  activeDotColor:
                                                      ColorUtils.gradientColor,
                                                  dotWidth: 2.w,
                                                  dotHeight: 1.h),
                                              // your preferred effect
                                              onDotClicked: (index) {
                                                print(index);
                                              })),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.h),
                                  color: ColorUtils.hotdelas,
                                  height: 5.h,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 7.0),
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        itemCount: model.tabbar.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            // mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  model.select = index;
                                                  model.notifyListeners();
                                                },
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 3.w),
                                                    height: 5.h,
                                                    // margin: EdgeInsets.only(
                                                    //     left: 5.w),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Center(
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                              model.tabbar[
                                                                  index]["tab"],
                                                              style: TextStyle(
                                                                fontSize: 2.t,
                                                                fontFamily:
                                                                    FontUtils
                                                                        .PoppinsMedium,
                                                                color:
                                                                    ColorUtils
                                                                        .black,
                                                              )),
                                                          model.select == index
                                                              ? Container(
                                                                  height: 0.3.h,
                                                                  width: 5.w,
                                                                  color: ColorUtils
                                                                      .gradientColor,
                                                                )
                                                              : Container(
                                                                  height: 0.0,
                                                                  width: 0.0,
                                                                ),
                                                        ],
                                                      ),
                                                    )),
                                              ),

                                              // SizedBox(width: 2.w,)
                                            ],
                                          );
                                        }),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                  child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      itemCount: 2,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Container(
                                            margin: EdgeInsets.only(right: 2.w),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Image.asset(
                                                ImageUtils.hotDealBanner,
                                                height: 20.h,
                                                width: 80.w,
                                                fit: BoxFit.fill,
                                              ),
                                            ));
                                      }),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                SizedBox(
                                  height: 10.h,
                                  child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      itemCount: model.hotDeals.length,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            model.selectHotDate = index;
                                            model.notifyListeners();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                top: 1.h,
                                                left: 2.w,
                                                right: 2.w),
                                            margin: EdgeInsets.only(right: 5.w),
                                            decoration: BoxDecoration(
                                              color:
                                                  model.selectHotDate == index
                                                      ? ColorUtils.gradientColor
                                                      : ColorUtils.white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Column(
                                              children: [
                                                TextWidget(
                                                  textTitle: model
                                                      .hotDeals[index]['date'],
                                                  color: model.selectHotDate ==
                                                          index
                                                      ? ColorUtils.white
                                                      : ColorUtils.textColor,
                                                  fontSize: 2.t,
                                                  fontFamily:
                                                      FontUtils.PoppinsSemibold,
                                                ),
                                                TextWidget(
                                                  textTitle:
                                                      model.hotDeals[index]
                                                          ['number'],
                                                  color: model.selectHotDate ==
                                                          index
                                                      ? ColorUtils.white
                                                      : ColorUtils.grey,
                                                  fontSize: 1.5.t,
                                                  fontFamily:
                                                      FontUtils.PoppinsRegular,
                                                ),
                                                TextWidget(
                                                  textTitle:
                                                      model.hotDeals[index]
                                                          ['newDiscount'],
                                                  color: model.selectHotDate ==
                                                          index
                                                      ? ColorUtils.white
                                                      : ColorUtils.grey,
                                                  fontSize: 1.5.t,
                                                  fontFamily:
                                                      FontUtils.PoppinsRegular,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        TextWidget(
                                          textTitle: "Hot Offers",
                                          color: ColorUtils.textColor,
                                          fontFamily: FontUtils.PoppinsSemibold,
                                          fontSize: 2.2.t,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        TextWidget(
                                          textTitle: Constants.viewAll,
                                          color: ColorUtils.grey,
                                          fontSize: 1.5.t,
                                          fontFamily: FontUtils.PoppinsSemibold,
                                        ),

                                        // DealsAll(
                                        //     title: "Hot Offers",
                                        //     fontSize: 2.5.t,
                                        //     fontSize1: 1.5.t),

                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        // Container(
                                        //   decoration: BoxDecoration(
                                        //     borderRadius:
                                        //         BorderRadius.circular(5),
                                        //     color: ColorUtils.gradientColor,
                                        //   ),
                                        //   child: Center(
                                        //     child: Padding(
                                        //       padding: EdgeInsets.all(2.5),
                                        //       child: Icon(
                                        //         Icons.arrow_forward_ios_rounded,
                                        //         color: ColorUtils.white,
                                        //         size: 1.5.h,
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),


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
                                ),
                                SizedBox(
                                  height: 103.h,
                                  child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      // scrollDirection: Axis.vertical,
                                      itemCount: 2,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            // Future.delayed(Duration(seconds: 0),
                                            //     () {
                                            //   showModalBottomSheet(
                                            //       isDismissible: false,
                                            //       shape: RoundedRectangleBorder(
                                            //         borderRadius:
                                            //             BorderRadius.only(
                                            //           topLeft:
                                            //               Radius.circular(20),
                                            //           topRight:
                                            //               Radius.circular(20),
                                            //         ),
                                            //       ),
                                            //       context: context,
                                            //       builder: (builder) {
                                            //         return Container(
                                            //           margin:
                                            //               EdgeInsets.symmetric(
                                            //                   horizontal: 5.w,
                                            //                   vertical: 0.h),
                                            //           height: 180.h,
                                            //           child: ResturantDetail(),
                                            //         );
                                            //       });
                                            // });
                                            model.navigationService.navigateTo(
                                                to: SearchDetails());
                                          },
                                          child: GestureDetector(
                                            child: Container(
                                              // padding: EdgeInsets.zero,

                                              child: NotificationResturant(
                                                images: model.notificationImage[
                                                    index]['images'],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                TextWidget(
                                  textTitle: Constants.resturantOffers,
                                  color: ColorUtils.textColor,
                                  fontSize: 2.5.t,
                                  fontFamily: FontUtils.PoppinsSemibold,
                                ),
                                ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: 2,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return
                                      // return ResturantList(
                                      //   onTap: () {
                                      //     // Future.delayed(Duration(seconds: 0),
                                      //     //     () {
                                      //     //   showModalBottomSheet(
                                      //     //       isDismissible: false,
                                      //     //       shape: RoundedRectangleBorder(
                                      //     //         borderRadius:
                                      //     //             BorderRadius.only(
                                      //     //           topLeft:
                                      //     //               Radius.circular(20),
                                      //     //           topRight:
                                      //     //               Radius.circular(20),
                                      //     //         ),
                                      //     //       ),
                                      //     //       context: context,
                                      //     //       builder: (builder) {
                                      //     //         return Container(
                                      //     //           margin:
                                      //     //               EdgeInsets.symmetric(
                                      //     //                   horizontal: 5.w,
                                      //     //                   vertical: 2.h),
                                      //     //           height: 180.h,
                                      //     //           child: ResturantDetail(),
                                      //     //         );
                                      //     //       });
                                      //     // });
                                      //     model.navigationService
                                      //         .navigateTo(to: SearchDetails());
                                      //   },
                                      //   title: model.favourite[index]['title'],
                                      //   image: model.favourite[index]['image'],
                                      // );

                                      OffersListThree(
                                        onTap: (){
                                          model.navigationService.navigateTo(to: SearchDetails());
                                        },
                                        title:model.favourite[index]['title'],
                                        image: model.favourite[index]['image'],
                                        Icon: model.favouriteIcon[index]['icon'],
                                      );

                                    }),
                                SizedBox(
                                  height: 2.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                        elevation: 0.0,
                        clipBehavior: Clip.antiAlias,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
