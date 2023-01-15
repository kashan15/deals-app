import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/widgets/rating_widget.dart';
import 'package:deals_app/widgets/rating_widget_one.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class LocationBottomSheetOne extends StatefulWidget {
  const LocationBottomSheetOne({Key? key}) : super(key: key);

  @override
  _LocationBottomSheetOneState createState() => _LocationBottomSheetOneState();
}

class _LocationBottomSheetOneState extends State<LocationBottomSheetOne> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      onModelReady: (model) {
      },
      disposeViewModel: false,
      builder: (context, model, child) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          height: 45.h,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 1.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Divider(
                    color: ColorUtils.grey,
                    thickness: 3,
                  ),
                ),
                SizedBox(height: 1.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // SizedBox(width: 5.w,),
                    TextWidget(
                      textTitle: Constants.selectLocation,
                      color: ColorUtils.textColor,
                      fontSize: 2.t,
                      fontFamily: FontUtils.PoppinsMedium,
                    ),
                    SizedBox(width: 42.w,),
                    GestureDetector(
                      onTap: (){
                        model.navigationService.back();
                      },
                      child: TextWidget(
                        textTitle: Constants.cancel,
                        color: ColorUtils.lightBlueCancel,
                        fontSize: 1.8.t,
                        fontFamily: FontUtils.PoppinsRegular,
                      ),
                    ),
                    TextWidget(
                      textTitle: Constants.selectLocation,
                      color: ColorUtils.textColor,
                      fontSize: 0.t,
                      fontFamily: FontUtils.PoppinsMedium,
                    ),
                  ],
                ),
                SizedBox(height: 2.h,),

                Divider(
                  color: ColorUtils.grey.withOpacity(0.2),
                ),
                SizedBox(height: 2.h,),

                Container(
                  height: 7.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(10),
                      color: ColorUtils.grey2.withOpacity(0.6)),
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 4.w),
                            child: Icon(
                              Icons.search,
                              color: ColorUtils.grey.withOpacity(0.6),
                            )),
                        Expanded(
                          child: TextField(
                            style: CustomTheme
                                .searchtextfeild,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search here...",
                              hintStyle: TextStyle(
                                fontSize: 2.t,
                                fontFamily: FontUtils.PoppinsMedium,
                                color: ColorUtils.grey.withOpacity(0.6),
                              ),
                              // CustomTheme
                              //     .searchtextfeild,


                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

                // SizedBox(height: 2.h,),
                // Container(
                //   height: 5.h,
                //   width: double.infinity,
                //   child: ListView.builder(
                //       padding: EdgeInsets.zero,
                //       shrinkWrap: true,
                //       itemCount: model.Locationtabbar.length,
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) {
                //         return Row(
                //           // mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             GestureDetector(
                //               onTap: () {
                //                 model.selectOne = index;
                //                 model.notifyListeners();
                //               },
                //               child: Container(
                //                   padding:
                //                   EdgeInsets.symmetric(
                //                       horizontal: 3.w),
                //                   margin: EdgeInsets.only(right: 3.w),
                //                   height: 5.h,
                //                   // margin: EdgeInsets.only(
                //                   //     left: 5.w),
                //                   decoration: BoxDecoration(
                //
                //                       gradient:
                //                       LinearGradient(
                //                           colors: [
                //                             model.selectOne == index
                //                                 ? ColorUtils
                //                                 .gradientcolor1
                //                                 : ColorUtils
                //                                 .white,
                //                             model.selectOne == index
                //                                 ? ColorUtils
                //                                 .gradientcolor2
                //                                 : ColorUtils
                //                                 .white,
                //                           ],
                //                           begin: Alignment
                //                               .bottomLeft,
                //                           end: Alignment
                //                               .topRight,
                //                           stops: [
                //                             0.1,
                //                             0.6
                //                           ]),
                //                       borderRadius:
                //                       BorderRadius
                //                           .circular(20),
                //                       border: Border.all(
                //                         color: model.selectOne == index
                //                             ? ColorUtils.white
                //                             : ColorUtils.grey2,
                //                       )
                //                   ),
                //
                //                   child: Center(
                //                     child: Text(
                //                         model.Locationtabbar[index]
                //                         ["tab"],
                //                         style:
                //                         TextStyle(
                //                           fontSize: 2.t,
                //                           fontFamily: model.selectOne == index ?
                //                           FontUtils.PoppinsMedium
                //                               : FontUtils.PoppinsRegular,
                //                           color: model.selectOne == index
                //                               ? ColorUtils.white
                //                               : ColorUtils.grey,
                //                         )),
                //                   )),
                //             ),
                //
                //             // SizedBox(width: 2.w,)
                //           ],
                //         );
                //       }),
                // ),

                // SizedBox(height: 2.h,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text("Sort by:",
                //       style: TextStyle(
                //           color: ColorUtils.grey,
                //           fontFamily: FontUtils.PoppinsSemibold
                //       ),
                //     ),
                //     SizedBox(width: 2.w,),
                //     Container(
                //       child: Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children:[
                //             Text("A - Z",
                //               style: TextStyle(
                //                   color: ColorUtils.gradientcolor2,
                //                   fontFamily: FontUtils.PoppinsSemibold
                //               ),
                //             ),
                //             // Icon(Icons.arrow_drop_down)
                //             SizedBox(width: 1.w,),
                //             SvgPicture.asset(ImageUtils.Down1)
                //           ]),
                //     )
                //   ],
                // ),

                SizedBox(height: 2.h,),
            Container(
              decoration: BoxDecoration(
                  color: ColorUtils.white,
                  boxShadow: [
                    BoxShadow(
                      color: ColorUtils.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 9,
                      offset: Offset(5,0), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Container(
                    height: 10.5.h,
                    width: 18.w,
                    margin: EdgeInsets.only(
                        bottom: 0.8.h),
                    padding:
                    EdgeInsets.all(0.8.w),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              ColorUtils.gradientcolor1,
                              ColorUtils.gradientcolor2,
                            ],
                            stops: [
                              0.1,
                              0.6
                            ]),
                        shape: BoxShape.circle
                    ),
                    child:
                    CircleAvatar(
                      backgroundColor: ColorUtils.white,
                      child: CircleAvatar(
                        backgroundColor: ColorUtils.white,
                        radius: 30,
                        backgroundImage:
                        // AssetImage(ImageUtils.slider),
                        AssetImage(ImageUtils.Sheet3),
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 1.5.h,),
                      Container(
                        margin: EdgeInsets.only(bottom: 1.h),
                        child: TextWidget(
                          textTitle: Constants.hotelTitle,
                          fontSize: 1.9.t,
                          color: ColorUtils.textColor,
                          fontFamily: FontUtils.PoppinsSemibold,
                        ),
                      ),

                      // SizedBox(height: 0.8.h,),
                      Container(
                        // width: 70.w,
                        child: TextWidget(
                          textTitle: Constants.resturantAddress4,
                          fontSize: 1.5.t,
                          color: ColorUtils.grey,
                          fontFamily: FontUtils.PoppinsRegular,
                          maxLines: 2,
                          overFlow: TextOverflow.ellipsis,
                        ),
                      ),
                      // SizedBox(height: 0.5.h,),
                      // Row(
                      //   // mainAxisAlignment: MainAxisAlignment.end,
                      //     children:[
                      //       SizedBox(width: 52.w,),
                      //       Text("1 checkin",
                      //         style: TextStyle(
                      //             fontSize: 1.5.t,
                      //             fontFamily: FontUtils.PoppinsMedium,
                      //             color: ColorUtils.checkin
                      //         ),
                      //       )])
                    ],
                  ),
                  // SizedBox(width: 17.w,),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 1.h, top: 1.h),
                        child:
                        Row(
                          children:[
                            SizedBox(width: 15.w,),
                            Column(
                              children:[
                                Column(
                                children:[
                                  Center(
                                    child: Image.asset(ImageUtils.Badge,
                          height: 9.i,
                          ),
                                  ),
                                  Text("10000+",
                                  style: TextStyle(
                                    fontSize: 1.1.t,

                                  ),
                                  ),
                                  Text("Customer Votes",
                                    style: TextStyle(
                                      fontSize: 1.1.t,

                                    ),
                                  ),
                                  Row(
                                    children:[
                                      RatingWidgetOne(initialRating: 5.0,),
                                      Padding(
                                        padding: EdgeInsets.only(top: 0.2.h),
                                        child: TextWidget(
                                        textTitle: Constants.ratingPoint,
                                        color: ColorUtils.textColor,
                                        fontSize: 1.t,
                                        fontFamily: FontUtils.PoppinsSemibold,
                                    ),
                                      ),
                                  ]),

                              ]),
                            ]),
                     ] ),
                      ),

                    ],
                  )
                ],
              ),
            ),
                SizedBox(height: 2.h,),
                ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return
                        Container(

                        decoration: BoxDecoration(
                            color: ColorUtils.white,
                            boxShadow: [
                              BoxShadow(
                                color: ColorUtils.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 9,
                                offset: Offset(5,0), // changes position of shadow
                              ),
                            ],
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 10.5.h,
                              width: 18.w,
                              margin: EdgeInsets.only(
                                  bottom: 0.8.h),
                              padding:
                              EdgeInsets.all(0.8.w),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        ColorUtils.gradientcolor1,
                                        ColorUtils.gradientcolor2,
                                      ],
                                      stops: [
                                        0.1,
                                        0.6
                                      ]),
                                  shape: BoxShape.circle
                              ),
                              child: CircleAvatar(

                                backgroundColor: ColorUtils.white,
                                child: CircleAvatar(
                                  backgroundColor: ColorUtils.white,
                                  radius: 30,
                                  backgroundImage:
                                  // AssetImage(ImageUtils.slider),
                                  AssetImage(
                                      model.bottomSheetImages[index]['image']),
                                ),
                              ),
                            ),
                            SizedBox(width: 2.w,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SizedBox(height: 1.5.h,),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[
                                      Container(
                                        margin: EdgeInsets.only(bottom: 1.h),
                                        child: TextWidget(
                                          textTitle: Constants.hotelTitle3,
                                          fontSize: 1.9.t,
                                          color: ColorUtils.textColor,
                                          fontFamily: FontUtils.PoppinsSemibold,
                                        ),
                                      ),
                                      // SizedBox(width: 16.3.w,),
                                      // Row(
                                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      //     children:[
                                      //       SvgPicture.asset(ImageUtils.Location_Icon),
                                      //       SizedBox(width: 0.5.w,),
                                      //       Text(
                                      //         model.distance[index]['Distance'],
                                      //         style: TextStyle(
                                      //             fontSize: 1.5.t,
                                      //             color: ColorUtils.gradientcolor2
                                      //         ),
                                      //       )]),
                                    ]),
                                // SizedBox(height: 0.8.h,),
                                Container(
                                  width: 70.w,
                                  child: TextWidget(
                                    textTitle: Constants.resturantAddress3,
                                    fontSize: 1.5.t,
                                    color: ColorUtils.grey,
                                    fontFamily: FontUtils.PoppinsRegular,
                                    maxLines: 2,
                                    overFlow: TextOverflow.ellipsis,
                                  ),
                                ),
                                // SizedBox(height: 0.5.h,),
                                // Row(
                                //   // mainAxisAlignment: MainAxisAlignment.end,
                                //     children:[
                                //       SizedBox(width: 52.w,),
                                //       Text(model.checkIn[index]['checkin'],
                                //         style: TextStyle(
                                //             fontSize: 1.5.t,
                                //             fontFamily: FontUtils.PoppinsMedium,
                                //             color: ColorUtils.checkin
                                //         ),
                                //       )])
                              ],
                            ),
                          ],
                        ),
                      );
                    }, separatorBuilder: (context,index)=>SizedBox(height: 2.h,),
                    itemCount: 3)


              ],
            ),
          ),
        );
      },
    );
  }
}
