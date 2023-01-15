import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/friend/chatScreen.dart';
import 'package:deals_app/views/friend/chat_screen.dart';
import 'package:deals_app/views/friend/friends_profile.dart';
import 'package:deals_app/views/main_views/main_views.dart';
import 'package:deals_app/views/notification/noti_resturant.dart';
import 'package:deals_app/widgets/container_shadow.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
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
                                        // model.navigationService.back();
                                        model.navigationService.navigateTo(
                                            to: MainViews(index: 0));
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: ColorUtils.textColor,
                                      ),
                                    ),
                                    TextWidget(
                                      textTitle: Constants.inbox,
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
                                Container(
                                  margin: EdgeInsets.only(bottom: 2.h),
                                  child: ListView.builder(
                                      itemCount: 10,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            model.navigationService.navigateTo(to: ChatScreenOne());
                                          },
                                          child: Container(
                                            // height: 10.h,
                                            color: ColorUtils.white,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [

                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 2.w,
                                                    ),
                                                    CircleAvatar(
                                                      radius: 31,
                                                      backgroundColor:
                                                          ColorUtils.black,
                                                      child: Image.asset(
                                                        model.inboxList[index]
                                                            ['image'],
                                                        height: 20.h,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 3.w,
                                                    ),
                                                    Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          SizedBox(height: 1.h,),
                                                          // SizedBox(height: 2.h,),
                                                          Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Container(
                                                                  // color: Colors.red,
                                                                  child: TextWidget(
                                                                    textTitle: model
                                                                            .inboxList[
                                                                        index]['name'],
                                                                    color: ColorUtils
                                                                        .textColor,
                                                                    fontSize: 2.t,
                                                                    fontFamily:
                                                                        FontUtils
                                                                            .PoppinsSemibold,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 42.w,
                                                                ),
                                                                TextWidget(
                                                                  textTitle: model
                                                                          .inboxList[
                                                                      index]['day'],
                                                                  color:
                                                                      ColorUtils
                                                                          .grey,
                                                                  fontSize: 1.7.t,
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .PoppinsRegular,
                                                                ),
                                                              ]),
                                                          SizedBox(
                                                            height: 1.h,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Container(
                                                                width: 70.w,
                                                                margin: EdgeInsets.zero,
                                                                // color: Colors.blue,
                                                                child: TextWidget(
                                                                  textTitle:
                                                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Proin",
                                                                  color:
                                                                      ColorUtils
                                                                          .grey,
                                                                  fontSize: 1.7.t,
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .PoppinsRegular,
                                                                ),
                                                              ),
                                                              // SizedBox(width: 1.w,),
                                                              Padding(
                                                                  padding: EdgeInsets.only(top: 0.h, left: 1.5.w),
                                                                  child:
                                                                  // SvgPicture.asset(ImageUtils.forward_arrow)
                                                                Icon(Icons.arrow_forward_ios_outlined,
                                                                color: ColorUtils.grey,
                                                                  size: 5.i,
                                                                )
                                                              )
                                                            ],
                                                          )
                                                        ]),
                                                    // SizedBox(width: 56.w,),
                                                    // SvgPicture.asset(ImageUtils.forward_arrow)
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Divider(
                                                  color: ColorUtils.grey,
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ),
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
