import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/resturant_detail.dart';
import 'package:deals_app/views/search_restaurant_details.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../utils/dimensions.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.selectCategory = null;
        model.notifyListeners();
      },
      builder: (context, model, child) {
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
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            ImageUtils.profileImage,
                                            height: 6.h,
                                          ),
                                          Container(
                                            height: 5.5.h,
                                            width: 75.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        1.5.w),
                                                color: ColorUtils.grey
                                                    .withOpacity(0.1)),
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 4.w),
                                                      child: Icon(
                                                        Icons.search,
                                                        color: ColorUtils
                                                            .searchColor,
                                                      )),
                                                  Expanded(
                                                    child: TextField(
                                                      style: CustomTheme
                                                          .searchtextfeild,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            "Search here...",
                                                        hintStyle: CustomTheme
                                                            .searchtextfeild,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Container(
                                        height: 5.h,
                                        width: double.infinity,
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
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    3.w),
                                                        height: 5.h,
                                                        // margin: EdgeInsets.only(
                                                        //     left: 5.w),
                                                        decoration:
                                                            BoxDecoration(
                                                                gradient:
                                                                    LinearGradient(
                                                                        colors: [
                                                                          model.select == index
                                                                              ? ColorUtils.gradientcolor1
                                                                              : ColorUtils.white,
                                                                          model.select == index
                                                                              ? ColorUtils.gradientcolor2
                                                                              : ColorUtils.white,
                                                                        ],
                                                                        begin: Alignment
                                                                            .bottomLeft,
                                                                        end: Alignment
                                                                            .topRight,
                                                                        stops: [
                                                                          0.1,
                                                                          0.6
                                                                        ]),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                        child: Center(
                                                          child: Text(
                                                              model.tabbar[
                                                                  index]["tab"],
                                                              style: TextStyle(
                                                                fontSize: 2.t,
                                                                fontFamily:
                                                                    FontUtils
                                                                        .PoppinsMedium,
                                                                color: model
                                                                            .select ==
                                                                        index
                                                                    ? ColorUtils
                                                                        .white
                                                                    : ColorUtils
                                                                        .black,
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
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 30.w,
                                      decoration: BoxDecoration(
                                      color: ColorUtils
                                              .searchColor
                                              .withOpacity(
                                              0.1),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10.0)),
                                      ),
                                      child: ListView.separated(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                model.selectCategory = index;
                                                model.notifyListeners();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  // color: Colors.blue,





                                                ),
                                                child: Row(
                                                  children: [
                                                    model.selectCategory == index
                                                        ? Container(
                                                            height: 12.h,
                                                            width: 1.w,
                                                            // color: ColorUtils.gradientColor,
                                                      decoration: BoxDecoration(
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
                                                        ),
                                                      ))
                                                        : Container(
                                                            height: 0.0,
                                                            width: 0.0,
                                                          ),
                                                    Container(
                                                      height: 12.h,
                                                      width: 29.w,
                                                      decoration: BoxDecoration(
                                                        color: model.selectCategory ==
                                                                    index
                                                                ? ColorUtils
                                                                    .white
                                                                    .withOpacity(1)
                                                                : ColorUtils
                                                                    .searchColor
                                                                    .withOpacity(
                                                                        0.01),





                                                      ),
                                                      child: Center(
                                                        child: TextWidget(
                                                          textTitle: model
                                                                  .categoriesName[
                                                              index]['title'],
                                                          textAlign:
                                                              TextAlign.center,
                                                          fontSize: 1.5.t,
                                                          fontFamily: FontUtils
                                                              .PoppinsMedium,
                                                          maxLines: 2,
                                                          overFlow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) =>
                                              Divider(
                                                height: 0.0,
                                              ),
                                          itemCount:
                                              model.categoriesName.length),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 2.w),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.asset(
                                              ImageUtils.dealBanner,
                                              height: 15.h,
                                              width: 65.w,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.5.h,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 2.w),
                                          child: TextWidget(
                                            textTitle: Constants.pickForYou,
                                            fontSize: 2.t,
                                            fontFamily:
                                                FontUtils.PoppinsSemibold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.5.h,
                                        ),
                                        GestureDetector(
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
                                            //                   vertical: 2.h),
                                            //           height: 180.h,
                                            //           child: ResturantDetail(),
                                            //         );
                                            //       });
                                            // });
                                            model.navigationService.navigateTo(
                                                to: SearchDetails());
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: Image.asset(
                                                        ImageUtils.r1,
                                                        height: 10.h,
                                                        width: 20.w,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    SizedBox(height: 1.5.h,),
                                                    TextWidget(
                                                      textTitle:
                                                          Constants.offerName,
                                                      fontFamily: FontUtils
                                                          .PoppinsMedium,
                                                      fontSize: 1.6.t,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: Image.asset(
                                                        ImageUtils.pick2,
                                                        height: 10.h,
                                                        width: 20.w,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    SizedBox(height: 1.5.h,),
                                                    TextWidget(
                                                      textTitle:"WOK Dubai",
                                                      fontFamily: FontUtils
                                                          .PoppinsMedium,
                                                      fontSize: 1.6.t,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: Image.asset(
                                                        ImageUtils.pick1,
                                                        height: 10.h,
                                                        width: 20.w,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),SizedBox(height: 1.5.h,),
                                                    TextWidget(
                                                      textTitle:"Accessories",
                                                      fontFamily: FontUtils
                                                          .PoppinsMedium,
                                                      fontSize: 1.6.t,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.5.h,
                                        ),
                                        GestureDetector(
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
                                            //                   vertical: 2.h),
                                            //           height: 180.h,
                                            //           child: ResturantDetail(),
                                            //         );
                                            //       });
                                            // });
                                            model.navigationService.navigateTo(
                                                to: SearchDetails());
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: Image.asset(
                                                        ImageUtils.pick3,
                                                        height: 10.h,
                                                        width: 20.w,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),SizedBox(height: 1.5.h,),
                                                    TextWidget(
                                                      textTitle:"Tablet",
                                                      fontFamily: FontUtils
                                                          .PoppinsMedium,
                                                      fontSize: 1.4.t,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),

                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          12),
                                                      child: Image.asset(
                                                        ImageUtils.pick1,
                                                        height: 10.h,
                                                        width: 20.w,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),SizedBox(height: 1.5.h,),
                                                    TextWidget(
                                                      textTitle:
                                                      "Accessories",
                                                      fontFamily: FontUtils
                                                          .PoppinsMedium,
                                                      fontSize: 1.4.t,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: Image.asset(
                                                        ImageUtils.pick4,
                                                        height: 10.h,
                                                        width: 20.w,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),SizedBox(height: 1.5.h,),
                                                    TextWidget(
                                                      textTitle:"Mobile Phone",
                                                      fontFamily: FontUtils
                                                          .PoppinsMedium,
                                                      fontSize: 1.4.t,
                                                    ),
                                                  ],
                                                ),


                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.5.h,
                                        ),
                                        GestureDetector(
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
                                            //                   vertical: 2.h),
                                            //           height: 180.h,
                                            //           child: ResturantDetail(),
                                            //         );
                                            //       });
                                            // });

                                            model.navigationService.navigateTo(
                                                to: SearchDetails());
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: Image.asset(
                                                        ImageUtils.pick4,
                                                        height: 10.h,
                                                        width: 20.w,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),SizedBox(height: 1.5.h,),
                                                    TextWidget(
                                                      textTitle:"Mobile Phone",
                                                      fontFamily: FontUtils
                                                          .PoppinsMedium,
                                                      fontSize: 1.4.t,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: Image.asset(
                                                        ImageUtils.pick3,
                                                        height: 10.h,
                                                        width: 20.w,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),SizedBox(height: 1.5.h,),
                                                    TextWidget(
                                                      textTitle:"Tablet",
                                                      fontFamily: FontUtils
                                                          .PoppinsMedium,
                                                      fontSize: 1.4.t,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: Image.asset(
                                                        ImageUtils.pick1,
                                                        height: 10.h,
                                                        width: 20.w,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),SizedBox(height: 1.5.h,),
                                                    TextWidget(
                                                      textTitle:"Assessories",
                                                      fontFamily: FontUtils
                                                          .PoppinsMedium,
                                                      fontSize: 1.4.t,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.8.h,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 2.w),
                                          child: TextWidget(
                                            textTitle: Constants.youMayAlsoLike,
                                            fontSize: 2.t,
                                            fontFamily:
                                                FontUtils.PoppinsSemibold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        GestureDetector(
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
                                            //                   vertical: 2.h),
                                            //           height: 180.h,
                                            //           child: ResturantDetail(),
                                            //         );
                                            //       });
                                            // });
                                            model.navigationService.navigateTo(
                                                to: SearchDetails());
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: Image.asset(
                                                        ImageUtils.pick3,
                                                        height: 10.h,
                                                        width: 20.w,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),SizedBox(height: 1.5.h,),
                                                    TextWidget(
                                                      textTitle:"Tablet",
                                                      fontFamily: FontUtils
                                                          .PoppinsMedium,
                                                      fontSize: 1.4.t,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: Image.asset(
                                                        ImageUtils.pick1,
                                                        height: 10.h,
                                                        width: 20.w,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),SizedBox(height: 1.5.h,),
                                                    TextWidget(
                                                      textTitle:"Accessories",
                                                      fontFamily: FontUtils
                                                          .PoppinsMedium,
                                                      fontSize: 1.4.t,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: Image.asset(
                                                        ImageUtils.pick4,
                                                        height: 10.h,
                                                        width: 20.w,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),SizedBox(height: 1.5.h,),
                                                    TextWidget(
                                                      textTitle: "Mobile Phone",
                                                      fontFamily: FontUtils
                                                          .PoppinsMedium,
                                                      fontSize: 1.4.t,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.5.h,
                                        ),

                                      ],
                                    ),
                                  ],
                                )
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
