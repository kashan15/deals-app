import 'dart:async';

import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/contact_us.dart';
import 'package:deals_app/views/friend/chatScreen.dart';
import 'package:deals_app/views/friend/friends_profile.dart';
import 'package:deals_app/views/group_photos.dart';
import 'package:deals_app/views/notification/noti_resturant.dart';
import 'package:deals_app/views/reviews_one.dart';
import 'package:deals_app/views/search_map_screen.dart';
import 'package:deals_app/views/search_map_screen_one.dart';
import 'package:deals_app/views/search_map_screen_two.dart';
import 'package:deals_app/views/user_profile.dart';
import 'package:deals_app/widgets/booking_bottom_sheet.dart';
import 'package:deals_app/widgets/container_shadow.dart';
import 'package:deals_app/widgets/dialog_screen.dart';
import 'package:deals_app/widgets/location_bottom_sheet.dart';
import 'package:deals_app/widgets/location_bottom_sheet_one.dart';
import 'package:deals_app/widgets/rating_widget.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';

class SearchDetails extends StatefulWidget {

  SearchDetails({Key? key}) : super(key: key);

  @override
  State<SearchDetails> createState() => _SearchDetails();
}

class _SearchDetails extends State<SearchDetails> {
  bool likebutton = true;
  bool likebutton1 = true;

  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.428796133580664, -122.085749655962 ),
      zoom: 14.4746
  );

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.resturantselect = 0;
        model.selectIcon = 0;
      },
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
                        height: 80.h,
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
                      margin: EdgeInsets.only(top: 17.h),
                      child:
                      Card(
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
                          child:
                          SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 2.h),
                                    child: Container(
                                      color: ColorUtils.white,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          SizedBox(height: 2.h,),
                                          GestureDetector(
                                              onTap: (){
                                                setState(() {
                                                  likebutton1 = !likebutton1;
                                                });
                                              },
                                              child: likebutton1 ?
                                              SvgPicture.asset(ImageUtils.Bookmark1):
                                              SvgPicture.asset(ImageUtils.Bookmark1,
                                              color: ColorUtils.redColorExpiresIn,
                                              )
                                          ),
                                          SizedBox(width: 3.w,),
                                          GestureDetector(
                                            onTap: (){
                                              Share.share(
                                                  "Hi there! to see the latest events download and install UDEM using this link \n ${
                                                      'https://drive.google.com/file/d/1z8B7Z7ACTaKca1z9K_5MYoWYwKzt6d2U/view?usp=sharing'}"
                                              );
                                            },
                                              child: SvgPicture.asset(ImageUtils.share)),
                                          SizedBox(width: 3.w,),
                                          GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                likebutton = !likebutton;
                                              });
                                            },
                                              child: likebutton ?
                                              SvgPicture.asset(ImageUtils.Heart1,

                                              ):
                                              SvgPicture.asset(ImageUtils.Heart1,
                                                color: ColorUtils.redColorExpiresIn,
                                              )

                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // SizedBox(height: 3.h,),
                                  Container(
                                    color: ColorUtils.white,
                                    // margin: EdgeInsets.only(bottom: 2.h),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 4.h,),
                                          child: Stack(
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
                                                          color: ColorUtils.gradientColor, width: 1.w),
                                                      shape: BoxShape.circle),
                                                  child:
                                                  CircleAvatar(
                                                    backgroundColor: ColorUtils.white,
                                                    radius: 35,
                                                    child: CircleAvatar(
                                                      radius: 32,
                                                      backgroundImage: AssetImage(ImageUtils.r1),
                                                    ),
                                                  )
                                              ),

                                              Positioned(
                                                bottom: 0.4.h,
                                                right: -2.w,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: ColorUtils.pink,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child:
                                                  Padding(
                                                    padding:  EdgeInsets.all(5),
                                                    child: Center(
                                                      child: Icon(Icons.favorite_outlined,color: ColorUtils.white,size: 2.5.h,),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 2.w, bottom: 1.h),
                                          // padding: EdgeInsets.only(left: 1.w),
                                          // margin: EdgeInsets.only(bottom: 4.h),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
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
                                                  SizedBox(width: 1.3.w,),
                                                  RatingWidget(initialRating: 4.0,),
                                                  TextWidget(
                                                    textTitle: '${Constants.ratingPoint} ${Constants.ratingPoint1}',
                                                    fontFamily: FontUtils.PoppinsRegular,
                                                    fontSize: 1.5.t,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children:[
                                                  Container(
                                                  margin: EdgeInsets.only(left: 2.w),
                                                  child: TextWidget(
                                                    textTitle: Constants.rendomText1,
                                                    fontSize: 1.8.t,
                                                    fontFamily: FontUtils.PoppinsRegular,
                                                    color: ColorUtils.gradientcolor2,
                                                  ),
                                                ),
                                                  SizedBox(width: 1.w,),
                                                  CircleAvatar(
                                                    radius: 2,
                                                    backgroundColor: ColorUtils.gradientcolor2,
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
                                              ]),
                                              Container(
                                                width: 65.w,
                                                margin: EdgeInsets.only(left: 2.w),
                                                child: TextWidget(
                                                  textTitle: Constants.resturantAddress2,
                                                  fontSize: 1.3.t,
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
                                                  fontSize: 1.4.t,
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
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                    child: ListView.builder(
                                        itemCount: 6,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemBuilder: (context,index){
                                          return  GestureDetector(
                                            onTap: (){
                                              model.selectIcon = index;
                                              model.notifyListeners();
                                              if(index == 0){
                                                model.navigationService.navigateTo(to: ContactUs());
                                              }
                                              if(index == 2){
                                                // Future.delayed(Duration(seconds: 0), () {
                                                //   showModalBottomSheet(
                                                //       isDismissible: true,
                                                //       shape: RoundedRectangleBorder(
                                                //         borderRadius: BorderRadius.only(
                                                //           topLeft: Radius.circular(20),
                                                //         topRight: Radius.circular(20),
                                                //         ),
                                                //       ),
                                                //       context: context,
                                                //       builder: (builder) {
                                                //         return LocationBottomSheetOne();
                                                //       });
                                                // });
                                                model.navigationService.navigateTo(to: SearchMapScreenOne());
                                              }
                                              if(index == 3){
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
                                                //         return LocationBottomSheet();
                                                //       });
                                                // });
                                                model.navigationService.navigateTo(to: SearchMapScreenTwo());
                                              }
                                              if(index == 1){
                                                Future.delayed(Duration(seconds: 0), () {
                                                  showModalBottomSheet(
                                                      isDismissible: true,
                                                      backgroundColor: ColorUtils.white,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(20),
                                                          topRight: Radius.circular(20),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (builder) {
                                                        return BookingBottomSheet(index: 0,);
                                                      });
                                                });
                                              }
                                              if(index == 4){
                                               model.enterDetailsOpenCamera();
                                                model.notifyListeners();
                                              }
                                              if(index == 5){
                                                showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return DialogScreen(
                                                          title: "Add New Location",
                                                          btnTxt: "Add Location",
                                                          icon: ImageUtils.Sheet3
                                                      );
                                                    });
                                              }
                                            },
                                            child: Container(
                                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                // color:model.selectIcon== index?
                                                // ColorUtils.gradientColor
                                                //     : ColorUtils.grey.withOpacity(0.13),
                                                gradient: LinearGradient(
                                                    colors: [
                                                      model.selectIcon == index
                                                          ? ColorUtils.gradientcolor1
                                                          : ColorUtils.white,
                                                      model.selectIcon == index
                                                          ? ColorUtils.gradientcolor2
                                                          : ColorUtils.grey.withOpacity(0.13),
                                                    ],
                                                    begin: Alignment.bottomLeft,
                                                    end: Alignment.topRight,
                                                    stops: [
                                                      model.selectIcon == index?0.1:0.0,model.selectIcon == index? 0.6:0.0]),

                                              ),
                                              child: Padding(
                                                padding:  EdgeInsets.all(10),
                                                child: Center(
                                                  child:
                                                  //Icon(model.generalIcon[index]['icon'],size: 3.5.h,color:model.selectIcon==index? ColorUtils.white:ColorUtils.gradientColor),
                                                  SvgPicture.asset(model.generalIcon[index]['icon'],
                                                      height: 3.5.h,color:model.selectIcon==index? ColorUtils.white:ColorUtils.gradientColor),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                  Divider(),
                                  SizedBox(height: 1.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                        textTitle:Constants.photos,
                                        color: ColorUtils.textColor,
                                        fontSize: 2.t,
                                        fontFamily: FontUtils.PoppinsSemibold,
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          model.navigationService.navigateTo(to: AllGroupPhotos());
                                        },
                                        child: TextWidget(
                                          textTitle:Constants.seeAll,
                                          color: ColorUtils.gradientColor,
                                          fontSize: 2.t,
                                          fontFamily: FontUtils.PoppinsRegular,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2.h,),
                                  SizedBox(
                                    height: 25.h,
                                    child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 3,
                                        shrinkWrap: true,
                                        itemBuilder: (context,index){
                                          return Container(
                                              margin: EdgeInsets.only(right: 4.w),
                                              child:
                                              //Image.asset(ImageUtils.r1,height: 20.h,fit: BoxFit.cover,));
                                              GestureDetector(
                                                onTap: (){
                                                  Navigator.push(context, PageTransition(child: ViewZoomedImageOne(index: index,), type: PageTransitionType.fade));
                                                  model.notifyListeners();
                                                },
                                                child: Image.asset(model.groupPhotos[index]['image'],
                                                  height: 20.h,fit: BoxFit.cover,),
                                              ));
                                        },
                                    ),
                                  ),

                                  SizedBox(height: 2.h,),

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
                                                  if(index == 3){
                                                    model.navigationService.navigateTo(to: AllReviews());
                                                  }
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
                                                        borderRadius: BorderRadius.circular(20),
                                                    border: Border.all(
                                                      color: model.resturantselect == index
                                                          ? ColorUtils.white
                                                          : ColorUtils.grey2,
                                                    )
                                                    ),
                                                    child: Center(
                                                      child: Text(model.resturantTabbar[index]["tab"],
                                                          style:
                                                          TextStyle(
                                                            fontSize: 2.t,
                                                            fontFamily: model.resturantselect == index ?
                                                            FontUtils.PoppinsMedium
                                                            : FontUtils.PoppinsRegular,
                                                            color: model.resturantselect == index
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
                                  SizedBox(height: 2.h,),
                                  SizedBox(
                                    height: 5.h,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: model.delivery.length,
                                        itemBuilder: (context,index){
                                          return Padding(
                                            padding:  EdgeInsets.only(right: 5.w),
                                            child: Row(
                                              children: [
                                                Icon(Icons.check,color: Colors.green,size: 2.4.h,),
                                                SizedBox(width: 1.w,),
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
                                  SizedBox(height: 2.h,),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on,color: ColorUtils.textColor,),
                                      SizedBox(width: 2.w,),
                                      Container(
                                        width: 80.w,
                                        child: TextWidget(
                                           textTitle: Constants.resturantAddress,
                                          maxLines: 2,
                                          fontFamily: FontUtils.PoppinsMedium,
                                          fontSize: 1.5.t,
                                          color: ColorUtils.textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2.h,),
                                  Row(
                                    children: [
                                      Icon(Icons.watch_later,color: ColorUtils.textColor,),
                                      SizedBox(width: 2.w,),
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
                                      SizedBox(width: 2.w,),

                                    ],
                                  ),
                                  SizedBox(height: 2.h,),

                                  TextWidget(
                                    textTitle: Constants.offers,
                                    color: ColorUtils.textColor,
                                    fontSize: 2.t,
                                    fontFamily: FontUtils.PoppinsSemibold,
                                  ),
                                  SizedBox(height: 2.h,),

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
                                  SizedBox(height: 2.h,),

                                  SizedBox(
                                    height: 25.h,
                                    child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: 3,
                                        itemBuilder: (context,index){
                                          return GestureDetector(
                                            onTap: (){
                                              model.selectHourly = index;
                                              model.notifyListeners();
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(right: 4.w),
                                              height: 25.h,
                                              width: 45.w,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                // color:model.selectHourly==index ?
                                                // ColorUtils.gradientColor :ColorUtils.grey.withOpacity(0.1),1

                                                gradient: LinearGradient(
                                                    colors: [
                                                      model.selectHourly == index
                                                          ? ColorUtils.gradientcolor1
                                                          : ColorUtils.white,
                                                      model.selectHourly == index
                                                          ? ColorUtils.gradientcolor2
                                                          : ColorUtils.grey2,
                                                    ],
                                                    begin: Alignment.bottomLeft,
                                                    end: Alignment.topRight,
                                                    stops: [
                                                      model.selectHourly == index?0.1:0.0,model.selectHourly == index? 0.6:0.0]),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            TextWidget(
                                                              textTitle: Constants.percent,
                                                              color:model.selectHourly==index? ColorUtils.white:ColorUtils.textColor,
                                                              fontSize: 4.t,
                                                              fontFamily: FontUtils.PoppinsSemibold,
                                                            ),
                                                            SizedBox(width: 1.w,),
                                                            Container(
                                                              margin: EdgeInsets.only(top: 1.h),
                                                              child: TextWidget(
                                                                textTitle: Constants.oFF,
                                                                color:model.selectHourly==index? ColorUtils.white:ColorUtils.textColor,
                                                                fontSize: 1.4.t,
                                                                fontFamily: FontUtils.PoppinsMedium,
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
                                                                  Icon(Icons.watch_later_outlined,color:model.selectHourly==index? ColorUtils.white:ColorUtils.grey,size: 2.h,),
                                                                  SizedBox(width: 1.w,),
                                                                  TextWidget(
                                                                    textTitle: Constants.expireIn,
                                                                    color:model.selectHourly==index? ColorUtils.white:ColorUtils.grey,
                                                                    fontSize: 1.3.t,
                                                                    fontFamily: FontUtils.PoppinsRegular,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets.only(right: 7.w),
                                                              decoration: BoxDecoration(
                                                                  color:model.selectHourly==index? ColorUtils.white:ColorUtils.white,
                                                                  borderRadius: BorderRadius.circular(20)
                                                              ),
                                                              child: Padding(
                                                                padding:  EdgeInsets.all(3.0),
                                                                child: Center(
                                                                  child: TextWidget(
                                                                    textTitle: Constants.timeInSeconds,
                                                                    color: ColorUtils.gradientColor,
                                                                    fontFamily: FontUtils.PoppinsRegular,
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
                                                      color:model.selectHourly==index?  ColorUtils.white:ColorUtils.grey,
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
                                  SizedBox(height: 2.h,),

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
                                  SizedBox(height: 2.h,),

                                  SizedBox(
                                    height: 25.h,
                                    child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: 3,
                                        itemBuilder: (context,index){
                                          return GestureDetector(
                                            onTap: (){
                                              model.selectDaily = index;
                                              model.notifyListeners();
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(right: 4.w),
                                              height: 25.h,
                                              width: 45.w,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                //color:model.selectDaily==index? ColorUtils.gradientColor:ColorUtils.grey.withOpacity(0.1),
                                                gradient: LinearGradient(
                                                    colors: [
                                                      model.selectDaily == index
                                                          ? ColorUtils.gradientcolor1
                                                          : ColorUtils.white,
                                                      model.selectDaily == index
                                                          ? ColorUtils.gradientcolor2
                                                          : ColorUtils.grey2,
                                                    ],
                                                    begin: Alignment.bottomLeft,
                                                    end: Alignment.topRight,
                                                    stops: [
                                                      model.selectDaily == index?0.1:0.0,model.selectDaily == index? 0.6:0.0]),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            TextWidget(
                                                              textTitle: Constants.percent,
                                                              color:model.selectDaily==index? ColorUtils.white:ColorUtils.textColor,
                                                              fontSize: 4.t,
                                                              fontFamily: FontUtils.PoppinsSemibold,
                                                            ),
                                                            SizedBox(width: 1.w,),
                                                            Container(
                                                              margin: EdgeInsets.only(top: 1.h),
                                                              child: TextWidget(
                                                                textTitle: Constants.oFF,
                                                                color:model.selectDaily==index? ColorUtils.white:ColorUtils.textColor,
                                                                fontSize: 1.4.t,
                                                                fontFamily: FontUtils.PoppinsMedium,
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
                                                                  Icon(Icons.watch_later_outlined,color:model.selectDaily==index? ColorUtils.white:ColorUtils.grey,size: 2.h,),
                                                                  SizedBox(width: 1.w,),
                                                                  TextWidget(
                                                                    textTitle: Constants.expireIn,
                                                                    color:model.selectDaily==index? ColorUtils.white:ColorUtils.grey,
                                                                    fontSize: 1.3.t,
                                                                    fontFamily: FontUtils.PoppinsRegular,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets.only(right: 7.w),
                                                              decoration: BoxDecoration(
                                                                  color:model.selectDaily==index? ColorUtils.white:ColorUtils.white,
                                                                  borderRadius: BorderRadius.circular(20)
                                                              ),
                                                              child: Padding(
                                                                padding:  EdgeInsets.all(3.0),
                                                                child: Center(
                                                                  child: TextWidget(
                                                                    textTitle: Constants.timeInSeconds,
                                                                    color: ColorUtils.gradientColor,
                                                                    fontFamily: FontUtils.PoppinsRegular,
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
                                                      color:model.selectDaily==index?  ColorUtils.white:ColorUtils.grey,
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
                                  SizedBox(height: 2.h,),

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
                                  SizedBox(height: 2.h,),

                                  SizedBox(
                                    height: 25.h,
                                    child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: 3,
                                        itemBuilder: (context,index){
                                          return GestureDetector(
                                            onTap: (){
                                              model.selectWeekly = index;
                                              model.notifyListeners();
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(right: 4.w),
                                              height: 25.h,
                                              width: 45.w,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                //color:model.selectWeekly==index? ColorUtils.gradientColor:ColorUtils.grey.withOpacity(0.1),
                                                gradient: LinearGradient(
                                                    colors: [
                                                      model.selectWeekly == index
                                                          ? ColorUtils.gradientcolor1
                                                          : ColorUtils.white,
                                                      model.selectWeekly == index
                                                          ? ColorUtils.gradientcolor2
                                                          : ColorUtils.grey2,
                                                    ],
                                                    begin: Alignment.bottomLeft,
                                                    end: Alignment.topRight,
                                                    stops: [
                                                      model.selectWeekly == index?0.1:0.0,model.selectWeekly == index? 0.6:0.0]),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            TextWidget(
                                                              textTitle: Constants.percent,
                                                              color:model.selectWeekly==index? ColorUtils.white:ColorUtils.textColor,
                                                              fontSize: 4.t,
                                                              fontFamily: FontUtils.PoppinsSemibold,
                                                            ),
                                                            SizedBox(width: 1.w,),
                                                            Container(
                                                              margin: EdgeInsets.only(top: 1.h),
                                                              child: TextWidget(
                                                                textTitle: Constants.oFF,
                                                                color:model.selectWeekly==index? ColorUtils.white:ColorUtils.textColor,
                                                                fontSize: 1.4.t,
                                                                fontFamily: FontUtils.PoppinsMedium,
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
                                                                  Icon(Icons.watch_later_outlined,color:model.selectWeekly==index? ColorUtils.white:ColorUtils.grey,size: 2.h,),
                                                                  SizedBox(width: 1.w,),
                                                                  TextWidget(
                                                                    textTitle: Constants.expireIn,
                                                                    color:model.selectWeekly==index? ColorUtils.white:ColorUtils.grey,
                                                                    fontSize: 1.3.t,
                                                                    fontFamily: FontUtils.PoppinsRegular,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets.only(right: 7.w),
                                                              decoration: BoxDecoration(
                                                                  color:model.selectWeekly==index? ColorUtils.white:ColorUtils.white,
                                                                  borderRadius: BorderRadius.circular(20)
                                                              ),
                                                              child: Padding(
                                                                padding:  EdgeInsets.all(3.0),
                                                                child: Center(
                                                                  child: TextWidget(
                                                                    textTitle: Constants.timeInSeconds,
                                                                    color: ColorUtils.gradientColor,
                                                                    fontFamily: FontUtils.PoppinsRegular,
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
                                                      color:model.selectWeekly==index?  ColorUtils.white:ColorUtils.grey,
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

                                  SizedBox(height: 2.h,),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                        textTitle: "Check-Ins",
                                        color: ColorUtils.black,
                                        fontSize: 2.t,
                                        fontFamily: FontUtils.PoppinsSemibold,
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          model.navigationService.navigateTo(to: AllGroupPhotos());
                                        },
                                        child: TextWidget(
                                          textTitle: Constants.seeAll,
                                          color: ColorUtils.gradientColor,
                                          fontSize: 2.t,
                                          fontFamily: FontUtils.PoppinsMedium,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 2.h,),
                                  SizedBox(
                                    height: 25.h,
                                    child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: 3,
                                        itemBuilder: (context,index){
                                          return GestureDetector(
                                            onTap: (){
                                              // model.selectWeekly = index;
                                              // model.notifyListeners();
                                            },
                                            child: Container(
                                                margin: EdgeInsets.only(right: 4.w),
                                                // height: 25.h,
                                                // width: 45.w,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(16),
                                                  // color:model.selectWeekly==index? ColorUtils.gradientColor:ColorUtils.grey.withOpacity(0.1),
                                                ),
                                                child:
                                               // Image.asset(ImageUtils.r1, fit: BoxFit.fill,)
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, PageTransition(child: ViewZoomedImageOne(index: index,), type: PageTransitionType.fade));
                                                    model.notifyListeners();
                                                  },
                                                    child: Image.asset(model.groupPhotos[index]['image'], height: 20.h,fit: BoxFit.cover,))
                                            ),
                                          );
                                        }),
                                  ),

                                  SizedBox(height: 3.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                        textTitle: Constants.ratingAndReviews,
                                        color: ColorUtils.textColor,
                                        fontSize: 2.5.t,
                                        fontFamily: FontUtils.PoppinsSemibold,
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          model.navigationService.navigateTo(to: AllReviews());
                                        },
                                        child: TextWidget(
                                          textTitle: Constants.seeAll,
                                          color: ColorUtils.gradientColor,
                                          fontSize: 2.t,
                                          fontFamily: FontUtils.PoppinsMedium,
                                        ),
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
                                          RatingWidget(initialRating: 4.8,),
                                        ],
                                      ),
                                      SizedBox(width: 4.w,),
                                      Container(
                                        width: 0.4.w,
                                        height: 8.h,
                                        color: ColorUtils.grey.withOpacity(0.5),
                                      ),
                                      SizedBox(width: 8.w,),

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
                                  SizedBox(height: 2.h,),
                                  Divider(height: 0.0,),
                                  SizedBox(height: 2.h,),
                                  ListView.separated(
                                      padding: EdgeInsets.zero,
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context,index){
                                        return   Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(ImageUtils.profileImage,
                                                      height: 5.h,
                                                    ),
                                                    SizedBox(width: 1.w,),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(height: 1.h,),
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
                                        );
                                      }, separatorBuilder: (context,index)=>Divider(), itemCount: 5),
                                  SizedBox(height: 2.h,),
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
                                  SizedBox(height: 2.h,),
                                  TextWidget(
                                    textTitle: Constants.address,
                                    color: ColorUtils.textColor,
                                    fontSize: 2.5.t,
                                    fontFamily: FontUtils.PoppinsSemibold,
                                  ),
                                  SizedBox(height: 1.5.h,),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on_outlined,color: ColorUtils.gradientColor,),
                                      Container(
                                        margin: EdgeInsets.only(top: 0.5.h),
                                        width: 82.w,
                                        child: TextWidget(
                                          overFlow: TextOverflow.ellipsis,
                                          textTitle: Constants.resturantAddress2,
                                          color: ColorUtils.grey,
                                          fontSize: 1.6.t,
                                          fontFamily: FontUtils.PoppinsRegular,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3.h,),
                                  Container(
                                    height: 40.h,
                                    width: 80.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Image.asset(ImageUtils.mapImage,
                                      // height: 40.h,
                                      // width: 90.w,
                                      // fit: BoxFit.cover,
                                      fit: BoxFit.fill
                                    ),
                                  ),
                                  
                                  /// Map
                                  // Container(
                                  //   height: 40.h,
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.red,
                                  //     borderRadius: BorderRadius.circular(15),
                                  //   ),
                                  //   child: Container(
                                  //     height: 35.h,
                                  //     child:  GoogleMap(initialCameraPosition: _kGooglePlex,
                                  //       onMapCreated: (GoogleMapController controller){
                                  //         _controller.complete(controller);
                                  //       },
                                  //       compassEnabled: true,
                                  //       myLocationButtonEnabled: true,
                                  //       myLocationEnabled: true,
                                  //       zoomControlsEnabled: true,
                                  //     ),
                                  //   )
                                  //
                                  // ),












                                  SizedBox(
                                    height: 3.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        elevation: 0.0,
                        clipBehavior: Clip.antiAlias,
                      ),
                        )
                    ],
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed:(){
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
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            stops: [0.1, 0.6]),
                      ),
                      child: 
                      //Icon(Icons.message),
                      Center(
                        child: SvgPicture.asset(ImageUtils.smsIcon,
                        
                        ),
                      )
                    ),

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

class ViewZoomedImageOne extends StatefulWidget {
  final int? index;
  const ViewZoomedImageOne({Key? key,this.index}):super(key:key);
  @override
  _ViewZoomedImageOneState createState() => _ViewZoomedImageOneState();
}

class _ViewZoomedImageOneState extends State<ViewZoomedImageOne> {
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
                    // Container(
                    //   color: ColorUtils.redColorExpiresIn,
                    //   child: Icon(Icons.arrow_back_ios,
                    //     size: 5.i,
                    //     color: ColorUtils.grey,
                    //   ),
                    // ),
                    // // SvgPicture.asset(ImageUtils.backArrow),
                    //  height: 5.h,
                    Image.asset(ImageUtils.iconBack,
                      height: 5.i,
                    ),

                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      child: PhotoViewGallery.builder(
                        itemCount: model.groupPhotos.length,
                        pageController: pageController,
                        builder: (context, index) {
                          return  PhotoViewGalleryPageOptions(
                            imageProvider: AssetImage(model.groupPhotos[index]['image']),
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


