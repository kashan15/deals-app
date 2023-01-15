// import 'package:deals_app/utils/color_utils.dart';
// import 'package:deals_app/utils/constants.dart';
// import 'package:deals_app/utils/extensions.dart';
// import 'package:deals_app/utils/font_utils.dart';
// import 'package:deals_app/utils/image_utils.dart';
// import 'package:deals_app/widgets/buy_one_get_one.dart';
// import 'package:deals_app/widgets/percent_off.dart';
// import 'package:deals_app/widgets/text_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class ResturantList extends StatefulWidget {
//   dynamic title;
//   dynamic image;
//   void Function()? onTap;
//   ResturantList({this.title, this.image, this.onTap});
//
//   @override
//   State<ResturantList> createState() => _ResturantListState();
// }
//
// class _ResturantListState extends State<ResturantList> {
//   bool likebutton = true;
//   bool selectHeart = false;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: widget.onTap,
//       child: Padding(
//         padding: const EdgeInsets.only(bottom: 15.0),
//         child: Container(
//           width: double.infinity,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 3.h,
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: 1.w),
//                 decoration: BoxDecoration(
//                   color: ColorUtils.white,
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.1),
//                       spreadRadius: 2,
//                       blurRadius: 2,
//                       offset: Offset(2, 5),
//
//                       // color: Color.fromRGBO(115, 165, 254, 0.45),
//                       // offset: Offset(0.1, 5),
//                       // blurRadius: 15,
//                     )
//                   ],
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.h),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image.asset(
//                           widget.image,
//                           height: 30.i,
//                           width: 26.i,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // SizedBox(
//                         //   height: 0.5.h,
//                         // ),
//                         Container(
//                           width: 60.w,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               TextWidget(
//                                 textTitle: widget.title,
//                                 textAlign: TextAlign.start,
//                                 color: ColorUtils.black,
//                                 fontSize: 2.t,
//                                 fontFamily: FontUtils.PoppinsSemibold,
//                               ),
//                               GestureDetector(
//                                 onTap: (){
//                                   setState(() {
//                                     likebutton = !likebutton;
//
//                                   });
//
//                                 },
//                                 child: CircleAvatar(
//                                     radius: 3.5.w,
//                                     backgroundColor: ColorUtils.white,
//                                     child: likebutton?
//                                     Icon(
//                                       Icons.favorite_outline,
//                                       color: ColorUtils.black,
//                                       size: 4.5.w,
//                                     ):
//                                     Icon(
//                                       Icons.favorite,
//                                       color: ColorUtils.redColorExpiresIn,
//                                       size: 4.5.w,
//                                     )
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         TextWidget(
//                           textTitle: Constants.resturantLocation,
//                           textAlign: TextAlign.start,
//                           color: ColorUtils.grey,
//                           fontSize: 1.8.t,
//                           fontFamily: FontUtils.PoppinsMedium,
//     //   child: Container(
//     //     width: double.infinity,
//     //     child: Column(
//     //       crossAxisAlignment: CrossAxisAlignment.center,
//     //       children: [
//     //         SizedBox(
//     //           height: 3.h,
//     //         ),
//     //         Container(
//     //           decoration: BoxDecoration(
//     //             color: ColorUtils.white,
//     //             borderRadius: BorderRadius.circular(16),
//     //             border: Border.all(
//     //               color: ColorUtils.favotiteColor,
//     //               width: 3
//     //             ),
//     //             // boxShadow: [
//     //             //   BoxShadow(
//     //             //     color: ColorUtils.favotiteColor.withOpacity(0.3),
//     //             //     spreadRadius: 2,
//     //             //     blurRadius: 2,
//     //             //     offset: Offset(2, 5),
//     //             //
//     //             //     // color: Color.fromRGBO(115, 165, 254, 0.45),
//     //             //     // offset: Offset(0.1, 5),
//     //             //     // blurRadius: 15,
//     //             //   )
//     //             // ],
//     //
//     //             boxShadow: [
//     //               BoxShadow(
//     //                 color: ColorUtils.favotiteColor.withOpacity(0.3),
//     //                 spreadRadius: 4,
//     //                 blurRadius: 9,
//     //                 offset: Offset(2, 5),
//     //
//     //                 // color: Color.fromRGBO(115, 165, 254, 0.45),
//     //                 // offset: Offset(0.1, 5),
//     //                 // blurRadius: 15,
//     //               )
//     //             ],
//     //           ),
//     //           child: Row(
//     //             children: [
//     //               Container(
//     //                 margin: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.h),
//     //                 child: ClipRRect(
//     //                   borderRadius: BorderRadius.circular(10),
//     //                   child: Image.asset(
//     //                     widget.image,
//     //                     height: 30.i,
//     //                     width: 26.i,
//     //                     fit: BoxFit.cover,
//     //                   ),
//     //                 ),
//     //               ),
//     //               Column(
//     //                 crossAxisAlignment: CrossAxisAlignment.start,
//     //                 children: [
//     //                   // SizedBox(
//     //                   //   height: 0.5.h,
//     //                   // ),
//     //                   Container(
//     //                     width: 60.w,
//     //                     child: Row(
//     //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //                       children: [
//     //                         TextWidget(
//     //                           textTitle: widget.title,
//     //                           textAlign: TextAlign.start,
//     //                           color: ColorUtils.black,
//     //                           fontSize: 2.t,
//     //                           fontFamily: FontUtils.PoppinsSemibold,
//     //                         ),
//     //                         // SvgPicture.asset(ImageUtils.heart),
//     //                         CircleAvatar(
//     //                           backgroundColor: ColorUtils.grey2,
//     //                           radius: 12,
//     //                           child: Center(
//     //                               child:
//     //                               GestureDetector(
//     //                                 onTap: (){
//     //                                   // selectHeart == true;
//     //                                 },
//     //                                   child: SvgPicture.asset(ImageUtils.heart)
//     //                                 // child: Icon(
//     //                                 //   Icons.favorite,
//     //                                 //   color: selectHeart == true ? Colors.white : Colors.red,
//     //                                 // ),
//     //                               )
//     //                           ),
//     //                         ),
//     //                       ],
//     //                     ),
//     //                   ),
//     //                   TextWidget(
//     //                     textTitle: Constants.resturantLocation,
//     //                     textAlign: TextAlign.start,
//     //                     color: ColorUtils.grey,
//     //                     fontSize: 1.8.t,
//     //                     fontFamily: FontUtils.PoppinsMedium,
//     //                   ),
//     //                   Row(
//     //                     children:[
//     //                       TextWidget(
//     //                       textTitle: Constants.foodCategories1,
//     //                       textAlign: TextAlign.start,
//     //                       color: ColorUtils.grey,
//     //                       fontSize: 1.8.t,
//     //                       fontFamily: FontUtils.PoppinsRegular,
//     //                     ),
//     //                       SizedBox(width: 1.w,),
//     //                       CircleAvatar(
//     //                         radius: 2,
//     //                         backgroundColor: ColorUtils.gradientcolor2,
//     //                       ),
//     //                       SizedBox(width: 1.w,),
//     //                       TextWidget(
//     //                         textTitle: Constants.foodCategories2,
//     //                         textAlign: TextAlign.start,
//     //                         color: ColorUtils.grey,
//     //                         fontSize: 1.8.t,
//     //                         fontFamily: FontUtils.PoppinsRegular,
//     //                       ),
//     //                       SizedBox(width: 1.w,),
//     //                       CircleAvatar(
//     //                         radius: 2,
//     //                         backgroundColor: ColorUtils.gradientcolor2,
//     //                       ),
//     //                       SizedBox(width: 1.w,),
//     //                       TextWidget(
//     //                         textTitle: Constants.foodCategories3,
//     //                         textAlign: TextAlign.start,
//     //                         color: ColorUtils.grey,
//     //                         fontSize: 1.8.t,
//     //                         fontFamily: FontUtils.PoppinsRegular,
//     //                       ),
//     //
//     //                   ]),
//     //                   Padding(
//     //                     padding: EdgeInsets.only(left: 0.w, top: 1.5.h,),
//     //                     child: Row(
//     //                       children: [
//     //                         ByeOneGetOne(
//     //                           title: Constants.getoneFree,
//     //                         ),
//     //                         SizedBox(
//     //                           width: 3.w,
//     //                         ),
//     //                         PercentOff(title: Constants.percentOff),
//     //                       ],
//     //                     ),
//     //
//     //                     /// Text Widget
//     //                     // TextWidget(
//     //                     //   textTitle: Constants.foodCategories,
//     //                     //   textAlign: TextAlign.start,
//     //                     //   color: ColorUtils.grey,
//     //                     //   fontSize: 1.8.t,
//     //                     //   fontFamily: FontUtils.PoppinsRegular,
//     //                     // ),
//     //
//     //                     /// Padding
//     //                     // Padding(
//     //                     //   padding: EdgeInsets.all(8.0),
//     //                     //   child: Row(
//     //                     //     children: [
//     //                     //       ByeOneGetOne(
//     //                     //         title: Constants.getoneFree,
//     //                     //       ),
//     //                     //       SizedBox(
//     //                     //         width: 2.w,
//     //                     //       ),
//     //                     //       PercentOff(title: Constants.percentOff),
//     //                     //     ],
//     //                     //   ),
//     //                     // ),
//     // )],
//     //                 )
//     //               ],
//     //             ),
//     //           )
//     //         ],
//     //       ),
//     //     ),
//       ),
//     ])]))]
//     ))));
//   }
// }

import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/widgets/buy_one_get_one.dart';
import 'package:deals_app/widgets/percent_off.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class ResturantList extends StatefulWidget {
  dynamic title;
  dynamic image;
  void Function()? onTap;
  int? index;
  dynamic Icon;

  ResturantList({this.title, this.image, this.onTap, this.index, this.Icon});

  @override
  State<ResturantList> createState() => _ResturantListState();
}

class _ResturantListState extends State<ResturantList> {
  bool likebutton = true;
  bool selectHeart = false;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => locator<MainViewModel>(),
        onModelReady: (model) {
        },
        disposeViewModel: false,
        builder: (context, model, child) {
          return GestureDetector(
            onTap: widget.onTap,
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorUtils.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: ColorUtils.bordercolor,
                          width: 3
                      ),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: ColorUtils.favotiteColor.withOpacity(0.3),
                      //     spreadRadius: 2,
                      //     blurRadius: 2,
                      //     offset: Offset(2, 5),
                      //
                      //     // color: Color.fromRGBO(115, 165, 254, 0.45),
                      //     // offset: Offset(0.1, 5),
                      //     // blurRadius: 15,
                      //   )
                      // ],

                      boxShadow: [
                        BoxShadow(
                          color: ColorUtils.bordercolor.withOpacity(0.3),
                          spreadRadius: 4,
                          blurRadius: 6,
                          offset: Offset(6, 7),
                          // offset: Offset(0.1,5),

                          // color: Color.fromRGBO(115, 165, 254, 0.45),
                          // offset: Offset(0.1, 5),
                          // blurRadius: 15,
                        )
                      ],
                    ),
                    child:
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.h),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              widget.image,
                              height: 30.i,
                              width: 26.i,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Row(
                          children:[
                            SizedBox(width: 2.w,),
                            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // SizedBox(
                              //   height: 0.5.h,
                              // ),
                              Container(
                                // color: ColorUtils.blue,
                                margin: EdgeInsets.only(bottom: 1.h),
                                width: 54.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      textTitle: widget.title,
                                      textAlign: TextAlign.start,
                                      color: ColorUtils.black,
                                      fontSize: 2.4.t,
                                      fontFamily: FontUtils.PoppinsSemibold,
                                    ),
                                    // SvgPicture.asset(ImageUtils.heart),
                                    CircleAvatar(
                                      backgroundColor: ColorUtils.grey2,
                                      radius: 12,
                                      child: Center(child:
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            likebutton = !likebutton;

                                          });

                                        },
                                        child: CircleAvatar(
                                            radius: 3.5.w,
                                            backgroundColor: ColorUtils.grey2,
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
                                      )
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // margin: EdgeInsets.only(bottom: 0.7.h),
                                // color: ColorUtils.blue,
                                child: TextWidget(
                                  textTitle: Constants.resturantLocation,
                                  textAlign: TextAlign.start,
                                  color: ColorUtils.grey,
                                  fontSize: 1.8.t,
                                  fontFamily: FontUtils.PoppinsMedium,
                                ),
                              ),
                              SizedBox(height: 0.5.h,),
                              Container(
                                // color: ColorUtils.redColorExpiresIn,
                                // margin: EdgeInsets.only(bottom: 1.h),
                                child: Row(
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
                              ),

                              Padding(
                                padding: EdgeInsets.only(left: 0.w, top: 1.5.h,),
                                child:
                                Row(
                                  children: [

                                    ExpireTimeOne(
                                      title: Constants.expireTime1,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    PercentOff(title: Constants.percentOff),
                                  ],
                                ),
                              ),
                            ],
                          ),
                       ] )
                      ],
                    ),
                  )
                ],
              ),
            ),

          );}
    );}
}

