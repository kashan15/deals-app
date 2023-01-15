import 'dart:async';

import 'package:deals_app/views/home/home.dart';
import 'package:deals_app/views/login.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/main_views/main_views.dart';
import 'package:deals_app/widgets/button_gradient.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:stacked/stacked.dart';

import '../app/locator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.428796133580664, -122.085749655962 ),
      zoom: 14.4746
  );

  Location location = new Location();
  late bool _serviceEnabled;
  late LocationData _locationData;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        Future.delayed(Duration(seconds: 0), () {
          showModalBottomSheet(
              isDismissible: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              context: context,
              builder: (builder) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  height: 35.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "See what's available around you",
                        style: TextStyle(
                            fontFamily: FontUtils.PoppinsSemibold,
                            fontSize: 4.t,
                            color: ColorUtils.black),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                          "Enjoy your favorite things on deals \n with your love ones.",
                          style: TextStyle(
                              fontFamily: FontUtils.PoppinsRegular,
                              fontSize: 1.8.t,
                              color: ColorUtils.grey)),
                      SizedBox(
                        height: 2.h,
                      ),
                      ButtonGradientOne(
                        title: "Enable Location",
                        onPressed: () {
                          model.navigationService.navigateToUntil(
                              to: MainViews(
                            index: 0,
                          ));
                        },
                      ),
                      // Container(
                      //     height: 7.h,
                      //     width: double.infinity,
                      //     decoration: BoxDecoration(
                      //         gradient: LinearGradient(colors: [
                      //           ColorUtils.gradientcolor1,
                      //           ColorUtils.gradientcolor2,
                      //         ], stops: [
                      //           0.1,
                      //           0.6
                      //         ]),
                      //         borderRadius: BorderRadius.circular(10)),
                      //     child: ElevatedButton(
                      //         style: ButtonStyle(
                      //           backgroundColor: MaterialStateProperty.all(
                      //               Colors.transparent),
                      //           shadowColor: MaterialStateProperty.all(
                      //               Colors.transparent),
                      //         ),
                      //         onPressed: () {
                      //           Navigator.push(context,
                      //               MaterialPageRoute(builder: (_) => Home()));
                      //         },
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             SvgPicture.asset(ImageUtils.locationicon),
                      //             SizedBox(
                      //               width: 3.w,
                      //             ),
                      //             Text(
                      //               "Enable Location",
                      //               style: CustomTheme.buttontext,
                      //             ),
                      //           ],
                      //         ))),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Center(
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Don't Allow",
                                style: TextStyle(
                                    fontFamily: FontUtils.PoppinsMedium,
                                    fontSize: 2.t,
                                    color: ColorUtils.black),
                              )))
                    ],
                  ),
                );
              });
        });
      },
      builder: (context, model, child) {
        return
          // SafeArea(
          //   top: false,
          //   bottom: false,
          //   child: WillPopScope(
          //     onWillPop: () async {
          //       return true;
          //     },
          //     child: Scaffold(
          //         backgroundColor: ColorUtils.grey,
          //         body: Container(
          //           height: MediaQuery.of(context).size.height,
          //           width: MediaQuery.of(context).size.width,
          //           child: Image.asset(ImageUtils.mapImage2, fit: BoxFit.cover),
          //         )),
          //   ));
          SafeArea(
            top: false,
            bottom: false,
            child: WillPopScope(
              onWillPop: () async {
                return true;
              },
              child:
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Scaffold(
                    backgroundColor: ColorUtils.white,
                    body: Stack(
                        children: <Widget>[
                          GoogleMap(initialCameraPosition: _kGooglePlex,
                            onMapCreated: (GoogleMapController controller){
                              _controller.complete(controller);
                            },
                            compassEnabled: true,
                            myLocationButtonEnabled: true,
                            myLocationEnabled: true,
                            zoomControlsEnabled: true,
                          ),
                          // Container(
                          //   height: 35.h,
                          //   decoration: BoxDecoration(
                          //     gradient: LinearGradient(
                          //       colors: [
                          //         ColorUtils.gradientcolor1,
                          //         ColorUtils.gradientcolor2,
                          //       ],
                          //       begin: Alignment.topLeft,
                          //       end: Alignment.topRight,
                          //       stops: [0.1, 0.6],
                          //     ),
                          //   ),
                          //   child:Column(
                          //     children: [
                          //       SizedBox(
                          //         height: 8.h,
                          //       ),
                          //       Row(
                          //         mainAxisAlignment:
                          //         MainAxisAlignment.spaceAround,
                          //         children: [
                          //           Icon(
                          //             Icons.arrow_back,
                          //             color: ColorUtils.white,
                          //             size: 7.i,
                          //           ),
                          //           Container(
                          //             height: 6.h,
                          //             width: 80.w,
                          //             decoration: BoxDecoration(
                          //                 borderRadius:
                          //                 BorderRadius.circular(30),
                          //                 color: ColorUtils.white),
                          //             child: Container(
                          //               child: Row(
                          //                 children: [
                          //                   Container(
                          //                       margin: EdgeInsets.symmetric(
                          //                           horizontal: 4.w),
                          //                       child: Icon(
                          //                         Icons.search,
                          //                         color: ColorUtils.grey,
                          //                       )),
                          //                   Expanded(
                          //                     child: TextField(
                          //                       style: CustomTheme
                          //                           .searchtextfeild,
                          //                       decoration: InputDecoration(
                          //                         border: InputBorder.none,
                          //                         hintText: "Search here...",
                          //                         hintStyle: CustomTheme
                          //                             .searchtextfeild,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   GestureDetector(
                          //                     onTap: () {},
                          //                     child: Container(
                          //                         margin: EdgeInsets.only(
                          //                             right: 3.w),
                          //                         child: Icon(
                          //                           Icons.cancel,
                          //                           color: ColorUtils.grey,
                          //                           size: 4.i,
                          //                         )),
                          //                   )
                          //                 ],
                          //               ),
                          //             ),
                          //           )
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          //
                          // ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //       borderRadius:
                          //       BorderRadius.only(topLeft: Radius.circular(50))),
                          //   width: MediaQuery.of(context).size.width,
                          //   margin: EdgeInsets.only(top: 18.h),
                          //   child: Card(
                          //     margin: EdgeInsets.zero,
                          //     borderOnForeground: false,
                          //     color: ColorUtils.white,
                          //     shadowColor: ColorUtils.white,
                          //     shape: RoundedRectangleBorder(
                          //       side: BorderSide(color: ColorUtils.white, width: 1),
                          //       borderRadius: BorderRadius.only(
                          //           topLeft: Radius.circular(20),
                          //           topRight: Radius.circular(20)),
                          //     ),
                          //     child: Container(
                          //       margin: EdgeInsets.symmetric(horizontal: 4.w),
                          //       child: SingleChildScrollView(
                          //         child: Column(
                          //           crossAxisAlignment: CrossAxisAlignment.start,
                          //           children: [
                          //             SizedBox(
                          //               height: 2.h,
                          //             ),
                          //             Container(
                          //               height: 5.h,
                          //               width: double.infinity,
                          //               child: ListView.builder(
                          //                   padding: EdgeInsets.zero,
                          //                   shrinkWrap: true,
                          //                   itemCount: model.tabbar.length,
                          //                   scrollDirection: Axis.horizontal,
                          //                   itemBuilder: (context, index) {
                          //                     return Row(
                          //                       // mainAxisAlignment: MainAxisAlignment.center,
                          //                       children: [
                          //                         GestureDetector(
                          //                           onTap: () {
                          //                             model.select = index;
                          //                             model.notifyListeners();
                          //                           },
                          //                           child: Container(
                          //                               padding:
                          //                               EdgeInsets.symmetric(
                          //                                   horizontal: 3.w),
                          //                               height: 5.h,
                          //                               // margin: EdgeInsets.only(
                          //                               //     left: 5.w),
                          //                               decoration: BoxDecoration(
                          //                                   gradient:
                          //                                   LinearGradient(
                          //                                       colors: [
                          //                                         model.select == index
                          //                                             ? ColorUtils
                          //                                             .gradientcolor1
                          //                                             : ColorUtils
                          //                                             .white,
                          //                                         model.select == index
                          //                                             ? ColorUtils
                          //                                             .gradientcolor2
                          //                                             : ColorUtils
                          //                                             .white,
                          //                                       ],
                          //                                       begin: Alignment
                          //                                           .bottomLeft,
                          //                                       end: Alignment
                          //                                           .topRight,
                          //                                       stops: [
                          //                                         0.1,
                          //                                         0.6
                          //                                       ]),
                          //                                   borderRadius:
                          //                                   BorderRadius
                          //                                       .circular(20)),
                          //                               child: Center(
                          //                                 child: Text(
                          //                                     model.tabbar[index]
                          //                                     ["tab"],
                          //                                     style: TextStyle(
                          //                                       fontSize: 2.t,
                          //                                       fontFamily: FontUtils
                          //                                           .PoppinsMedium,
                          //                                       color:
                          //                                       model.select ==
                          //                                           index
                          //                                           ? ColorUtils
                          //                                           .white
                          //                                           : ColorUtils
                          //                                           .black,
                          //                                     )),
                          //                               )),
                          //                         ),
                          //
                          //                         // SizedBox(width: 2.w,)
                          //                       ],
                          //                     );
                          //                   }),
                          //             ),
                          //             SizedBox(
                          //               height: 1.h,
                          //             ),
                          //             // Image.asset(
                          //             //   ImageUtils.mapImage,
                          //             //   height: MediaQuery.of(context).size.height,
                          //             //   width: MediaQuery.of(context).size.width,
                          //             //   fit: BoxFit.fitHeight,
                          //             // )
                          //
                          //
                          //
                          //
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //     elevation: 0.0,
                          //     clipBehavior: Clip.antiAlias,
                          //   ),
                          // )
                        ])
                ),
              ),
            ),
          );
      },
    );
  }
}
