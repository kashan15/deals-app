import 'dart:io';

import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/friend/friends_profile.dart';
import 'package:deals_app/views/notification/noti_resturant.dart';
import 'package:deals_app/widgets/container_shadow.dart';
import 'package:deals_app/widgets/rating_widget.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../utils/size_config.dart';

class AllReviews extends StatefulWidget {
  const AllReviews({Key? key}) : super(key: key);

  @override
  State<AllReviews> createState() => _AllReviewsState();
}

class _AllReviewsState extends State<AllReviews> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return
          SafeArea(
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
                        margin: EdgeInsets.only(top: 10.h),
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
                            // margin: EdgeInsets.symmetric(horizontal: 4.w),
                            child: SingleChildScrollView(
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
                                      IconButton(
                                        onPressed: () {
                                          model.navigationService.back();
                                        },
                                        icon: Icon(
                                          Icons.arrow_back,
                                          color: ColorUtils.textColor,
                                        ),
                                      ),
                                      TextWidget(
                                        textTitle: Constants.reviews1,
                                        color: ColorUtils.textColor,
                                        fontSize: 2.5.t,
                                        fontFamily: FontUtils.PoppinsSemibold,
                                      ),
                                      TextWidget(
                                        textTitle: Constants.editProfile,
                                        color: Colors.transparent,
                                        fontSize: 1.t,
                                        fontFamily: FontUtils.PoppinsSemibold,
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   height: 1.h,
                                  // ),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      textTitle: Constants.reviews2,
                                      color: ColorUtils.textColor,
                                      fontSize: 2.5.t,
                                      fontFamily: FontUtils.PoppinsSemibold,
                                    ),
                                    // TextWidget(
                                    //   textTitle: Constants.seeAll,
                                    //   color: ColorUtils.gradientColor,
                                    //   fontSize: 2.t,
                                    //   fontFamily: FontUtils.PoppinsMedium,
                                    // ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: Row(
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
                                        RatingWidget(initialRating: 4.8,),
                                      ],
                                    ),
                                    SizedBox(width: 4.w,),
                                    Container(
                                      width: 0.4.w,
                                      height: 8.h,
                                      color: ColorUtils.grey.withOpacity(0.5),
                                    ),
                                    SizedBox(width: 8.7.w,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(height: 3.h,),
                                        Image.asset(ImageUtils.progressbar,
                                          height: 7.h,
                                        ),
                                        SizedBox(height: 0.5.h,),
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
                              ),
                              SizedBox(height: 2.h,),
                              Divider(height: 0.0,),
                              SizedBox(height: 2.h,),
                              ListView.separated(
                                  padding: EdgeInsets.zero,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context,index){
                                    return   Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(ImageUtils.profileImage,
                                                    height: 8.i,
                                                  ),
                                                  SizedBox(width: 2.8.w,),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      // SizedBox(height: 1.h,),
                                                      TextWidget(
                                                        textTitle: '${Constants.userFirstName} ${Constants.userLastName}',
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
                                                  Icon(Icons.star,color: ColorUtils.yellow),
                                                  TextWidget(
                                                    textTitle:  '(${Constants.ratingPoint})',
                                                    fontSize: 1.8.t,
                                                    fontFamily: FontUtils.PoppinsSemibold,
                                                    color: ColorUtils.textColor,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 1.h,),
                                          Container(
                                            margin: EdgeInsets.only(left: 11.w),
                                            child: TextWidget(
                                              textTitle:  Constants.userReviews,
                                              fontSize: 1.8.t,
                                              fontFamily: FontUtils.PoppinsRegular,
                                              color: ColorUtils.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }, separatorBuilder: (context,index)=>Divider(), itemCount: 5),

                                  // SizedBox(height: 2.h,),
                                  // ListView.builder(
                                  //     physics: NeverScrollableScrollPhysics(),
                                  //     itemCount: model.notificationImage.length,
                                  //     shrinkWrap: true,
                                  //     itemBuilder: (context, index) {
                                  //       return NotificationResturant(
                                  //         images: model.notificationImage[index]
                                  //         ['images'],
                                  //       );
                                  //     }),
                                  // SizedBox(
                                  //   height: 4.h,
                                  // ),
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




// import 'package:deals_app/app/locator.dart';
// import 'package:deals_app/utils/color_utils.dart';
// import 'package:deals_app/utils/extensions.dart';
// import 'package:deals_app/viewmodels/main_viewmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:stacked/stacked.dart';
//
// class FriendsList extends StatefulWidget {
//   const FriendsList({Key? key}) : super(key: key);
//
//   @override
//   _FriendsListState createState() => _FriendsListState();
// }

// class _FriendsListState extends State<FriendsList> {
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<MainViewModel>.reactive(
//       viewModelBuilder: () => locator<MainViewModel>(),
//       disposeViewModel: false,
//       onModelReady: (model) {},
//       builder: (context, model, child) {
//         return SafeArea(
//           top: false,
//           bottom: false,
//           child: WillPopScope(
//             onWillPop: () async {
//               return true;
//             },
//             child: GestureDetector(
//               onTap: () {
//                 FocusScope.of(context).unfocus();
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                         colors: [
//                           ColorUtils.gradientcolor1,
//                           ColorUtils.gradientcolor2,
//                         ],
//                         begin: Alignment.topLeft,
//                         end: Alignment.topRight,
//                         stops: [0.1, 0.6])),
//                 child: Scaffold(
//                     backgroundColor: Colors.transparent,
//                     body: Container(
//                       decoration: BoxDecoration(
//                           color: ColorUtils.white,
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(3.w),
//                             topRight: Radius.circular(3.w),
//                           )),
//                       width: double.infinity,
//                       margin: EdgeInsets.only(top: 6.h),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [farrow],
//                           )
//                         ],
//                       ),
//                     )),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }


