import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/widgets/container_shadow.dart';
import 'package:deals_app/widgets/rating_widget.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../app/locator.dart';
import '../viewmodels/main_viewmodel.dart';
import 'newContainer_shadow.dart';

class ResturantWidget extends StatefulWidget {
  dynamic image;
  dynamic image2;
  dynamic location;
  void Function()? onTap;
  ResturantWidget({this.image, this.onTap, this.image2, this.location});

  @override
  State<ResturantWidget> createState() => _ResturantWidgetState();
}

class _ResturantWidgetState extends State<ResturantWidget> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      // onModelReady: (data) => print(data.pickedImage.path),
      builder: (context, model, child) {
        return GestureDetector(
          onTap: widget.onTap,
          child: newContainerShadow(
            width: 80.w,
            padding: EdgeInsets.all(5.0),
            margin:
                EdgeInsets.only(left: 0.3.w, right: 5.w, bottom: 1.h, top: 1.h),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [

                    Container(
                      width: 78.w,
                      height: 17.h,
                      // height: 20.h,
                      // color: ColorUtils.redColorExpiresIn,
                      decoration: BoxDecoration(
                        // color: ColorUtils.redColorExpiresIn,
                        borderRadius: BorderRadius.circular(3.w),
                        // borderRadius: BorderRadius.circular(0.w,
                        //),
                      ),
                      child:
                      Stack(
                        children: [
                          Image.asset(
                            widget.image,
                            fit: BoxFit.fill,
                          ),
                          widget.image2 == null
                              ? Container()
                              :
                          // Align(
                          //         alignment: Alignment.bottomLeft,
                          //         child: Container(
                          //             margin: EdgeInsets.symmetric(
                          //                 vertical: 5.h, horizontal: 5.w),
                          //             height: 5.h,
                          //             width: 10.w,
                          //             // color: Colors.blue,
                          //
                          //             child: Image.asset(widget.image2,
                          //             )
                          //             // Image.asset(model.clothing[index]['']),
                          //
                          //             ),
                          //       )

                          Positioned(
                            top: 11.h,
                            left: 3.w,
                            child: Image.asset(widget.image2,
                              height: 11.i,
                            ),
                          )
                        ],
                      ),

                      // image: DecorationImage(
                      //     image: AssetImage(image,),
                      //     fit: BoxFit.fill),

                      // child: Image.asset(
                      //   image,
                      //   height: 20.h,
                      // ),
                    ),

                    // CircleAvatar(
                    //   backgroundColor: ColorUtils.black,
                    //   child: Center(
                    //     child: Container(
                    //       height: 2.2.h,
                    //       width: 7.w,
                    //       color: ColorUtils.white,
                    //       child: Text("WET DECK",
                    //         style: TextStyle(
                    //           color: ColorUtils.black,
                    //           fontSize: 0.8.t,
                    //           fontFamily: FontUtils.PoppinsSemibold,
                    //           // letterSpacing: 0.5,
                    //           // wordSpacing: 0.1
                    //         ),
                    //       ),
                    //     )
                    //     // Text("WET DECK",
                    //     // style: TextStyle(
                    //     //   color: ColorUtils.white,
                    //     //   fontSize: 1.4.t,
                    //     //   fontFamily: FontUtils.PoppinsSemibold,
                    //     //   // letterSpacing: 0.5,
                    //     //   // wordSpacing: 0.1
                    //     // ),
                    //     // ),
                    //   ),
                    // ),

                    /// Logo
                    // Positioned(
                    //   top: 11.h,
                    //   left: 3.w,
                    //   child: Image.asset(ImageUtils.nearLogo,
                    //   height: 11.i,
                    //   ),
                    // )
                  ]),

                  SizedBox(height: 1.h),
                  TextWidget(
                    textTitle: widget.location,
                    color: ColorUtils.textColor,
                    fontFamily: FontUtils.PoppinsSemibold,
                    // fontSize: 2.5.t,
                    fontSize: 2.2.t,
                  ),
                  Container(
                    width: 85.w,
                    child: TextWidget(
                      textTitle: Constants.resturantAddress2,
                      color: ColorUtils.grey,
                      fontFamily: FontUtils.PoppinsRegular,
                      fontSize: 1.4.t,
                      overFlow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 0.5.h,),
                  Row(
                    children: [
                      SizedBox(
                        width: 0.w,
                      ),
                      Row(
                        children: [
                          RatingWidget(
                            initialRating: 4.5,
                          ),
                          SizedBox(width: 1.w,),
                          TextWidget(
                            textTitle: Constants.ratingPoint,
                            fontSize: 1.6.t,
                            fontFamily: FontUtils.PoppinsRegular,
                            color: ColorUtils.textColor,
                          ),
                          SizedBox(width: 1.w,),
                          TextWidget(
                            textTitle: Constants.ratingPoint1,
                            fontSize: 1.6.t,
                            fontFamily: FontUtils.PoppinsRegular,
                            color: ColorUtils.textColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h,),
                  Row(
                    children: [
                      TextWidget(
                        textTitle: Constants.cutPriceCustom,
                        color: ColorUtils.grey,
                        fontSize: 1.7.t,
                        fontFamily: FontUtils.PoppinsMedium,
                        decoration: TextDecoration.lineThrough,
                      ),
                      SizedBox(
                        width: 1.5.w,
                      ),
                      TextWidget(
                        textTitle: Constants.from,
                        color: ColorUtils.gradientColor2,
                        fontSize: 1.7.t,
                        fontFamily: FontUtils.PoppinsMedium,
                      ),
                      SizedBox(
                        width: 1.5.w,
                      ),
                      TextWidget(
                        textTitle: Constants.cutPrice1Custom,
                        color: ColorUtils.gradientcolor2,
                        fontSize: 2.t,
                        fontFamily: FontUtils.PoppinsSemibold,
                      ),
                      SizedBox(
                        // width: 2.5.w,
                        width: 3.w,
                      ),
                      Container(
                        width: 21.w,
                        height: 3.3.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorUtils.gradientColor2),
                          borderRadius: BorderRadius.circular(5),
                          color: ColorUtils.gradientColor2.withOpacity(0.1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(0.5),
                          child: Row(
                            children: [
                              SizedBox(width: 1.5.w,),
                              Image.asset(
                                ImageUtils.discount,
                                height: 2.h,
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              TextWidget(
                                textTitle: Constants.off,
                                color: ColorUtils.gradientColor,
                                fontSize: 1.5.t,
                                fontFamily: FontUtils.PoppinsRegular,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  TextWidget(
                    textTitle: Constants.hotelCountry,
                    color: ColorUtils.black,
                    fontFamily: FontUtils.PoppinsRegular,
                    fontSize: 1.7.t,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
    );
  }
}
