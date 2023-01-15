import 'dart:io';

import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/notification/noti_resturant.dart';
import 'package:deals_app/widgets/container_shadow.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../utils/size_config.dart';

class ChatScreenOne extends StatefulWidget {
  const ChatScreenOne({Key? key}) : super(key: key);

  @override
  State<ChatScreenOne> createState() => _ChatScreenOneState();
}

class _ChatScreenOneState extends State<ChatScreenOne> {
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
                      height: 15.h,
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
                        child:
                        Container(
                          height: 110.h,
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
                                    textTitle: Constants.chat,
                                    color: ColorUtils.textColor,
                                    fontSize: 2.5.t,
                                    fontFamily: FontUtils.PoppinsSemibold,
                                  ),


                                  //edit profile
                                  // TextWidget(
                                  //   textTitle: Constants.editProfile,
                                  //   color: Colors.transparent,
                                  //   fontSize: 1.t,
                                  //   fontFamily: FontUtils.PoppinsSemibold,
                                  // ),
                                  Stack(
                                    children:[
                                      Padding(
                                    padding: EdgeInsets.only(right: 2.w),
                                    child: Image.asset(ImageUtils.elysaIcon,
                                    height: 7.h,
                                    ),

                                      ),
                                      Positioned(
                                          top: 5.3.h,
                                          left: 9.5.w,
                                          child:
                                          CircleAvatar(
                                            radius: 6,
                                            backgroundColor: Colors.white,
                                          )
                                      ),
                                      Positioned(
                                        top: 5.5.h,
                                          left: 10.w,
                                          child:
                                      CircleAvatar(
                                        radius: 4,
                                        backgroundColor: Colors.green,
                                      )
                                      ),

                                  ]),
                                ],
                              ),
                              // SizedBox(
                              //   height: 1.h,
                              // ),
                              SizedBox(height: 2.h,),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Row(
                                  children: [

                                    Expanded(
                                      child: Divider(
                                        color: ColorUtils.grey.withOpacity(0.5),thickness: 1,
                                      ),
                                    ),

                                    SizedBox(width: 5.w),

                                    Text("Today",
                                    style: TextStyle(
                                      color: ColorUtils.grey.withOpacity(0.5),
                                      fontFamily: FontUtils.PoppinsMedium,
                                      fontSize: 2.1.t
                                    ),
                                    ),

                                    SizedBox(width: 5.w),

                                    Expanded(
                                      child: Divider(
                                        color: ColorUtils.grey.withOpacity(0.5),
                                        thickness: 1,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(height: 4.h,),

                              ///1st Container
                              Padding(
                                padding: EdgeInsets.only(left: 4.w, right: 25.w),
                                child: Container(
                                  height: 10.h,
                                  // width: 30.w,

                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                    color: ColorUtils.white,
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    )
                                    ),
                                  child:
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 4.w, right: 2.w),
                                      child: Text("Lorem ipsum dolor sit amet cons ectetur"
                                        ,
                                        style: TextStyle(
                                          fontSize: 2.t,
                                          fontFamily: FontUtils.PoppinsSemibold
                                        ),
                                      ),
                                    ),
                                  ),
                                  ),
                                ),
                              SizedBox(height: 2.h,),
                              Padding(
                                  padding: EdgeInsets.only(left: 7.w),
                                  child: Text("03:39",
                                  style: TextStyle(
                                    color: ColorUtils.grey
                                  ),
                                  )),
                              SizedBox(height: 2.h,),

                              ///2nd container
                              Padding(
                                padding: EdgeInsets.only(left: 20.w, right: 5.w ),
                                child: Container(
                                    height: 10.h,
                                    // width: 30.w,

                                    decoration: BoxDecoration(
                                        // color: ColorUtils.redColorExpiresIn,
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     color: Colors.grey.withOpacity(0.5),
                                        //     spreadRadius: 5,
                                        //     blurRadius: 7,
                                        //     offset: Offset(0, 3), // changes position of shadow
                                        //   ),
                                        // ],
                                        gradient: LinearGradient(
                                          colors: [
                                            ColorUtils.gradientcolor1,
                                            ColorUtils.gradientcolor2
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          stops: [0.4, 0.7],
                                        ),
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                        )
                                    ),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 4.w, right: 2.w),
                                      child: Text("Sed do eiusmod tempor incidi dunt ut"
                                        ,
                                        style: TextStyle(
                                          fontSize: 2.2.t,
                                          fontFamily: FontUtils.PoppinsSemibold,
                                          color: ColorUtils.white
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 2.h,),
                              Padding(
                                  padding: EdgeInsets.only(left: 80.w),
                                  child: Text("03:39", style: TextStyle(
                                      color: ColorUtils.grey
                                  ),)),

                              SizedBox(height: 3.h,),

                              ///3rd container
                              Padding(
                                padding: EdgeInsets.only(left: 4.w, right: 25.w),
                                child: Container(
                                    height: 13.h,
                                    // width: 30.w,

                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                        color: ColorUtils.white,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        )
                                    ),
                                  child:
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 4.w, right: 2.w),
                                      child: Text("Totam rem aparium, eiaque ipsa quae ab illo inventore veritaits et quasi architecto"
                                        ,
                                        style: TextStyle(
                                          fontSize: 1.9.t,
                                          fontFamily: FontUtils.PoppinsSemibold
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 2.h,),
                              Padding(
                                  padding: EdgeInsets.only(left: 7.w),
                                  child: Text("03:39", style: TextStyle(
                                      color: ColorUtils.grey
                                  ),)),

                              Padding(
                                padding: EdgeInsets.only(left: 20.w, right: 5.w ),
                                child: Container(
                                    height: 13.h,
                                    // width: 30.w,

                                    decoration: BoxDecoration(
                                        // color: ColorUtils.redColorExpiresIn,
                                        gradient: LinearGradient(
                                          colors: [
                                            ColorUtils.gradientcolor1,
                                            ColorUtils.gradientcolor2
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          stops: [0.4, 0.7],
                                        ),
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                        )
                                    ),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 4.w, right: 2.w),
                                      child: Text("Nemo enim ipsam voluptatem quia voluptas sit aspernatu aut odit aut fugit",
                                        style: TextStyle(
                                          color: ColorUtils.white,
                                          fontSize: 2.t,
                                          fontFamily: FontUtils.PoppinsSemibold
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 2.h,),
                              Padding(
                                  padding: EdgeInsets.only(left: 80.w),
                                  child: Text("03:39", style: TextStyle(
                                      color: ColorUtils.grey
                                  ),)),

                              SizedBox(height: 2.h,),
                              Padding(
                                padding: EdgeInsets.only(left: 4.w,
                                    right: 4.w,
                                    bottom: 3.h),
                                child: Container(
                                  height: 8.h,
                                  //width: 200.0,
                                  margin: EdgeInsets.only(
                                    //left: SizeConfig.widthMultiplier * 4.5,
                                    right: SizeConfig.widthMultiplier * 2,
                                    //top: SizeConfig.heightMultiplier * 3,
                                  ),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(40.0),
                                      ),
                                      border: Border.all(color: ColorUtils.white)
                                  ),
                                  child: Container(
                                    //color: Colors.amber,
                                    margin:
                                    EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3,),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        // ExpandTapWidget(
                                        //   onTap: () {
                                        //   },
                                        //   tapPadding: EdgeInsets.all(10.0),
                                        //   child: Padding(
                                        //     padding: EdgeInsets.only(left: 2.w),
                                        //       child: SvgPicture.asset(ImageUtils.Smile)),
                                        // ),

                                        SizedBox(width: 1.w,),
                                        Expanded(
                                          child:
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: SizeConfig.widthMultiplier * 3,
                                                right: SizeConfig.widthMultiplier * 3),
                                            child: TextField(
                                              onTap: () {},
                                              enabled: true,
                                              //readOnly: true,
                                              //focusNode: model.searchFocus,
                                              controller: model.chatController,
                                              decoration: InputDecoration(
                                                hintText: "Type your message...",
                                                hintStyle: TextStyle(
                                                  //fontFamily: FontUtils.proximaNovaRegular,
                                                  color: ColorUtils.grey,
                                                  fontSize: SizeConfig.textMultiplier * 1.9,
                                                ),
                                                border: InputBorder.none,
                                                isDense: true,
                                                contentPadding: EdgeInsets.symmetric(
                                                    vertical: SizeConfig.heightMultiplier * 2),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            //color: ColorUtils.text_red,
                                            borderRadius: BorderRadius.all(Radius.circular(15)),
                                          ),
                                          child: Row(
                                            children: [


                                              SizedBox(width: 3.w,),

                                              ExpandTapWidget(
                                                onTap: () {
                                                },
                                                tapPadding: EdgeInsets.all(25.0),
                                                child: SvgPicture.asset(ImageUtils.Smile)

                                              ),

                                              SizedBox(height: 2.h,),
                                              if(model.emojiSelected == true)
                                              Container(
                                                height: 30.h,
                                                child: Offstage(
                                                  offstage: !model.emojiShowing,
                                                  child: EmojiPicker(
                                                      onEmojiSelected: (Category category, Emoji emoji) {
                                                        model.onEmojiSelected(emoji);
                                                      },
                                                      onBackspacePressed: model.onBackspacePressed,
                                                      config: Config(
                                                          columns: 7,
                                                          // Issue: https://github.com/flutter/flutter/issues/28894
                                                          emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                                                          verticalSpacing: 0,
                                                          horizontalSpacing: 0,
                                                          initCategory: Category.RECENT,
                                                          bgColor: const Color(0xFFF2F2F2),
                                                          indicatorColor: Colors.blue,
                                                          iconColor: Colors.grey,
                                                          iconColorSelected: Colors.blue,
                                                          progressIndicatorColor: Colors.blue,
                                                          backspaceColor: Colors.blue,
                                                          showRecentsTab: true,
                                                          recentsLimit: 28,
                                                          // noRecentsText: 'No Recents',
                                                          // noRecentsStyle: const
                                                          // TextStyle(
                                                          //     fontSize: 20, color: Colors.black26),
                                                          tabIndicatorAnimDuration: kTabScrollDuration,
                                                          categoryIcons: const CategoryIcons(),
                                                          buttonMode: ButtonMode.MATERIAL)),
                                                ),
                                              ),

                                              SizedBox(width: 4.w,),
                                              ExpandTapWidget(
                                                  onTap: () async{
                                                    // final cameras = await availableCameras();
                                                    // final firstCamera = cameras.first;
                                                    //model.navigationService.navigateTo(to: TakePictureScreen(camera: firstCamera,));
                                                    //model.openCamera();
                                                  },
                                                  tapPadding: EdgeInsets.all(25.0),
                                                  child: 
                                                  // SvgPicture.asset(ImageUtils.Photo_camera)
                                                Container(
                                                  child: Image.asset(ImageUtils.SendMsg),
                                                )
                                              ),
                                              /*PopupMenuButton(
                                        //offset: Offset(50,-5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            //color: ColorUtils.blueColor,
                                            // shape: BoxShape.circle,
                                            // border: Border.all(color: Colors.white,width: 1.5),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: SvgPicture.asset(ImageUtils.photoCamera),
                                          ),
                                        ),
                                        itemBuilder: (_) => <PopupMenuItem<String>>[
                                          new PopupMenuItem<String>(
                                            child: new Text('Camera'), value: 'Camera',
                                            onTap: (){
                                              model.chatOpenCamera(widget.otherFirebaseId!, widget.otherUserId!);
                                            },
                                          ),
                                          new PopupMenuItem<String>(
                                            child: new Text('Gallery'), value: 'Gallery',
                                            onTap: (){
                                              model.chatGetImage(widget.otherFirebaseId!, widget.otherUserId!);
                                            },
                                          ),
                                        ],
                                      ),*/
                                              // GestureDetector(
                                              //     onTap: (){
                                              //       //model.chatOpenCamera(widget.otherFirebaseId!, widget.otherUserId!);
                                              //     },
                                              //     child: SvgPicture.asset(ImageUtils.Photo_camera)
                                              // ),
                                            ],
                                          ),
                                        ),
                                        // Text(searchHere,
                                        //   style: TextStyle(
                                        //     fontFamily: FontUtils.gibsonRegular,
                                        //     fontWeight: FontWeight.w400,
                                        //     fontSize: SizeConfig.textMultiplier * 1.8,
                                        //     color: ColorUtils.searchFieldText,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
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
                    ),

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


