import 'dart:ui';

import 'Package:flutter/material.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/favourite/resturant_list.dart';
import 'package:deals_app/views/offers/offer_list_two.dart';
import 'package:deals_app/views/resturant_detail.dart';
import 'package:deals_app/views/reviews_one.dart';
import 'package:deals_app/views/search_restaurant_details.dart';
import 'package:deals_app/widgets/favorite_restaurant_widget.dart';
import 'package:deals_app/widgets/favorite_restaurant_widget_one.dart';
import 'package:deals_app/widgets/resturant_widget.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:stacked/stacked.dart';
import '../app/locator.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.select = 0;
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
                      height: 35.h,
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
                      child: Column(
                        children: [
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_back,
                              //     color: ColorUtils.white,
                              //     size: 7.i,
                              //   ),
                              // ),
                              Container(
                                height: 6.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: ColorUtils.white),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 4.w),
                                          child: Icon(
                                            Icons.search,
                                            color: ColorUtils.grey,
                                          )),
                                      Expanded(
                                        child: TextField(
                                          style: CustomTheme.searchtextfeild,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Search here...",
                                            hintStyle:
                                                CustomTheme.searchtextfeild,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                            margin: EdgeInsets.only(right: 3.w),
                                            child: Icon(
                                              Icons.cancel,
                                              color: ColorUtils.grey,
                                              size: 4.i,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(50))),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 18.h),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 2.h,
                                ),
                                Container(
                                  height: 5.h,
                                  width: double.infinity,
                                  child: ListView.builder(
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
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 3.w),
                                                  height: 5.h,
                                                  // margin: EdgeInsets.only(
                                                  //     left: 5.w),
                                                  decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            model.select ==
                                                                    index
                                                                ? ColorUtils
                                                                    .gradientcolor1
                                                                : ColorUtils
                                                                    .white,
                                                            model.select ==
                                                                    index
                                                                ? ColorUtils
                                                                    .gradientcolor2
                                                                : ColorUtils
                                                                    .white,
                                                          ],
                                                          begin: Alignment
                                                              .bottomLeft,
                                                          end: Alignment
                                                              .topRight,
                                                          stops: [0.1, 0.6]),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Center(
                                                    child: Text(
                                                        model.tabbar[index]
                                                            ["tab"],
                                                        style: TextStyle(
                                                          fontSize: 2.t,
                                                          fontFamily: FontUtils
                                                              .PoppinsMedium,
                                                          color: model.select ==
                                                                  index
                                                              ? ColorUtils.white
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
                                  height: 3.h,
                                ),
                                model.select == 0
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            textTitle: Constants.recentSearch,
                                            color: ColorUtils.textColor,
                                            fontFamily:
                                                FontUtils.PoppinsSemibold,
                                            fontSize: 2.t,
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          ListView.separated(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            itemCount: 2,
                                            separatorBuilder:
                                                (BuildContext context,
                                                        int index) =>
                                                    Divider(),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // Future.delayed(Duration(seconds: 0), () {
                                                  //   showModalBottomSheet(
                                                  //       isDismissible: false,
                                                  //       shape: RoundedRectangleBorder(
                                                  //         borderRadius: BorderRadius.only(
                                                  //           topLeft: Radius.circular(20),
                                                  //           topRight: Radius.circular(20),
                                                  //         ),
                                                  //       ),
                                                  //       context: context,
                                                  //       builder: (builder) {
                                                  //         return Container(
                                                  //           margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                                                  //           height: 280.h,
                                                  //           child: ResturantDetail(),
                                                  //         );
                                                  //       });
                                                  // });
                                                  model.navigationService
                                                      .navigateTo(
                                                          to: SearchDetails());
                                                },
                                                child: Container(
                                                  padding:
                                                      EdgeInsets.only(top: 1.h),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              // Container(
                                                              //   height: 5.h,
                                                              //   decoration: BoxDecoration(
                                                              //     shape: BoxShape.circle,
                                                              //     border: Border.all(color: ColorUtils.gradientColor),
                                                              //   ),
                                                              //   child: ClipRRect(
                                                              //     borderRadius: BorderRadius.circular(20),
                                                              //     child: Image.asset(model.searches[index]['images'],
                                                              //       fit: BoxFit.cover,
                                                              //     ),
                                                              //   ),
                                                              // ),

                                                              Stack(children: [
                                                                Container(
                                                                  height: 7.h,
                                                                  // width: 18.w,
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              0.8.h),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(0.8
                                                                              .w),
                                                                  decoration: BoxDecoration(
                                                                      gradient: LinearGradient(colors: [
                                                                        ColorUtils
                                                                            .gradientcolor1,
                                                                        ColorUtils
                                                                            .gradientcolor2,
                                                                      ], stops: [
                                                                        0.1,
                                                                        0.6
                                                                      ]),
                                                                      shape: BoxShape.circle),
                                                                  child:
                                                                      CircleAvatar(
                                                                    backgroundColor:
                                                                        ColorUtils
                                                                            .white,
                                                                    radius: 23,
                                                                    child:
                                                                        CircleAvatar(
                                                                      backgroundColor:
                                                                          ColorUtils
                                                                              .white,
                                                                      radius:
                                                                          21.3,
                                                                      backgroundImage:
                                                                          AssetImage(
                                                                        // ImageUtils.r1
                                                                        model.searchImages[index]
                                                                            [
                                                                            'image'],
                                                                      ),
                                                                    ),
                                                                    // CircleAvatar(
                                                                    //   backgroundColor: ColorUtils.white,
                                                                    //   radius: 21,
                                                                    //   child:
                                                                    //   model.searchImages[index]['image'],
                                                                    //
                                                                    // ),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                    top: 4.5.h,
                                                                    left: 9.w,
                                                                    child:
                                                                        CircleAvatar(
                                                                      radius:
                                                                          2.5.w,
                                                                      backgroundColor:
                                                                          ColorUtils
                                                                              .redColorExpiresIn,
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite,
                                                                        color: ColorUtils
                                                                            .white,
                                                                        size:
                                                                            3.w,
                                                                      ),
                                                                    )),
                                                              ]),

                                                              SizedBox(
                                                                width: 2.w,
                                                              ),
                                                              TextWidget(
                                                                textTitle: model
                                                                        .searches[
                                                                    index]['title'],
                                                                color: ColorUtils
                                                                    .textColor,
                                                                fontFamily:
                                                                    FontUtils
                                                                        .PoppinsMedium,
                                                                fontSize: 1.8.t,
                                                              ),
                                                            ],
                                                          ),
                                                          SvgPicture.asset(
                                                            ImageUtils.x,
                                                            color:
                                                                ColorUtils.grey,
                                                          )
                                                        ],
                                                      ),
                                                      if (index == 1) Divider(),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          TextWidget(
                                            textTitle: Constants.trendingDubai,
                                            color: ColorUtils.textColor,
                                            fontFamily:
                                                FontUtils.PoppinsSemibold,
                                            fontSize: 2.t,
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          ListView.separated(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            itemCount: model.searches.length,
                                            separatorBuilder:
                                                (BuildContext context,
                                                        int index) =>
                                                    Divider(),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // Future.delayed(Duration(seconds: 0), () {
                                                  //   showModalBottomSheet(
                                                  //       isDismissible: false,
                                                  //       shape: RoundedRectangleBorder(
                                                  //         borderRadius: BorderRadius.only(
                                                  //           topLeft: Radius.circular(20),
                                                  //           topRight: Radius.circular(20),
                                                  //         ),
                                                  //       ),
                                                  //       context: context,
                                                  //       builder: (builder) {
                                                  //         return Container(
                                                  //           margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                                                  //           height: 180.h,
                                                  //           child: ResturantDetail(),
                                                  //         );
                                                  //       });
                                                  // });
                                                  model.navigationService
                                                      .navigateTo(
                                                          to: SearchDetails());
                                                },
                                                child: Container(
                                                  padding:
                                                      EdgeInsets.only(top: 1.h),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              // Container(
                                                              //   height: 5.h,
                                                              //   decoration: BoxDecoration(
                                                              //     shape: BoxShape.circle,
                                                              //     border: Border.all(color: ColorUtils.gradientColor),
                                                              //   ),
                                                              //   child: ClipRRect(
                                                              //     borderRadius: BorderRadius.circular(20),
                                                              //     child: Image.asset(model.searches[index]['images'],
                                                              //       fit: BoxFit.cover,
                                                              //     ),
                                                              //   ),
                                                              // ),

                                                              Container(
                                                                height: 7.h,
                                                                // width: 18.w,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            0.8.h),
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(0.8
                                                                            .w),
                                                                decoration:
                                                                    BoxDecoration(
                                                                        gradient: LinearGradient(
                                                                            colors: [
                                                                              ColorUtils.gradientcolor1,
                                                                              ColorUtils.gradientcolor2,
                                                                            ],
                                                                            stops: [
                                                                              0.1,
                                                                              0.6
                                                                            ]),
                                                                        shape: BoxShape
                                                                            .circle),
                                                                child:
                                                                    CircleAvatar(
                                                                  backgroundColor:
                                                                      ColorUtils
                                                                          .white,
                                                                  radius: 23,
                                                                  child:
                                                                      CircleAvatar(
                                                                    backgroundColor:
                                                                        ColorUtils
                                                                            .white,
                                                                    radius:
                                                                        21.9,
                                                                    backgroundImage:
                                                                        AssetImage(model.searchImages1[index]
                                                                            [
                                                                            'image']),
                                                                  ),
                                                                ),
                                                              ),

                                                              SizedBox(
                                                                width: 2.w,
                                                              ),
                                                              TextWidget(
                                                                textTitle: model
                                                                        .searches1[
                                                                    index]['title'],
                                                                color: ColorUtils
                                                                    .textColor,
                                                                fontFamily:
                                                                    FontUtils
                                                                        .PoppinsMedium,
                                                                fontSize: 1.8.t,
                                                              ),
                                                            ],
                                                          ),
                                                          SvgPicture.asset(
                                                            ImageUtils.x,
                                                            color:
                                                                ColorUtils.grey,
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      )
                                   : model.select == 1 ?
                                // Column(
                                //         crossAxisAlignment:
                                //             CrossAxisAlignment.start,
                                //         children: [
                                //           SizedBox(
                                //             height: 41.h,
                                //             child: ListView.builder(
                                //                 shrinkWrap: true,
                                //                 scrollDirection:
                                //                     Axis.horizontal,
                                //                 itemCount: 2,
                                //                 itemBuilder: (context, index) {
                                //                   return ResturantWidget(
                                //                     onTap: () {
                                //                       // Future.delayed(Duration(seconds: 0), () {
                                //                       //   showModalBottomSheet(
                                //                       //       isDismissible: false,
                                //                       //       shape: RoundedRectangleBorder(
                                //                       //         borderRadius: BorderRadius.only(
                                //                       //           topLeft: Radius.circular(20),
                                //                       //           topRight: Radius.circular(20),
                                //                       //         ),
                                //                       //       ),
                                //                       //       context: context,
                                //                       //       builder: (builder) {
                                //                       //         return Container(
                                //                       //           margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                                //                       //           height: 180.h,
                                //                       //           child: ResturantDetail(),
                                //                       //         );
                                //                       //       });
                                //                       // });
                                //                       model.navigationService
                                //                           .navigateTo(
                                //                               to: SearchDetails());
                                //                     },
                                //                     image: ImageUtils.slider,
                                //                     image2: ImageUtils.slider,
                                //                     location: "Wet Deck Dubai",
                                //                   );
                                //                 }),
                                //           ),
                                //           SizedBox(
                                //             height: 2.h,
                                //           ),
                                //           TextWidget(
                                //             textTitle: Constants.result,
                                //             color: ColorUtils.textColor,
                                //             fontSize: 2.t,
                                //             fontFamily:
                                //                 FontUtils.PoppinsSemibold,
                                //           ),
                                //           ListView.builder(
                                //               padding: EdgeInsets.zero,
                                //               itemCount: model.favourite.length,
                                //               physics:
                                //                   NeverScrollableScrollPhysics(),
                                //               shrinkWrap: true,
                                //               itemBuilder: (context, index) {
                                //                 return ResturantList(
                                //                   onTap: () {
                                //                     // Future.delayed(Duration(seconds: 0), () {
                                //                     //   showModalBottomSheet(
                                //                     //       isDismissible: false,
                                //                     //       shape: RoundedRectangleBorder(
                                //                     //         borderRadius: BorderRadius.only(
                                //                     //           topLeft: Radius.circular(20),
                                //                     //           topRight: Radius.circular(20),
                                //                     //         ),
                                //                     //       ),
                                //                     //       context: context,
                                //                     //       builder: (builder) {
                                //                     //         return Container(
                                //                     //           margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                                //                     //           height: 180.h,
                                //                     //           child: ResturantDetail(),
                                //                     //         );
                                //                     //       });
                                //                     // });
                                //                     model.navigationService
                                //                         .navigateTo(
                                //                             to: SearchDetails());
                                //                   },
                                //                   title: model.favourite[index]
                                //                       ['title'],
                                //                   image: model.favourite[index]
                                //                       ['image'],
                                //                 );
                                //               }),
                                //         ],
                                //       ) :

                                /// Food % Drinks
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 1.5.w),
                                        child: Text("Recommended for You",
                                        style: TextStyle(
                                          fontFamily: FontUtils.PoppinsSemibold
                                        ),
                                        )),
                                    SizedBox(height: 1.h,),
                                    SizedBox(
                                      height: 41.h,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection:
                                          Axis.horizontal,
                                          itemCount: 2,
                                          itemBuilder: (context, index) {
                                            return
                                            //   ResturantWidget(
                                            //   onTap: () {
                                            //     // Future.delayed(Duration(seconds: 0), () {
                                            //     //   showModalBottomSheet(
                                            //     //       isDismissible: false,
                                            //     //       shape: RoundedRectangleBorder(
                                            //     //         borderRadius: BorderRadius.only(
                                            //     //           topLeft: Radius.circular(20),
                                            //     //           topRight: Radius.circular(20),
                                            //     //         ),
                                            //     //       ),
                                            //     //       context: context,
                                            //     //       builder: (builder) {
                                            //     //         return Container(
                                            //     //           margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                                            //     //           height: 180.h,
                                            //     //           child: ResturantDetail(),
                                            //     //         );
                                            //     //       });
                                            //     // });
                                            //     model.navigationService
                                            //         .navigateTo(
                                            //         to: SearchDetails());
                                            //   },
                                            //   image: ImageUtils.slider,
                                            //   image2: ImageUtils.slider,
                                            //   location: "Wet Deck Dubai",
                                            // );

                                              FavoriteResturantWidgetOne(
                                                  onTap: () {
                                                    // Future.delayed(
                                                    //     Duration(seconds: 0), () {
                                                    //   showModalBottomSheet(
                                                    //       isDismissible: false,
                                                    //       shape:
                                                    //           RoundedRectangleBorder(
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
                                                    //           margin: EdgeInsets
                                                    //               .symmetric(
                                                    //                   horizontal: 5.w,
                                                    //                   vertical: 2.h),
                                                    //           height: 180.h,
                                                    //           child:
                                                    //               ResturantDetail(),
                                                    //         );
                                                    //       });
                                                    // });
                                                    model.navigationService.navigateTo(to: SearchDetails());
                                                  },
                                                  image: model.favoriteresturent[index]['title'],
                                                  addressText: model.favoriteresturentAddress[index]['title'],
                                                  text:model.favoriteresturentText[index]['title']


                                              );

                                          }),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    TextWidget(
                                      textTitle: Constants.result,
                                      color: ColorUtils.textColor,
                                      fontSize: 2.t,
                                      fontFamily:
                                      FontUtils.PoppinsSemibold,
                                    ),
                                    ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: model.favourite.length,
                                        physics:
                                        NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return
                                          //   ResturantList(
                                          //   onTap: () {
                                          //     // Future.delayed(Duration(seconds: 0), () {
                                          //     //   showModalBottomSheet(
                                          //     //       isDismissible: false,
                                          //     //       shape: RoundedRectangleBorder(
                                          //     //         borderRadius: BorderRadius.only(
                                          //     //           topLeft: Radius.circular(20),
                                          //     //           topRight: Radius.circular(20),
                                          //     //         ),
                                          //     //       ),
                                          //     //       context: context,
                                          //     //       builder: (builder) {
                                          //     //         return Container(
                                          //     //           margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                                          //     //           height: 180.h,
                                          //     //           child: ResturantDetail(),
                                          //     //         );
                                          //     //       });
                                          //     // });
                                          //     model.navigationService
                                          //         .navigateTo(
                                          //         to: SearchDetails());
                                          //   },
                                          //   title: model.favourite[index]
                                          //   ['title'],
                                          //   image: model.favourite[index]
                                          //   ['image'],
                                          // );

                                            OffersListTwo(
                                              title:model.favourite[index]['title'],
                                              image: model.favourite[index]['image'],
                                              Icon: model.favouriteIcon[index]['icon'],
                                            );

                                        }),
                                  ],
                                ) :
                                model.select == 2 ?

                                    ///Entertainment
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(left: 1.5.w),
                                        child: Text("Recommended for You",
                                          style: TextStyle(
                                              fontFamily: FontUtils.PoppinsSemibold
                                          ),
                                        )),
                                    SizedBox(height: 1.h,),
                                    SizedBox(
                                      height: 41.h,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection:
                                          Axis.horizontal,
                                          itemCount: 2,
                                          itemBuilder: (context, index) {
                                            return
                                              //   ResturantWidget(
                                              //   onTap: () {
                                              //     // Future.delayed(Duration(seconds: 0), () {
                                              //     //   showModalBottomSheet(
                                              //     //       isDismissible: false,
                                              //     //       shape: RoundedRectangleBorder(
                                              //     //         borderRadius: BorderRadius.only(
                                              //     //           topLeft: Radius.circular(20),
                                              //     //           topRight: Radius.circular(20),
                                              //     //         ),
                                              //     //       ),
                                              //     //       context: context,
                                              //     //       builder: (builder) {
                                              //     //         return Container(
                                              //     //           margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                                              //     //           height: 180.h,
                                              //     //           child: ResturantDetail(),
                                              //     //         );
                                              //     //       });
                                              //     // });
                                              //     model.navigationService
                                              //         .navigateTo(
                                              //         to: SearchDetails());
                                              //   },
                                              //   image: ImageUtils.slider,
                                              //   image2: ImageUtils.slider,
                                              //   location: "Wet Deck Dubai",
                                              // );

                                              FavoriteResturantWidgetOne(
                                                  onTap: () {
                                                    // Future.delayed(
                                                    //     Duration(seconds: 0), () {
                                                    //   showModalBottomSheet(
                                                    //       isDismissible: false,
                                                    //       shape:
                                                    //           RoundedRectangleBorder(
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
                                                    //           margin: EdgeInsets
                                                    //               .symmetric(
                                                    //                   horizontal: 5.w,
                                                    //                   vertical: 2.h),
                                                    //           height: 180.h,
                                                    //           child:
                                                    //               ResturantDetail(),
                                                    //         );
                                                    //       });
                                                    // });
                                                    model.navigationService.navigateTo(to: SearchDetails());
                                                  },
                                                  image: model.favoriteresturent[index]['title'],
                                                  addressText: model.favoriteresturentAddress[index]['title'],
                                                  text:model.favoriteresturentText[index]['title']


                                              );

                                          }),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    TextWidget(
                                      textTitle: Constants.result,
                                      color: ColorUtils.textColor,
                                      fontSize: 2.t,
                                      fontFamily:
                                      FontUtils.PoppinsSemibold,
                                    ),
                                    ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: model.favourite.length,
                                        physics:
                                        NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return
                                            //   ResturantList(
                                            //   onTap: () {
                                            //     // Future.delayed(Duration(seconds: 0), () {
                                            //     //   showModalBottomSheet(
                                            //     //       isDismissible: false,
                                            //     //       shape: RoundedRectangleBorder(
                                            //     //         borderRadius: BorderRadius.only(
                                            //     //           topLeft: Radius.circular(20),
                                            //     //           topRight: Radius.circular(20),
                                            //     //         ),
                                            //     //       ),
                                            //     //       context: context,
                                            //     //       builder: (builder) {
                                            //     //         return Container(
                                            //     //           margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                                            //     //           height: 180.h,
                                            //     //           child: ResturantDetail(),
                                            //     //         );
                                            //     //       });
                                            //     // });
                                            //     model.navigationService
                                            //         .navigateTo(
                                            //         to: SearchDetails());
                                            //   },
                                            //   title: model.favourite[index]
                                            //   ['title'],
                                            //   image: model.favourite[index]
                                            //   ['image'],
                                            // );

                                            OffersListTwo(
                                              title:model.favourite[index]['title'],
                                              image: model.favourite[index]['image'],
                                              Icon: model.favouriteIcon[index]['icon'],
                                            );

                                        }),
                                  ],
                                ) :


                                /// Fashion And Retail
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 2.h,),
                                    Container(
                                      height: 5.h,
                                      width: double.infinity,
                                      child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          itemCount: model.fashionandRetail.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              // mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    model.resturantselect1 = index;
                                                    model.notifyListeners();
                                                    // if(index == 3){
                                                    //   model.navigationService.navigateTo(to: AllReviews());
                                                    // }
                                                  },
                                                  child: Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                                                      margin: EdgeInsets.only(right: 3.w),
                                                      height: 5.h,
                                                      // margin: EdgeInsets.only(
                                                      //     left: 5.w),
                                                      decoration:
                                                      BoxDecoration(
                                                          gradient: LinearGradient(
                                                              colors: [
                                                                model.resturantselect1 == index
                                                                    ? ColorUtils.gradientcolor1
                                                                    : ColorUtils.white,
                                                                model.resturantselect1 == index
                                                                    ? ColorUtils.gradientcolor2
                                                                    : ColorUtils.white,
                                                              ],
                                                              begin: Alignment.bottomLeft,
                                                              end: Alignment.topRight,
                                                              stops: [0.1, 0.6]),
                                                          borderRadius: BorderRadius.circular(20),
                                                          border: Border.all(
                                                            color: model.resturantselect1 == index
                                                                ? ColorUtils.white
                                                                : ColorUtils.grey2,
                                                          )
                                                      ),
                                                      child: Center(
                                                        child: Text(model.fashionandRetail[index]["tab"],
                                                            style:
                                                            TextStyle(
                                                              fontSize: 2.t,
                                                              fontFamily: model.resturantselect1 == index ?
                                                              FontUtils.PoppinsMedium
                                                                  : FontUtils.PoppinsRegular,
                                                              color: model.resturantselect1 == index
                                                                  ? ColorUtils.white
                                                                  : ColorUtils.grey,
                                                            )),
                                                      )),
                                                ),

                                                // SizedBox(width: 2.w,)
                                              ],
                                            );
                                          }),
                                    ),
                                    SizedBox(height: 3.h,),
                                    // Padding(
                                    //     padding: EdgeInsets.only(left: 1.5.w),
                                    //     child: Text("Recommended for You",
                                    //       style: TextStyle(
                                    //           fontFamily: FontUtils.PoppinsSemibold
                                    //       ),
                                    //     )),
                                    // SizedBox(height: 1.h,),
                                    // SizedBox(
                                    //   height: 41.h,
                                    //   child: ListView.builder(
                                    //       shrinkWrap: true,
                                    //       scrollDirection:
                                    //       Axis.horizontal,
                                    //       itemCount: 2,
                                    //       itemBuilder: (context, index) {
                                    //         return
                                    //           //   ResturantWidget(
                                    //           //   onTap: () {
                                    //           //     // Future.delayed(Duration(seconds: 0), () {
                                    //           //     //   showModalBottomSheet(
                                    //           //     //       isDismissible: false,
                                    //           //     //       shape: RoundedRectangleBorder(
                                    //           //     //         borderRadius: BorderRadius.only(
                                    //           //     //           topLeft: Radius.circular(20),
                                    //           //     //           topRight: Radius.circular(20),
                                    //           //     //         ),
                                    //           //     //       ),
                                    //           //     //       context: context,
                                    //           //     //       builder: (builder) {
                                    //           //     //         return Container(
                                    //           //     //           margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                                    //           //     //           height: 180.h,
                                    //           //     //           child: ResturantDetail(),
                                    //           //     //         );
                                    //           //     //       });
                                    //           //     // });
                                    //           //     model.navigationService
                                    //           //         .navigateTo(
                                    //           //         to: SearchDetails());
                                    //           //   },
                                    //           //   image: ImageUtils.slider,
                                    //           //   image2: ImageUtils.slider,
                                    //           //   location: "Wet Deck Dubai",
                                    //           // );
                                    //
                                    //           FavoriteResturantWidgetOne(
                                    //               onTap: () {
                                    //                 // Future.delayed(
                                    //                 //     Duration(seconds: 0), () {
                                    //                 //   showModalBottomSheet(
                                    //                 //       isDismissible: false,
                                    //                 //       shape:
                                    //                 //           RoundedRectangleBorder(
                                    //                 //         borderRadius:
                                    //                 //             BorderRadius.only(
                                    //                 //           topLeft:
                                    //                 //               Radius.circular(20),
                                    //                 //           topRight:
                                    //                 //               Radius.circular(20),
                                    //                 //         ),
                                    //                 //       ),
                                    //                 //       context: context,
                                    //                 //       builder: (builder) {
                                    //                 //         return Container(
                                    //                 //           margin: EdgeInsets
                                    //                 //               .symmetric(
                                    //                 //                   horizontal: 5.w,
                                    //                 //                   vertical: 2.h),
                                    //                 //           height: 180.h,
                                    //                 //           child:
                                    //                 //               ResturantDetail(),
                                    //                 //         );
                                    //                 //       });
                                    //                 // });
                                    //                 model.navigationService.navigateTo(to: SearchDetails());
                                    //               },
                                    //               image: model.favoriteresturent[index]['title'],
                                    //               addressText: model.favoriteresturentAddress[index]['title'],
                                    //               text:model.favoriteresturentText[index]['title']
                                    //
                                    //
                                    //           );
                                    //
                                    //       }),
                                    // ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    TextWidget(
                                      textTitle: Constants.fashionText,
                                      color: ColorUtils.textColor,
                                      fontSize: 2.t,
                                      fontFamily:
                                      FontUtils.PoppinsSemibold,
                                    ),
                                    SizedBox(height: 1.h,),
                                    TextWidget(
                                      textTitle: Constants.resultText,
                                      color: ColorUtils.grey.withOpacity(0.7),
                                      fontSize: 1.6.t,
                                      fontFamily:
                                      FontUtils.PoppinsSemibold,
                                    ),
                                    ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: model.favourite.length,
                                        physics:
                                        NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return
                                            //   ResturantList(
                                            //   onTap: () {
                                            //     // Future.delayed(Duration(seconds: 0), () {
                                            //     //   showModalBottomSheet(
                                            //     //       isDismissible: false,
                                            //     //       shape: RoundedRectangleBorder(
                                            //     //         borderRadius: BorderRadius.only(
                                            //     //           topLeft: Radius.circular(20),
                                            //     //           topRight: Radius.circular(20),
                                            //     //         ),
                                            //     //       ),
                                            //     //       context: context,
                                            //     //       builder: (builder) {
                                            //     //         return Container(
                                            //     //           margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                                            //     //           height: 180.h,
                                            //     //           child: ResturantDetail(),
                                            //     //         );
                                            //     //       });
                                            //     // });
                                            //     model.navigationService
                                            //         .navigateTo(
                                            //         to: SearchDetails());
                                            //   },
                                            //   title: model.favourite[index]
                                            //   ['title'],
                                            //   image: model.favourite[index]
                                            //   ['image'],
                                            // );

                                            OffersListTwo(
                                              title:model.favourite[index]['title'],
                                              image: model.favourite[index]['image'],
                                              Icon: model.favouriteIcon[index]['icon'],
                                            );

                                        }),
                                  ],
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
