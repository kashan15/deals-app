import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/resturant_detail.dart';
import 'package:deals_app/widgets/Resturant_vertical.dart';
import 'package:deals_app/widgets/buy_one_get_one.dart';
import 'package:deals_app/widgets/container_shadow.dart';
import 'package:deals_app/widgets/deals_all.dart';
import 'package:deals_app/widgets/expire_deals.dart';
import 'package:deals_app/widgets/newContainer_shadow.dart';
import 'package:deals_app/widgets/percent_off.dart';
import 'package:deals_app/widgets/rating_widget.dart';
import 'package:deals_app/widgets/resturant_widget.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../utils/theme.dart';

class DiscountOffer extends StatefulWidget {
  @override
  State<DiscountOffer> createState() => _DiscountOfferState();
}

class _DiscountOfferState extends State<DiscountOffer> {
  @override
  bool likebutton = true;

  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
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
                      // height: 100.h,
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
                              children: [
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: ColorUtils.textColor,
                                      ),
                                    ),
                                    TextWidget(
                                      textTitle: Constants.discountOffer,
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
                                SizedBox(
                                  height: 2.h,
                                ),
                                ExpireDeals(
                                  title: Constants.hotOffer,
                                  expireDate: Constants.expireDate,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Future.delayed(Duration(seconds: 0), () {
                                    //   showModalBottomSheet(
                                    //       isDismissible: true,
                                    //       shape: RoundedRectangleBorder(
                                    //         borderRadius: BorderRadius.only(
                                    //           topLeft: Radius.circular(20),
                                    //           topRight: Radius.circular(20),
                                    //         ),
                                    //       ),
                                    //       context: context,
                                    //       builder: (builder) {
                                    //         return Container(
                                    //           height: 100.h,
                                    //           width: 100.w,
                                    //           // color: Colors.blue,
                                    //           // margin: EdgeInsets.symmetric(
                                    //           //     // horizontal: 5.w,
                                    //           //     vertical: 2.h),
                                    //           child: SingleChildScrollView(
                                    //             child: Column(
                                    //               children: [
                                    //                 Container(
                                    //                   decoration: BoxDecoration(
                                    //                       color: ColorUtils.grey2,
                                    //                       borderRadius:
                                    //                           BorderRadius.only(
                                    //                               topRight: Radius
                                    //                                   .circular(
                                    //                                       20.0),
                                    //                               topLeft: Radius
                                    //                                   .circular(
                                    //                                       20.0))),
                                    //
                                    //                   // height: 20.0,
                                    //                   width: double.infinity,
                                    //                   // color: Colors.blue,
                                    //                   child: Row(
                                    //                     children: [
                                    //                       SizedBox(
                                    //                         width: 2.w,
                                    //                       ),
                                    //                       Container(
                                    //                         margin: EdgeInsets
                                    //                             .symmetric(
                                    //                                 vertical:
                                    //                                     2.h),
                                    //
                                    //                         decoration: BoxDecoration(
                                    //                             color: Colors
                                    //                                 .greenAccent,
                                    //                             borderRadius:
                                    //                                 BorderRadius
                                    //                                     .circular(
                                    //                                         5.0)),
                                    //                         height: 5.h,
                                    //                         width: 10.w,
                                    //
                                    //                         // color: Colors.red,
                                    //                       ),
                                    //                       SizedBox(
                                    //                         width: 2.w,
                                    //                       ),
                                    //                       Container(
                                    //                         child: Column(
                                    //                           children: [
                                    //                             Container(
                                    //                                 // color: Colors.red,
                                    //                                 width: 40.w,
                                    //                                 child: Text(
                                    //                                   "Title",
                                    //                                   style: TextStyle(
                                    //                                       fontSize:
                                    //                                           2.t,
                                    //                                       fontWeight:
                                    //                                           FontWeight.w500),
                                    //                                 )),
                                    //                             Container(
                                    //                                 width: 40.w,
                                    //                                 child: Row(
                                    //                                   mainAxisAlignment:
                                    //                                       MainAxisAlignment
                                    //                                           .spaceBetween,
                                    //                                   children: [
                                    //                                     Text(
                                    //                                       "Subtitle",
                                    //                                       style: TextStyle(
                                    //                                           fontWeight:
                                    //                                               FontWeight.w400,
                                    //                                           fontSize: 1.5.t),
                                    //                                     ),
                                    //                                     Row(
                                    //                                       children: [
                                    //                                         Text(
                                    //                                           "Options",
                                    //                                           style: TextStyle(
                                    //                                               fontWeight:
                                    //                                                   FontWeight.w400,
                                    //                                               fontSize: 1.5.t,
                                    //                                               color: ColorUtils.blue),
                                    //                                         ),
                                    //
                                    //                                         SizedBox(
                                    //                                           width: 1.w,
                                    //                                         ),
                                    //                                         Container(
                                    //                                           margin: EdgeInsets.only(right: 5.w),
                                    //                                           decoration: BoxDecoration(
                                    //                                               border: Border.all(
                                    //                                                   color: Colors.blue,
                                    //                                                   width: 1.5
                                    //                                               )
                                    //                                           ),
                                    //                                           height: 12.0,
                                    //                                           width: 8.0,
                                    //                                           // color: Colors.blue,
                                    //                                         ),
                                    //                                       ],
                                    //                                     ),
                                    //                                   ],
                                    //                                 )),
                                    //                           ],
                                    //                         ),
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //
                                    //                 Container(
                                    //                   height: 1,
                                    //                   width: double.infinity,
                                    //                   color: ColorUtils.grey,
                                    //                 ),
                                    //                 Container(
                                    //                   height: 15.h,
                                    //                   // width: 100.w,
                                    //                   child: ListView.builder(
                                    //                     physics: BouncingScrollPhysics(),
                                    //                       scrollDirection:
                                    //                           Axis.horizontal,
                                    //                       itemCount: 5,
                                    //                       itemBuilder:
                                    //                           (BuildContext
                                    //                                   context,
                                    //                               int index) {
                                    //                         return Column(
                                    //                           children: [
                                    //                             Container(
                                    //                               margin: EdgeInsets.symmetric(horizontal: 3.w),
                                    //                               height: 10.h,
                                    //                               width: 20.w,
                                    //                               // color: Colors.blue,
                                    //                               child: CircleAvatar(
                                    //                                 backgroundColor:
                                    //                                     Colors.green,
                                    //                               ),
                                    //                             ),
                                    //                             Text("Sandy Wilder",
                                    //                             style: TextStyle(
                                    //                               fontSize: 1.2.t
                                    //                             ),)
                                    //                           ],
                                    //                         );
                                    //                       }),
                                    //                 ),
                                    //
                                    //                 Container(
                                    //                   height: 1,
                                    //                   width: double.infinity,
                                    //                   color: ColorUtils.grey2,
                                    //                 ),
                                    //
                                    //                 SizedBox(
                                    //                   height: 2.h,
                                    //                 ),
                                    //
                                    //                 Container(
                                    //                   height: 15.h,
                                    //                   // width: 100.w,
                                    //                   child: ListView.builder(
                                    //                       physics: BouncingScrollPhysics(),
                                    //                       scrollDirection:
                                    //                       Axis.horizontal,
                                    //                       itemCount: 5,
                                    //                       itemBuilder:
                                    //                           (BuildContext
                                    //                       context,
                                    //                           int index) {
                                    //                         return Column(
                                    //                           children: [
                                    //                             Container(
                                    //                               margin: EdgeInsets.symmetric(horizontal: 3.w),
                                    //                               height: 10.h,
                                    //                               width: 20.w,
                                    //                               // color: Colors.blue,
                                    //                               child: CircleAvatar(
                                    //                                 backgroundColor:
                                    //                                 Colors.green,
                                    //                               ),
                                    //                             ),
                                    //                             Text("AirDrop",
                                    //                               style: TextStyle(
                                    //                                   fontSize: 1.2.t
                                    //                               ),)
                                    //                           ],
                                    //                         );
                                    //                       }),
                                    //                 ),
                                    //                 Container(
                                    //                   height: 6.h,
                                    //                   width: double.infinity,
                                    //                   margin: EdgeInsets.symmetric(horizontal: 3.w),
                                    //                   decoration: BoxDecoration(
                                    //                       color: ColorUtils.grey2,
                                    //                       borderRadius: BorderRadius.circular(10)),
                                    //                   child: Column(
                                    //                     children: [
                                    //                       Container(
                                    //                         width:double.infinity,
                                    //                         margin:
                                    //                         EdgeInsets.only(left: 5.w, top: 2.h),
                                    //                         child: Row(
                                    //                           crossAxisAlignment: CrossAxisAlignment.center,
                                    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                           children: [
                                    //                             Text("Copy",
                                    //                             style: TextStyle(
                                    //                               fontSize: 1.5.t,
                                    //                               fontWeight: FontWeight.w500
                                    //                             ),),
                                    //                             Container(
                                    //                               margin: EdgeInsets.only(right: 5.w),
                                    //                               decoration: BoxDecoration(
                                    //                                 border: Border.all(
                                    //                                   color: Colors.black,
                                    //                                   width: 1.5
                                    //                                 )
                                    //                               ),
                                    //                               height: 15.0,
                                    //                               width: 8.0,
                                    //                               // color: Colors.blue,
                                    //                             ),
                                    //                           ],
                                    //                         )
                                    //                       ),
                                    //                       SizedBox(height: 1.h),
                                    //
                                    //
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //
                                    //                 SizedBox(
                                    //                   height: 1.h,
                                    //                 ),
                                    //
                                    //                 Container(
                                    //                   height: 6.h,
                                    //                   width: double.infinity,
                                    //                   margin: EdgeInsets.symmetric(horizontal: 3.w),
                                    //                   decoration: BoxDecoration(
                                    //                       color: ColorUtils.grey2,
                                    //                       borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),
                                    //                       topRight:Radius.circular(10.0))),
                                    //                   child: Column(
                                    //                     children: [
                                    //                       Container(
                                    //                           width:double.infinity,
                                    //                           margin:
                                    //                           EdgeInsets.only(left: 5.w, top: 2.h),
                                    //                           child: Row(
                                    //                             crossAxisAlignment: CrossAxisAlignment.center,
                                    //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                             children: [
                                    //                               Text("Add To Reading List ",
                                    //                                 style: TextStyle(
                                    //                                     fontSize: 1.5.t,
                                    //                                     fontWeight: FontWeight.w500
                                    //                                 ),),
                                    //                               Container(
                                    //                                 margin: EdgeInsets.only(right: 5.w),
                                    //                                 decoration: BoxDecoration(
                                    //                                     border: Border.all(
                                    //                                         color: Colors.black,
                                    //                                         width: 1.5
                                    //                                     )
                                    //                                 ),
                                    //                                 height: 15.0,
                                    //                                 width: 8.0,
                                    //                                 // color: Colors.blue,
                                    //                               ),
                                    //                             ],
                                    //                           )
                                    //                       ),
                                    //                       SizedBox(height: 1.h),
                                    //
                                    //
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //                 Container(
                                    //                   height: 1.0,
                                    //                     margin: EdgeInsets.symmetric(horizontal: 3.w),
                                    //                   width: double.infinity,
                                    //                   color: Colors.grey[300]
                                    //                 ),
                                    //                 Container(
                                    //                   height: 6.h,
                                    //                   width: double.infinity,
                                    //                   margin: EdgeInsets.symmetric(horizontal: 3.w),
                                    //                   decoration: BoxDecoration(
                                    //                       color: ColorUtils.grey2,
                                    //                       borderRadius: BorderRadius.circular(0)),
                                    //                   child: Column(
                                    //                     children: [
                                    //                       Container(
                                    //                           width:double.infinity,
                                    //                           margin:
                                    //                           EdgeInsets.only(left: 5.w, top: 2.h),
                                    //                           child: Row(
                                    //                             crossAxisAlignment: CrossAxisAlignment.center,
                                    //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                             children: [
                                    //                               Text("Add To Bookmark ",
                                    //                                 style: TextStyle(
                                    //                                     fontSize: 1.5.t,
                                    //                                     fontWeight: FontWeight.w500
                                    //                                 ),),
                                    //                               Container(
                                    //                                 margin: EdgeInsets.only(right: 5.w),
                                    //                                 decoration: BoxDecoration(
                                    //                                     border: Border.all(
                                    //                                         color: Colors.black,
                                    //                                         width: 1.5
                                    //                                     )
                                    //                                 ),
                                    //                                 height: 15.0,
                                    //                                 width: 8.0,
                                    //                                 // color: Colors.blue,
                                    //                               ),
                                    //                             ],
                                    //                           )
                                    //                       ),
                                    //                       SizedBox(height: 1.h),
                                    //
                                    //
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //                 Container(
                                    //                     height: 1.0,
                                    //                     margin: EdgeInsets.symmetric(horizontal: 3.w),
                                    //                     width: double.infinity,
                                    //                     color: Colors.grey[300]
                                    //                 ),
                                    //                 Container(
                                    //                   height: 6.h,
                                    //                   width: double.infinity,
                                    //                   margin: EdgeInsets.symmetric(horizontal: 3.w),
                                    //                   decoration: BoxDecoration(
                                    //                       color: ColorUtils.grey2,
                                    //                       borderRadius: BorderRadius.circular(0)),
                                    //                   child: Column(
                                    //                     children: [
                                    //                       Container(
                                    //                           width:double.infinity,
                                    //                           margin:
                                    //                           EdgeInsets.only(left: 5.w, top: 2.h),
                                    //                           child: Row(
                                    //                             crossAxisAlignment: CrossAxisAlignment.center,
                                    //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                             children: [
                                    //                               Text("Add To Favorites",
                                    //                                 style: TextStyle(
                                    //                                     fontSize: 1.5.t,
                                    //                                     fontWeight: FontWeight.w500
                                    //                                 ),),
                                    //                               Container(
                                    //                                 margin: EdgeInsets.only(right: 5.w),
                                    //                                 decoration: BoxDecoration(
                                    //                                     border: Border.all(
                                    //                                         color: Colors.black,
                                    //                                         width: 1.5
                                    //                                     )
                                    //                                 ),
                                    //                                 height: 15.0,
                                    //                                 width: 8.0,
                                    //                                 // color: Colors.blue,
                                    //                               ),
                                    //                             ],
                                    //                           )
                                    //                       ),
                                    //                       SizedBox(height: 1.h),
                                    //
                                    //
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //                 Container(
                                    //                     height: 1.0,
                                    //                     margin: EdgeInsets.symmetric(horizontal: 3.w),
                                    //                     width: double.infinity,
                                    //                     color: Colors.grey[300]
                                    //                 ),
                                    //                 Container(
                                    //                   height: 6.h,
                                    //                   width: double.infinity,
                                    //                   margin: EdgeInsets.symmetric(horizontal: 3.w),
                                    //                   decoration: BoxDecoration(
                                    //                       color: ColorUtils.grey2,
                                    //                       borderRadius: BorderRadius.circular(0)),
                                    //                   child: Column(
                                    //                     children: [
                                    //                       Container(
                                    //                           width:double.infinity,
                                    //                           margin:
                                    //                           EdgeInsets.only(left: 5.w, top: 2.h),
                                    //                           child: Row(
                                    //                             crossAxisAlignment: CrossAxisAlignment.center,
                                    //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                             children: [
                                    //                               Text("Find on Page",
                                    //                                 style: TextStyle(
                                    //                                     fontSize: 1.5.t,
                                    //                                     fontWeight: FontWeight.w500
                                    //                                 ),),
                                    //                               Container(
                                    //                                 margin: EdgeInsets.only(right: 5.w),
                                    //                                 decoration: BoxDecoration(
                                    //                                     border: Border.all(
                                    //                                         color: Colors.black,
                                    //                                         width: 1.5
                                    //                                     )
                                    //                                 ),
                                    //                                 height: 15.0,
                                    //                                 width: 8.0,
                                    //                                 // color: Colors.blue,
                                    //                               ),
                                    //                             ],
                                    //                           )
                                    //                       ),
                                    //                       SizedBox(height: 1.h),
                                    //
                                    //
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //                 Container(
                                    //                     height: 1.0,
                                    //                     margin: EdgeInsets.symmetric(horizontal: 3.w),
                                    //                     width: double.infinity,
                                    //                     color: Colors.grey[300]
                                    //                 ),
                                    //                 Container(
                                    //                   height: 6.h,
                                    //                   width: double.infinity,
                                    //                   margin: EdgeInsets.symmetric(horizontal: 3.w),
                                    //                   decoration: BoxDecoration(
                                    //                       color: ColorUtils.grey2,
                                    //                       borderRadius: BorderRadius.only(
                                    //                         bottomLeft: Radius.circular(10.0),
                                    //                         bottomRight: Radius.circular(10.0)
                                    //                       )),
                                    //                   child: Column(
                                    //                     children: [
                                    //                       Container(
                                    //                           width:double.infinity,
                                    //                           margin:
                                    //                           EdgeInsets.only(left: 5.w, top: 2.h),
                                    //                           child: Row(
                                    //                             crossAxisAlignment: CrossAxisAlignment.center,
                                    //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                             children: [
                                    //                               Text("Add To Home Screen",
                                    //                                 style: TextStyle(
                                    //                                     fontSize: 1.5.t,
                                    //                                     fontWeight: FontWeight.w500
                                    //                                 ),),
                                    //                               Container(
                                    //                                 margin: EdgeInsets.only(right: 5.w),
                                    //                                 decoration: BoxDecoration(
                                    //                                     border: Border.all(
                                    //                                         color: Colors.black,
                                    //                                         width: 1.5
                                    //                                     )
                                    //                                 ),
                                    //                                 height: 15.0,
                                    //                                 width: 8.0,
                                    //                                 // color: Colors.blue,
                                    //                               ),
                                    //                             ],
                                    //                           )
                                    //                       ),
                                    //                       SizedBox(height: 1.h),
                                    //
                                    //
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //
                                    //                 SizedBox(
                                    //                   height: 1.h,
                                    //                 ),
                                    //
                                    //                 Container(
                                    //                   height: 6.h,
                                    //                   width: double.infinity,
                                    //                   margin: EdgeInsets.symmetric(horizontal: 3.w),
                                    //                   decoration: BoxDecoration(
                                    //                       color: ColorUtils.grey2,
                                    //                       borderRadius: BorderRadius.only(
                                    //                         topLeft: Radius.circular(10.0),
                                    //                         topRight: Radius.circular(10.0)
                                    //                       )),
                                    //                   child: Column(
                                    //                     children: [
                                    //                       Container(
                                    //                           width:double.infinity,
                                    //                           margin:
                                    //                           EdgeInsets.only(left: 5.w, top: 2.h),
                                    //                           child: Row(
                                    //                             crossAxisAlignment: CrossAxisAlignment.center,
                                    //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                             children: [
                                    //                               Text("Markup",
                                    //                                 style: TextStyle(
                                    //                                     fontSize: 1.5.t,
                                    //                                     fontWeight: FontWeight.w500
                                    //                                 ),),
                                    //                               Container(
                                    //                                 margin: EdgeInsets.only(right: 5.w),
                                    //                                 decoration: BoxDecoration(
                                    //                                     border: Border.all(
                                    //                                         color: Colors.black,
                                    //                                         width: 1.5
                                    //                                     )
                                    //                                 ),
                                    //                                 height: 15.0,
                                    //                                 width: 8.0,
                                    //                                 // color: Colors.blue,
                                    //                               ),
                                    //                             ],
                                    //                           )
                                    //                       ),
                                    //                       SizedBox(height: 1.h),
                                    //
                                    //
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //                 Container(
                                    //                     height: 1.0,
                                    //                     margin: EdgeInsets.symmetric(horizontal: 3.w),
                                    //                     width: double.infinity,
                                    //                     color: Colors.grey[300]
                                    //                 ),
                                    //                 Container(
                                    //                   height: 6.h,
                                    //                   width: double.infinity,
                                    //                   margin: EdgeInsets.symmetric(horizontal: 3.w),
                                    //                   decoration: BoxDecoration(
                                    //                       color: ColorUtils.grey2,
                                    //                       borderRadius: BorderRadius.only(
                                    //                         bottomRight: Radius.circular(10.0),
                                    //                         bottomLeft: Radius.circular(10.0)
                                    //                       )),
                                    //                   child: Column(
                                    //                     children: [
                                    //                       Container(
                                    //                           width:double.infinity,
                                    //                           margin:
                                    //                           EdgeInsets.only(left: 5.w, top: 2.h),
                                    //                           child: Row(
                                    //                             crossAxisAlignment: CrossAxisAlignment.center,
                                    //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                             children: [
                                    //                               Text("Print",
                                    //                                 style: TextStyle(
                                    //                                     fontSize: 1.5.t,
                                    //                                     fontWeight: FontWeight.w500
                                    //                                 ),),
                                    //                               Container(
                                    //                                 margin: EdgeInsets.only(right: 5.w),
                                    //                                 decoration: BoxDecoration(
                                    //                                     border: Border.all(
                                    //                                         color: Colors.black,
                                    //                                         width: 1.5
                                    //                                     )
                                    //                                 ),
                                    //                                 height: 15.0,
                                    //                                 width: 8.0,
                                    //                                 // color: Colors.blue,
                                    //                               ),
                                    //                             ],
                                    //                           )
                                    //                       ),
                                    //                       SizedBox(height: 1.h),
                                    //
                                    //
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //
                                    //                 SizedBox(
                                    //                   height: 2.h,
                                    //                 ),
                                    //
                                    //                 Container(
                                    //                   margin: EdgeInsets.symmetric(horizontal: 5.w),
                                    //                   width: double.infinity,
                                    //                   child: Text("Edit Action..",
                                    //                   style: TextStyle(
                                    //                     fontSize: 1.5.t,
                                    //                     color: ColorUtils.blue
                                    //                   ),),
                                    //                 ),
                                    //
                                    //                 SizedBox(
                                    //                   height: 2.h,
                                    //                 ),
                                    //
                                    //               ],
                                    //             ),
                                    //           ),
                                    //         );
                                    //       });
                                    // });
                                   },
                                  child: SizedBox(
                                    height: 43.h,
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 2,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return newContainerShadow(
                                              margin: EdgeInsets.only(
                                                  right: 3.w, bottom: 2.h),
                                              padding: EdgeInsets.zero,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.asset(
                                                      model.ramdanOffer[index]
                                                          ['title'],
                                                      height: 27.h,
                                                      width: 61.w,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(3.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            SizedBox(width: 1.w,),
                                                            TextWidget(
                                                              textTitle:
                                                                  model.ramdanOfferText[
                                                                          index]
                                                                      ['title'],
                                                              color: ColorUtils
                                                                  .textColor,
                                                              fontFamily: FontUtils
                                                                  .PoppinsSemibold,
                                                              fontSize: 2.t,
                                                            ),
                                                            SizedBox(
                                                              width: 15.w,
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  likebutton = !likebutton;
                                                                });
                                                              },
                                                              child:
                                                                  CircleAvatar(
                                                                      radius:
                                                                          3.5.w,
                                                                      backgroundColor:
                                                                          ColorUtils.white,
                                                                      child: likebutton
                                                                          ? Icon(
                                                                              Icons.favorite_outline,
                                                                              color: ColorUtils.black,
                                                                              size: 4.5.w,
                                                                            )
                                                                          : Icon(
                                                                              Icons.favorite,
                                                                              color: ColorUtils.redColorExpiresIn,
                                                                              size: 4.5.w,
                                                                            )),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(height: 0.5.h,),
                                                        Row(
                                                          children: [
                                                            SizedBox(width: 0.5.w,),
                                                            RatingWidget(
                                                              initialRating:
                                                                  4.5,
                                                            ),SizedBox(width: 0.5.w,),
                                                            TextWidget(
                                                              textTitle: Constants
                                                                  .ratingPoint11,
                                                              color: ColorUtils
                                                                  .textColor,
                                                              fontSize: 1.5.t,
                                                              fontFamily: FontUtils
                                                                  .PoppinsRegular,
                                                            ),SizedBox(width: 0.5.w,),
                                                            TextWidget(
                                                              textTitle: Constants
                                                                  .ratingPoint12,
                                                              color: ColorUtils
                                                                  .textColor,
                                                              fontSize: 1.5.t,
                                                              fontFamily: FontUtils
                                                                  .PoppinsRegular,
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(top: 1.h, left: 1.w),
                                                          child: Row(
                                                            children: [
                                                              ByeOneGetOne(
                                                                title: Constants.getoneFree,
                                                              ),
                                                              SizedBox(width: 3.w,),
                                                              PercentOff(
                                                                  title: Constants.percentOff),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ));
                                        }),
                                  ),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                DealsAll(
                                  title: Constants.recommendRamdan,
                                  fontSize: 2.t,
                                  fontSize1: 1.8.t,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                ListView.builder(
                                    padding: EdgeInsets.zero,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: 2,
                                    itemBuilder: (context, index) {
                                      return
                                        ResturantVertical(
                                        image: model.recomended[index]['title'],
                                        text: model.recomendedText[index]
                                            ['title'],
                                      );
                                      //   ResturantWidget(
                                      //     image: model.recomended[index]['title'],
                                      //     // text: model.recomendedText[index]['title'],
                                      //     location: model.recomendedText[index]['title'],
                                      //   );
                                    }),
                                SizedBox(
                                  height: 3.h,
                                ),
                                DealsAll(
                                  title: Constants.popularServices,
                                  fontSize: 2.t,
                                  fontSize1: 1.8.t,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Container(
                                  height: 40.h,
                                  child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 2,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: 85.w,
                                          // margin: EdgeInsets.only(right: 9.w),
                                          child: ResturantVertical(
                                            image: model.popularServices[index]
                                                ['title'],
                                            text: model.recomendedText1[index]
                                                ['title'],
                                          ),
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: 5.h,
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
