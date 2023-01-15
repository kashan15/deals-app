import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/utils/size_config.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/bookings.dart';
import 'package:deals_app/views/checkInScreen.dart';
import 'package:deals_app/views/favourite/favourites.dart';
import 'package:deals_app/views/friend/friends_list.dart';
import 'package:deals_app/views/notification/notification.dart';
import 'package:deals_app/views/reviews_one.dart';
import 'package:deals_app/views/reward_summary.dart';
import 'package:deals_app/views/votings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';

class FriendsProfile extends StatefulWidget {
  const FriendsProfile({Key? key}) : super(key: key);

  @override
  _FriendsProfileState createState() => _FriendsProfileState();
}

class _FriendsProfileState extends State<FriendsProfile> {
  bool likebutton = true;
  bool likebutton1 = true;
  bool selectHeart = false;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => locator<MainViewModel>(),
        onModelReady: (model) async {},
        disposeViewModel: false,
        builder: (context, model, child) {
          return SafeArea(
              top: false,
              bottom: false,
              child: Scaffold(
                body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 40.h,
                        child: Stack(
                          children: [
                            Image.asset(
                              ImageUtils.friends_profile,
                              fit: BoxFit.fill,
                              // height: 73.h,
                            ),
                            Positioned(
                                left: 40.w,
                                top: 28.h,
                                child: CircleAvatar(
                                  radius: 35,
                                  child: Image.asset(
                                    ImageUtils.elysaIcon,
                                  ),
                                )),
                            Positioned(
                                left: 4.w,
                                top: 7.h,
                                child: CircleAvatar(
                                  backgroundColor: ColorUtils.white,
                                  radius: 20,
                                  // child: Image.asset(
                                  //   ImageUtils.profileImage,
                                  // ),
                                  child: Center(
                                    child:
                                    IconButton(
                                        onPressed: (){
                                          model.navigationService.back();
                                        },
                                        icon: Image.asset(ImageUtils.iconBack,
                                          height: 5.i,
                                        ),
                                        // Icon(Icons.arrow_back,
                                        // color: ColorUtils.black,
                                        // )
                                    )
                                  ),
                                )),
                            Positioned(
                                left: 89.w,
                                top: 6.h,
                                child: GestureDetector(
                                  onTap: (){model.navigationService.navigateTo(to: NotificationScreen());},
                                  child: SvgPicture.asset(
                                      ImageUtils.notification_bing),
                                )),

                            Positioned(
                                left: 79.w,
                                top: 5.7.h,
                                child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        likebutton1 = !likebutton1;

                                      });
                                    },
                                  child: likebutton1 ?
                                  Icon(
                                    Icons.favorite_outline,
                                    color: ColorUtils.white,
                                    size: 7.5.w,
                                  ):
                                  Icon(
                                    Icons.favorite,
                                    color: ColorUtils.redColorExpiresIn,
                                    size: 7.5.w,
                                  )
                                  // SvgPicture.asset(
                                  //     ImageUtils.heart1) : SvgPicture.asset(
                                  //     ImageUtils.heart1, color: ColorUtils.redColorExpiresIn,)
                                )),
                            Positioned(
                                left: 70.w,
                                top: 6.h,
                                child: GestureDetector(
                                  onTap: (){
                                    // model.navigationService.navigateTo(to: NotificationScreen());
                                  },
                                  child: GestureDetector(
                                    onTap: (){
                                      Share.share("Dealsapp");
                                    },
                                    child: SvgPicture.asset(
                                        ImageUtils.send),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Center(
                          child: Text(
                        "Ayesha Ali Khan",
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.PoppinsSemibold,
                            fontSize: 2.2.t),
                      )),
                      SizedBox(
                        height: 1.h,
                      ),

                      // Container(
                      //   child: GridView.builder(
                      //       padding: EdgeInsets.all(10),
                      //       scrollDirection: Axis.vertical,
                      //       physics: BouncingScrollPhysics(),
                      //       shrinkWrap: true,
                      //       itemCount: 4,
                      //       gridDelegate:
                      //           SliverGridDelegateWithFixedCrossAxisCount(
                      //         childAspectRatio: 0.70,
                      //         crossAxisCount: 4,
                      //         mainAxisSpacing: 1.9 * SizeConfig.widthMultiplier,
                      //         //childAspectRatio: 1,
                      //         // crossAxisSpacing: 1*SizeConfig.widthMultiplier
                      //       ),
                      //       itemBuilder: (context, index) {
                      //         return Row(children: [
                      //
                      //           SizedBox(
                      //             width: 2.w,
                      //           ),
                      //
                      //
                      //           Container(
                      //             // height: 8.h,
                      //             // width: 5.w,
                      //             // color: ColorUtils.white,
                      //             child: Column(
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 Padding(
                      //                   padding: EdgeInsets.only(top: 3.h),
                      //                   child: Center(
                      //                       child: SvgPicture.asset(model.friendsProfile[index]['icon'])),
                      //                 ),
                      //                 Padding(
                      //                     padding: EdgeInsets.only(top: 0.5.h),
                      //                     child: Center(
                      //                         child: Text(
                      //                       model.friendsProfile[index]['type'],
                      //                       style: TextStyle(
                      //                         fontSize: 1.6.t,
                      //                         fontFamily:
                      //                             FontUtils.PoppinsSemibold,
                      //                       ),
                      //                     ))),
                      //                 Padding(
                      //                     padding: EdgeInsets.only(top: 0.h),
                      //                     child: Center(
                      //                         child: Text(
                      //                           model.friendsProfile[index]['count'],
                      //                       style: TextStyle(
                      //                           fontSize: 2.5.t,
                      //                           fontFamily:
                      //                               FontUtils.PoppinsSemibold,
                      //                           color:
                      //                               ColorUtils.gradientcolor2),
                      //                     ))),
                      //               ],
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 2.w,
                      //           ),
                      //           Padding(
                      //             padding: EdgeInsets.only(top: 1.h),
                      //             child: Container(
                      //               height: 4.h,
                      //               child: VerticalDivider(
                      //                 color: ColorUtils.grey2,
                      //                 thickness: 2,
                      //                 width: 1.w,
                      //               ),
                      //             ),
                      //           ),
                      //
                      //         ]);
                      //       }),
                      // ),


                      Container(
                        height: 15.h,
                        width: 100.w,
                        // color: ColorUtils.white,
                        child: Stack(
                          children: [

                            Container(
                              margin: EdgeInsets.only(left: 4.4.w),
                              child: SizedBox(
                                height: 15.h,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: 4,
                                    // model.friendsProfile.length,

                                    itemBuilder: (context, index) {
                                      return Stack(children: [
                                        GestureDetector(
                                          onTap: () {
                                            print(index);
                                            if (index == 0) {
                                              model.navigationService
                                                  .navigateTo(to: FriendList());
                                            }
                                            if (index == 1) {
                                              model.navigationService
                                                  .navigateTo(to: RewardSummary());
                                            }
                                            if (index == 2) {
                                              model.navigationService
                                                  .navigateTo(to: CheckInScreen());
                                            } if (index == 3) {
                                              model.navigationService
                                                  .navigateTo(to: Fovourites());
                                            } if (index == 4) {
                                              model.navigationService
                                                  .navigateTo(to: Fovourites());
                                            } if (index == 5) {
                                              model.navigationService
                                                  .navigateTo(to: AllReviews());
                                            } if (index == 6) {
                                              model.navigationService
                                                  .navigateTo(to: BookingsScreen());
                                            } if (index == 7) {
                                              model.navigationService
                                                  .navigateTo(to: VotingsScreen());
                                            }

                                            //
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(left: 4.w),
                                            child: Row(
                                                children:[
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        child: SvgPicture.asset(
                                                          model.friendsProfile[index]
                                                          ['icon'],
                                                          // height: 12.i,
                                                        ),
                                                      ),
                                                      SizedBox(height: 0.5.h,),
                                                      Container(
                                                        // color: Colors.white,
                                                        child: Text(model.friendsProfile[index]['type'],
                                                          style: TextStyle(
                                                            fontSize: 1.8.t,
                                                            fontFamily:
                                                            FontUtils.PoppinsRegular,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        // height: 6.h,
                                                        // margin: EdgeInsets.only(bottom: 2.h),
                                                        // color: Colors.blue,
                                                        child: Text(model.friendsProfile[index]['count'],
                                                          style: TextStyle(
                                                              fontSize: 3.5.t,
                                                              fontFamily:
                                                              FontUtils.PoppinsSemibold,
                                                              color: ColorUtils.gradientcolor2),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // SizedBox(width: 2.w,),
                                                  SizedBox(width: 4.w,),
                                                  Column(
                                                      children:[
                                                        SizedBox(height: 4.h,),
                                                        Container(
                                                          height: 4.5.h,
                                                          child: VerticalDivider(
                                                            color: ColorUtils.grey2,
                                                            thickness: 2,
                                                            width: 1.w,
                                                          ),
                                                        ),
                                                      ]),
                                                  // SizedBox(width: 4.w,)
                                                ]),
                                          ),
                                        )]);
                                    }),
                              ),
                            ),

                            // Positioned(
                            //     top: 5.h,
                            //     left: 90.w,
                            //     child: CircleAvatar(
                            //       backgroundColor: ColorUtils.black,
                            //       radius: 16,
                            //       // child: Image.asset(
                            //       //   ImageUtils.profileImage,
                            //       // ),
                            //       child: Center(
                            //           child:
                            //           IconButton(
                            //               onPressed: (){
                            //                 model.navigationService.back();
                            //               },
                            //               icon: Icon(
                            //                 Icons.arrow_forward_ios_outlined,
                            //                 color: ColorUtils.white,
                            //                 size: 4.5.i,
                            //               ))),
                            //     )
                            //   // Container(
                            //   //   height: 4.5.h,
                            //   //   decoration: BoxDecoration(
                            //   //     color: Colors.black,
                            //   //     shape: BoxShape.circle,
                            //   //
                            //   //   ),
                            //   //   child: Center(
                            //   //     child: Icon(Icons.arrow_forward_ios,
                            //   //       color: Colors.white,
                            //   //       size: 7.5.i,
                            //   //     ),
                            //   //   ),
                            //   //
                            //   // )
                            // ),
                          ],

                        ),
                      ),

                      // Padding(
                      //   padding:
                      //       EdgeInsets.only(top: 0.h, left: 7.w, right: 7.w),
                      //   child: Container(
                      //     child: Divider(
                      //       color: ColorUtils.grey2,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 4.h,
                      // ),

                      ///unfollow
                      Padding(
                        padding: EdgeInsets.only(
                          top: 1.5.h,
                          left: 6.w,
                          right: 6.w,
                        ),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              likebutton = !likebutton;

                            });
                          },
                          child: Container(
                            height: 6.3.h,
                            width: 100.w,

                            decoration: BoxDecoration(
                                // color: ColorUtils.unfollow1.withOpacity(0.1),
                              color: likebutton? ColorUtils.gradientColor.withOpacity(0.1) :
                              ColorUtils.redColorExpiresIn.withOpacity(1) ,
                                borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                // "Unfollow",
                                likebutton ? "Unfollow": "Follow",
                                style: TextStyle(
                                  fontFamily: FontUtils.PoppinsMedium,
                                  fontSize: 2.4.t,
                                  // color: ColorUtils.gradientcolor2,
                                  color: likebutton ? ColorUtils.gradientcolor2: ColorUtils.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                          padding:
                              EdgeInsets.only(top: 3.h, left: 6.w,),
                          child: Text(
                            "Photos",
                            style: TextStyle(
                              fontFamily: FontUtils.PoppinsSemibold,
                              fontSize: 2.8.t,
                              color: ColorUtils.black,
                            ),
                          )),
                      // SizedBox(height: 2.h,),
                      Container(
                        // margin: EdgeInsets.only(bottom: 4.h),
                        child: GridView.builder(
                            // padding: EdgeInsets.all(10),
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 9,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.75,
                              crossAxisCount: 3,
                              // mainAxisSpacing: 1.9*SizeConfig.widthMultiplier,
                              // //childAspectRatio: 1,
                              // crossAxisSpacing: 1*SizeConfig.widthMultiplier
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, PageTransition(child: ViewZoomedImageThree(index: index,), type: PageTransitionType.fade));
                                  model.notifyListeners();
                                },
                                child: Container(
                                  // margin: EdgeInsets.only(bottom: 2.h),
                                  color: ColorUtils.redColorExpiresIn,
                                  child: Image.asset(
                                    model.UserImages[index]['image'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}


class ViewZoomedImageThree extends StatefulWidget {
  final int? index;
  const ViewZoomedImageThree({Key? key,this.index}):super(key:key);
  @override
  _ViewZoomedImageThreeState createState() => _ViewZoomedImageThreeState();
}

class _ViewZoomedImageThreeState extends State<ViewZoomedImageThree> {
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    model.navigationService.back();
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 1.7.w, top: 3.h),
                    padding: EdgeInsets.all(13),
                    //height: 10.h,
                    decoration: BoxDecoration(
                      color: ColorUtils.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child:
                    // Icon(Icons.arrow_back_ios,
                    // size: 5.i,
                    //   color: ColorUtils.grey,
                    // ),
                    Image.asset(ImageUtils.iconBack,
                      height: 5.i,
                    ),
                    // SvgPicture.asset(ImageUtils.backArrow),
                    // height: 10.i,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      child: PhotoViewGallery.builder(
                        itemCount: model.UserImages.length,
                        pageController: pageController,
                        builder: (context, index) {
                          return  PhotoViewGalleryPageOptions(
                            imageProvider: AssetImage(model.UserImages[index]['image']),
                            initialScale: PhotoViewComputedScale.contained * 1,
                            //heroAttributes: PhotoViewHeroAttributes(tag: galleryItems[index].id),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => locator<MainViewModel>(),
      onModelReady: (model){
        Future.delayed(Duration(milliseconds: 100)).then((value)async{
          pageController.jumpToPage(widget.index!);
        });
      },
      disposeViewModel: false,
    );
  }
}
