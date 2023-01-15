import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:deals_app/views/location.dart';
import 'package:deals_app/widgets/button_gradient.dart';
import 'package:deals_app/widgets/custom_container_interest_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../utils/image_utils.dart';
import '../../viewmodels/main_viewmodel.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({Key? key}) : super(key: key);

  @override
  _InterestScreenState createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
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
                body: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          height: 12.h,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(Constants.interest,
                                      style: CustomTheme.heading)),
                              Positioned(
                                  left: 36.5.w,
                                  bottom: 2.8.h,
                                  child: SvgPicture.asset(ImageUtils.loginIcon))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Text(
                          Constants.pleaseSelectInterest,
                          textAlign: TextAlign.left,
                          style: CustomTheme.semiheading,
                        ),

                        // SizedBox(
                        //   height: 2.h,
                        // ),

                        //TODO:
                        ///For the Time Period Making Static
                        // Container(
                        //   height: 40.h,
                        //
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Container(
                        //         height: 24.h,
                        //         width: 40.w,
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(30),
                        //           image: DecorationImage(
                        //               image: AssetImage(
                        //                   ImageUtils.interestScreen1),
                        //               fit: BoxFit.fill),
                        //         ),
                        //         child: Stack(
                        //           children: [
                        //             Positioned(
                        //               top: 0.h,
                        //               bottom: 18.h,
                        //               right: 0,
                        //               left: 0,
                        //               child: Container(
                        //                 decoration: BoxDecoration(
                        //                   color:
                        //                       ColorUtils.black.withOpacity(0.2),
                        //                 ),
                        //               ),
                        //             ),
                        //             Positioned(
                        //               top: 3.h,
                        //               bottom: 15.h,
                        //               right: 0,
                        //               left: 36.w,
                        //               child: GestureDetector(
                        //                 // onTap: () {
                        //                 //   model.interestScreen[widget.index]["isChecked"] =
                        //                 //       !model.interestScreen[widget.index]["isChecked"];
                        //                 //   model.notifyListeners();
                        //                 // },
                        //                 child: Container(
                        //                   decoration: BoxDecoration(
                        //                     shape: BoxShape.circle,
                        //                     gradient: LinearGradient(colors: [
                        //                       ColorUtils.gradientcolor1,
                        //                       ColorUtils.gradientcolor2,
                        //                     ]),
                        //                     // gradient: LinearGradient(
                        //                     //     colors: model.interestScreen[widget.index]
                        //                     //             ["isChecked"]
                        //                     //         ? [
                        //                     //             ColorUtils.gradientcolor1,
                        //                     //             ColorUtils.gradientcolor2,
                        //                     //           ]
                        //                     //         : [
                        //                     //             ColorUtils.white,
                        //                     //             ColorUtils.white,
                        //                     //           ],
                        //                     //     begin: Alignment.topLeft,
                        //                     //     end: Alignment.bottomLeft),
                        //
                        //                     border: Border.all(
                        //                         color: ColorUtils.black),
                        //                     // border: Border.all(
                        //                     //     color: model.interestScreen[widget.index]
                        //                     //             ["isChecked"]
                        //                     //         ? Colors.transparent
                        //                     //         : ColorUtils.black),
                        //                   ),
                        //                   child: SvgPicture.asset(
                        //                     ImageUtils.tickRound,
                        //                     color: ColorUtils.black,
                        //                   ),
                        //
                        //                   // child: model.interestScreen[widget.index]["isChecked"]
                        //                   //     ? SvgPicture.asset(
                        //                   //         ImageUtils.tickRound,
                        //                   //         color: ColorUtils.black,
                        //                   //       )
                        //                   //     : Container(),
                        //                 ),
                        //               ),
                        //             ),
                        //             //Checkbox(value: null, onChanged: (bool) {}),
                        //           ],
                        //         ),
                        //       ),
                        //       Container(
                        //         height: 15.h,
                        //         width: 40.w,
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(30),
                        //           image: DecorationImage(
                        //               image: AssetImage(
                        //                   ImageUtils.interestScreen1),
                        //               fit: BoxFit.fill),
                        //         ),
                        //         child: Stack(
                        //           children: [
                        //             Positioned(
                        //               top: 0.h,
                        //               bottom: 18.h,
                        //               right: 0,
                        //               left: 0,
                        //               child: Container(
                        //                 decoration: BoxDecoration(
                        //                   color:
                        //                       ColorUtils.black.withOpacity(0.2),
                        //                 ),
                        //               ),
                        //             ),
                        //             Positioned(
                        //               top: 3.h,
                        //               bottom: 15.h,
                        //               right: 0,
                        //               left: 36.w,
                        //               child: GestureDetector(
                        //                 // onTap: () {
                        //                 //   model.interestScreen[widget.index]["isChecked"] =
                        //                 //       !model.interestScreen[widget.index]["isChecked"];
                        //                 //   model.notifyListeners();
                        //                 // },
                        //                 child: Container(
                        //                   decoration: BoxDecoration(
                        //                     shape: BoxShape.circle,
                        //                     gradient: LinearGradient(colors: [
                        //                       ColorUtils.gradientcolor1,
                        //                       ColorUtils.gradientcolor2,
                        //                     ]),
                        //                     // gradient: LinearGradient(
                        //                     //     colors: model.interestScreen[widget.index]
                        //                     //             ["isChecked"]
                        //                     //         ? [
                        //                     //             ColorUtils.gradientcolor1,
                        //                     //             ColorUtils.gradientcolor2,
                        //                     //           ]
                        //                     //         : [
                        //                     //             ColorUtils.white,
                        //                     //             ColorUtils.white,
                        //                     //           ],
                        //                     //     begin: Alignment.topLeft,
                        //                     //     end: Alignment.bottomLeft),
                        //
                        //                     border: Border.all(
                        //                         color: ColorUtils.black),
                        //                     // border: Border.all(
                        //                     //     color: model.interestScreen[widget.index]
                        //                     //             ["isChecked"]
                        //                     //         ? Colors.transparent
                        //                     //         : ColorUtils.black),
                        //                   ),
                        //                   child: SvgPicture.asset(
                        //                     ImageUtils.tickRound,
                        //                     color: ColorUtils.black,
                        //                   ),
                        //
                        //                   // child: model.interestScreen[widget.index]["isChecked"]
                        //                   //     ? SvgPicture.asset(
                        //                   //         ImageUtils.tickRound,
                        //                   //         color: ColorUtils.black,
                        //                   //       )
                        //                   //     : Container(),
                        //                 ),
                        //               ),
                        //             ),
                        //             //Checkbox(value: null, onChanged: (bool) {}),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        //
                        //   ///
                        //   // child: Row(
                        //   //   children: [
                        //   //     Column(
                        //   //       children: [
                        //   //         CustomContainerInterestScreen(index: 1),
                        //   //         CustomContainerInterestScreen(index: 1),
                        //   //       ],
                        //   //     ),
                        //   //     Column(
                        //   //       children: [
                        //   //         CustomContainerInterestScreen(index: 1),
                        //   //         CustomContainerInterestScreen(index: 1),
                        //   //       ],
                        //   //     )
                        //   //   ],
                        //   // ),
                        // ),

                        //TODO:
                        ///
                        /// .
                        GridView.custom(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverWovenGridDelegate.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 14,
                            pattern: [
                              WovenGridTile(
                                5 / 7,
                              ),
                              WovenGridTile(0.9),
                            ],
                          ),
                          childrenDelegate: SliverChildBuilderDelegate(
                            (context, index) =>
                                CustomContainerInterestScreen(index: index),
                            childCount: model.interestScreen.length,
                          ),
                        ),


                        ///Row
                      //   Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     // crossAxisAlignment: CrossAxisAlignment.start,
                      //     children:[
                      //       Column(
                      //         children:[
                      //           Container(
                      //             // height: 20.h,
                      //             color: ColorUtils.redColorExpiresIn,
                      //             child: ClipRRect(
                      //         borderRadius: BorderRadius.circular(20),
                      //         child: Image.asset(ImageUtils.interestScreen1,
                      //         height: 60.i,
                      //             fit: BoxFit.contain,
                      //         ),
                      //     ),
                      //           ),
                      //
                      //   SizedBox(height: 2.h,),
                      //   ClipRRect(
                      //     borderRadius: BorderRadius.circular(20),
                      //     child: Image.asset(ImageUtils.interestScreen3,
                      //       height: 36.i,
                      //       fit: BoxFit.contain,
                      //     ),
                      //   ),
                      //           ]),
                      //       // SizedBox(width: 2.w,),
                      //
                      //       Column(
                      //           children:[
                      //             ClipRRect(
                      //               borderRadius: BorderRadius.circular(20),
                      //               child: Image.asset(ImageUtils.interestScreen2,
                      //                 height: 36.i,
                      //                 fit: BoxFit.contain,
                      //               ),
                      //             ),
                      //
                      //             SizedBox(height: 2.h,),
                      //
                      //             ClipRRect(
                      //               borderRadius: BorderRadius.circular(20),
                      //               child: Image.asset(ImageUtils.interestScreen4,
                      //                 height: 60.i,
                      //                 fit: BoxFit.contain,
                      //               ),
                      //             ),
                      //           ]),
                      // ]),



                        ///Extra
                       //  Column(
                       //    crossAxisAlignment: CrossAxisAlignment.start,
                       //    children:[
                       //      Row(
                       //      mainAxisAlignment: MainAxisAlignment.start,
                       //      // crossAxisAlignment: CrossAxisAlignment.start,
                       //      children: [
                       //        Image.asset(ImageUtils.interestScreen1,
                       //        height: 70.i,
                       //        ),
                       //      ],
                       //    ),
                       // ] ),

                        ///Extra1
                        // Container(
                        //   height: 55.h,
                        //   color: ColorUtils.redColorExpiresIn,
                        //   child: Row(
                        //     children: [
                        //       Column(
                        //         children: [
                        //           Container(
                        //             height: 25.h,
                        //             margin: EdgeInsets.only(bottom: 2.h, left: 0.w),
                        //             child: Image.asset(ImageUtils.interestScreen1,
                        //             height: 60.i,
                        //               fit: BoxFit.contain,
                        //             ),
                        //           ),
                        //         ],
                        //       )
                        //     ],
                        //   ),
                        // ),

                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          height: 20.h,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(ImageUtils.interestScreen5),
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        ButtonGradient(title: "Continue",

                          onPressed: () {
                            model.navigationService
                                .navigateTo(to: LocationScreen());
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
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
