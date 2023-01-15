import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
// import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/friend/friends_profile.dart';
import 'package:deals_app/views/friend/inbox.dart';
import 'package:deals_app/views/language.dart';
import 'package:deals_app/views/my_profile.dart';
import 'package:deals_app/views/notification/notification.dart';
import 'package:deals_app/views/resturant_detail.dart';
import 'package:deals_app/views/search.dart';
import 'package:deals_app/views/search_restaurant_details.dart';
import 'package:deals_app/views/user_profile.dart';
import 'package:deals_app/widgets/container_shadow.dart';
import 'package:deals_app/widgets/deals_all.dart';
import 'package:deals_app/widgets/deals_rating_widget.dart';
import 'package:deals_app/widgets/expire_deals.dart';
import 'package:deals_app/widgets/favorite_restaurant_widget.dart';
import 'package:deals_app/widgets/newContainer_shadow_one.dart';
import 'package:deals_app/widgets/rating_widget.dart';
import 'package:deals_app/widgets/resturant_widget.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stacked/stacked.dart';
import '../../app/locator.dart';
import '../../widgets/newContainer_shadow.dart';
import '../discount_offer.dart';
import '../interest.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller =
  PageController(initialPage: 0, viewportFraction: 1.1, keepPage: false);
  final verticalControllerElectronics =
  PageController(initialPage: 0, viewportFraction: 1.1, keepPage: false);

  @override
  Widget build(BuildContext context) {
    dynamic pages = [];
    dynamic pagesVertical = [];
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        pages = List.generate(
          model.homeSlider.length,
              (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Container(
              // height: 4.h,

              child: Image.asset(
                model.homeSlider[index]['images'],
              ),
            ),
          ),
        );
      },
      builder: (context, model, child) {
        pages = List.generate(
            model.homeSlider.length,
                (index) => Stack(children: [
              Container(
                // height: 20.h,
                //width: 95.w,

                margin: EdgeInsets.only(top: 2.5.h,),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    model.homeSlider[index]['images'],
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  top: 4.5.h,
                  left: 38.5.w,
                  child: Center(
                    child: Image.asset(
                      model.homeSlider[index]['logo'],
                      height: 6.h,
                    ),
                  )),
              Positioned(
                  top: 12.h,
                  left: 17.w,
                  child: Center(
                    child: Image.asset(
                      model.homeSlider[index]['text'],
                      height: 6.h,
                    ),
                  ))
            ]));
        pagesVertical = List.generate(
          model.verticalElectronicsSlider.length,
              (index) => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                image: DecorationImage(
                    image: AssetImage(
                      model.verticalElectronicsSlider[index]['images'],
                    ),
                    fit: BoxFit.contain)),
            width: double.infinity,
            // child: Image.asset(
            //   model.verticalElectronicsSlider[index]['images'],
            //   fit: BoxFit.fill,
            // ),
          ),
        );
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
                    body: SingleChildScrollView(
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // height: 20.h,
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 16.h,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        ColorUtils.gradientcolor1,
                                        ColorUtils.gradientcolor2,
                                      ], stops: [
                                        0.1,
                                        0.6
                                      ]),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                    ),
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 5.w),
                                    child: Stack(
                                      children: [
                                        Align(
                                          child: Row(

                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  model.navigationService
                                                      .navigateTo(
                                                      to: UserProfile());
                                                },
                                                child: CircleAvatar(
                                                  maxRadius: 7.2.w,
                                                  backgroundColor:
                                                  ColorUtils.gradientcolor1,
                                                  child: CircleAvatar(
                                                    maxRadius: 6.5.w,
                                                    backgroundColor: ColorUtils
                                                        .grey
                                                        .withOpacity(0.5),
                                                    backgroundImage: AssetImage(
                                                        ImageUtils
                                                            .profileImage),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.5.w,
                                              ),
                                              GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 3.h),
                                                    height: 8.h,
                                                    width: 40.w,
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .bottomLeft,
                                                          child: TextWidget(
                                                            textTitle:
                                                            Constants.deals,
                                                            fontSize: 4.t,
                                                            color: ColorUtils
                                                                .white,
                                                            fontFamily: FontUtils
                                                                .playfairbold,
                                                          ),
                                                        ),
                                                        Positioned(
                                                            left: 23.w,
                                                            bottom: 3.2.h,
                                                            child: SvgPicture
                                                                .asset(
                                                              ImageUtils
                                                                  .loginIcon,
                                                              color: ColorUtils
                                                                  .white,
                                                              height: 4.h,
                                                            ))
                                                      ],
                                                    )),
                                              ),
                                              SizedBox(
                                                width: 6.w,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  model.navigationService
                                                      .navigateTo(
                                                      to: InboxScreen());
                                                },
                                                child:Stack(
                                                  children: [

                                                    Container(
                                                      // margin: EdgeInsets.only(
                                                      //     left: 3.w),
                                                      // height: 6.h,
                                                      // width: 11.w,
                                                      padding: EdgeInsets.all(3.w),
                                                      decoration: BoxDecoration(
                                                          color: ColorUtils.white,
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                      child: SvgPicture.asset(
                                                        ImageUtils.messageIconHome,
                                                        width: 5.i,
                                                        height: 5.i,
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(left: 9.w),
                                                      height: 2.h,
                                                      width: 4.w,
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16)),
                                                      child: Center(
                                                        child: Text("2",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 1.t
                                                          ),),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  model.navigationService
                                                      .navigateTo(
                                                      to: NotificationScreen());
                                                },
                                                child:Container(
                                                  margin: EdgeInsets.only(
                                                      left: 1.w),
                                                  // height: 6.h,
                                                  // width: 11.w,
                                                  padding: EdgeInsets.all(3.w),
                                                  decoration: BoxDecoration(
                                                      color: ColorUtils.white,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                                  child: SvgPicture.asset(
                                                    ImageUtils.notificationIconHome,
                                                    width: 5.i,
                                                    height: 5.i,
                                                  ),
                                                ),


                                                // Container(
                                                //   margin: EdgeInsets.symmetric(
                                                //       horizontal: 3.w),
                                                //   padding:
                                                //       EdgeInsets.all(2.7.w),
                                                //   // height: 6.h,
                                                //   // width: 12.w,
                                                //   decoration: BoxDecoration(
                                                //       color: ColorUtils.white,
                                                //       borderRadius:
                                                //           BorderRadius.circular(
                                                //               16)),
                                                //   child: SvgPicture.asset(
                                                //     ImageUtils
                                                //         .notificationIconHome,
                                                //     width: 5.i,
                                                //     height: 6.i,
                                                //   ),
                                                // ),
                                              ),
                                            ],
                                          ),
                                          alignment: Alignment.bottomCenter,
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Positioned(
                                  //   top: 16.h,
                                  //   left: 6.w,
                                  //   right: 6.w,
                                  //   child: GestureDetector(
                                  //     onTap: () {
                                  //       model.navigationService
                                  //           .navigateTo(to: Search());
                                  //     },
                                  //     child: Material(
                                  //       borderRadius: BorderRadius.circular(16),
                                  //       color: ColorUtils.grey,
                                  //       elevation: 5,
                                  //       child: Container(
                                  //         alignment: Alignment.center,
                                  //         height: 8.h,
                                  //         width: 88.w,
                                  //         decoration: BoxDecoration(
                                  //           borderRadius:
                                  //               BorderRadius.circular(16),
                                  //           color: ColorUtils.white,
                                  //         ),
                                  //         child: Row(
                                  //           children: [
                                  //             Container(
                                  //               margin: EdgeInsets.symmetric(
                                  //                   horizontal: 3.w),
                                  //               height: 6.h,
                                  //               width: 11.w,
                                  //               decoration: BoxDecoration(
                                  //                   gradient: LinearGradient(
                                  //                       colors: [
                                  //                         ColorUtils
                                  //                             .gradientcolor1,
                                  //                         ColorUtils
                                  //                             .gradientcolor2,
                                  //                       ],
                                  //                       begin: Alignment
                                  //                           .bottomLeft,
                                  //                       end: Alignment.topRight,
                                  //                       stops: [0.1, 0.6]),
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(
                                  //                           16)),
                                  //               child: Icon(
                                  //                 Icons.search,
                                  //                 color: ColorUtils.white,
                                  //               ),
                                  //             ),
                                  //             Container(
                                  //               height: 6.h,
                                  //               width: 30.w,
                                  //               child: TextFormField(
                                  //                 readOnly: true,
                                  //                 decoration: InputDecoration(
                                  //                     border: InputBorder.none,
                                  //                     hintText:
                                  //                         Constants.searchText,
                                  //                     hintStyle: CustomTheme
                                  //                         .searchtextfeild),
                                  //               ),
                                  //             ),
                                  //             VerticalDivider(
                                  //               indent: 0.7.h,
                                  //               endIndent: 0.7.h,
                                  //               thickness: 1,
                                  //               color: ColorUtils.grey,
                                  //             ),
                                  //             Row(
                                  //               children: [
                                  //                 Icon(
                                  //                   Icons.location_on_outlined,
                                  //                   color: ColorUtils.grey,
                                  //                   size: 8.i,
                                  //                 ),
                                  //                 TextWidget(
                                  //                   textTitle: Constants.dubai,
                                  //                   fontSize: 2.t,
                                  //                   fontFamily: FontUtils
                                  //                       .PoppinsSemibold,
                                  //                   color: ColorUtils.grey,
                                  //                 ),
                                  //               ],
                                  //             )
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Container(
                                  //   height: 5.h,
                                  //   width: double.infinity,
                                  //   child: ListView.builder(
                                  //       padding: EdgeInsets.zero,
                                  //       shrinkWrap: true,
                                  //       itemCount: model.tabbar.length,
                                  //       scrollDirection: Axis.horizontal,
                                  //       itemBuilder: (context, index) {
                                  //         return Row(
                                  //           // mainAxisAlignment: MainAxisAlignment.center,
                                  //           children: [
                                  //             GestureDetector(
                                  //               onTap: () {
                                  //                 model.select = index;
                                  //                 model.notifyListeners();
                                  //               },
                                  //               child: Container(
                                  //                   padding:
                                  //                       EdgeInsets.symmetric(
                                  //                           horizontal: 3.w),
                                  //                   height: 5.h,
                                  //                   // margin: EdgeInsets.only(
                                  //                   //     left: 5.w),
                                  //                   decoration: BoxDecoration(
                                  //                       gradient:
                                  //                           LinearGradient(
                                  //                               colors: [
                                  //                                 model.select == index
                                  //                                     ? ColorUtils
                                  //                                         .gradientcolor1
                                  //                                     : ColorUtils
                                  //                                         .white,
                                  //                                 model.select == index
                                  //                                     ? ColorUtils
                                  //                                         .gradientcolor2
                                  //                                     : ColorUtils
                                  //                                         .white,
                                  //                               ],
                                  //                               begin: Alignment
                                  //                                   .bottomLeft,
                                  //                               end: Alignment
                                  //                                   .topRight,
                                  //                               stops: [
                                  //                                 0.1,
                                  //                                 0.6
                                  //                               ]),
                                  //                       borderRadius:
                                  //                           BorderRadius
                                  //                               .circular(20)),
                                  //                   child: Center(
                                  //                     child: Text(
                                  //                         model.tabbar[index]
                                  //                             ["tab"],
                                  //                         style: TextStyle(
                                  //                           fontSize: 2.t,
                                  //                           fontFamily: FontUtils
                                  //                               .PoppinsMedium,
                                  //                           color:
                                  //                               model.select ==
                                  //                                       index
                                  //                                   ? ColorUtils
                                  //                                       .white
                                  //                                   : ColorUtils
                                  //                                       .black,
                                  //                         )),
                                  //                   )),
                                  //             ),
                                  //
                                  //             // SizedBox(width: 2.w,)
                                  //           ],
                                  //         );
                                  //       }),
                                  // ),
                                  Container(
                                    // margin: EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Stack(
                                      children: [
                                        SizedBox(
                                          height: 25.h,
                                          width: MediaQuery.of(context).size.width - 10.w,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: PageView.builder(
                                              controller: controller,
                                              // itemCount: pages.length,
                                              itemBuilder: (_, index) {
                                                return FractionallySizedBox(
                                                  widthFactor: 1 /
                                                      controller.viewportFraction,
                                                  child: pages[index],
                                                );
                                              },
                                              itemCount: pages.length,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 3.h,
                                            left: 35.w,
                                            child: SmoothPageIndicator(
                                                controller: controller,
                                                // PageController
                                                axisDirection: Axis.horizontal,
                                                count: model.homeSlider.length,
                                                effect: ExpandingDotsEffect(
                                                    dotColor: Colors.white,
                                                    activeDotColor: ColorUtils
                                                        .gradientColor,
                                                    dotWidth: 2.w,
                                                    dotHeight: 1.h),
                                                // your preferred effect
                                                onDotClicked: (index) {
                                                  print(index);
                                                })),
                                      ],
                                    ),
                                  ),
//Trending discounts
                                  SizedBox(
                                    height: 2.5.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 0.5.w),
                                    child: DealsAll(
                                        title: Constants.discount,
                                        fontSize: 2.4.t,
                                        fontSize1: 1.6.t),
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),

                                  SizedBox(
                                    height: 14.5.h,
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        itemCount:
                                        model.trendingDiscounts.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                              height: 8.5.h,
                                              width: 21.5.w,
                                              margin: EdgeInsets.only(right: 0.w, bottom: 0.5.h, top: 0.2.h, left: 0.1.w),
                                              padding: EdgeInsets.all(1.w),
                                              child: Column(
                                                children: [
                                                  GestureDetector(
                                                    onTap:(){
                                                      model.navigationService.navigateTo(to: DiscountOffer());
                                                    },
                                                    child: Container(
                                                      // height: 11.5.h,
                                                      // width: 27.w,
                                                      height: 8.5.h,
                                                      width: 21.5.w,
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
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child:
                                                      CircleAvatar(
                                                        backgroundColor: ColorUtils.white,
                                                        radius: 5,
                                                        child:
                                                        CircleAvatar(
                                                          // maxRadius: 10.5.w,
                                                          // maxRadius: 10.5.w,
                                                          radius: 29,
                                                          backgroundColor:
                                                          // ColorUtils.black,
                                                          ColorUtils.white,
                                                          backgroundImage:
                                                          AssetImage(
                                                            model.popularSearches[
                                                            index]['images'],
                                                          ),
                                                         ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 0.5.h,),
                                                  Container(
                                                    // width: 30.w,
                                                    width: 25.w,
                                                    margin: EdgeInsets.only(left: 0.w),
                                                    // color: Colors.red,
                                                    child: TextWidget(
                                                      textAlign:
                                                      TextAlign.center,
                                                      maxLines: 2,
                                                      textTitle:
                                                      model.trendingDiscounts[
                                                      index][
                                                      'imageDescription'],
                                                      color: ColorUtils.black,
                                                      // fontWeight:
                                                      // FontWeight.w800,
                                                      fontFamily: FontUtils.PoppinsMedium,
                                                      fontSize: 1.1.t,
                                                    ),
                                                  ),
                                                ],
                                              ));
                                        }),
                                  ),
                                  //
                                  //Discover Brands
                                  //
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 0.5.w),
                                    child: DealsAll(
                                        title: Constants.discoverBrands,
                                        fontSize: 2.4.t,
                                        fontSize1: 1.6.t),
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),

                                  SizedBox(
                                    height: 16.h,
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),

                                        scrollDirection: Axis.horizontal,
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        itemCount: model.discoverColor.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            //height: 8.h,
                                            width: 25.w,
                                            margin: EdgeInsets.only(
                                                right: 2.w,
                                                bottom: 2.h,
                                                top: 2.h,
                                                left: 1.w),
                                            padding: EdgeInsets.all(2.w),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(3.w),
                                                color: ColorUtils.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      blurRadius: 5,
                                                      spreadRadius: 4,
                                                      offset: Offset(2, 4))
                                                ]
                                            ),
                                            child: Container(
                                              height: 8.h,
                                              width: 23.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(8),
                                                color:
                                                model.discoverColor[index]
                                                ['color'],
                                              ),
                                              child: Center(
                                                child: TextWidget(
                                                  textTitle: Constants.vougue,
                                                  color: ColorUtils.white,
                                                  fontFamily:
                                                  FontUtils.PoppinsRegular,
                                                  fontSize: 2.5.t,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),

                                  TextWidget(
                                    textTitle: Constants.nearByDeals,
                                    color: ColorUtils.textColor,
                                    fontSize: 2.6.t,
                                    fontFamily: FontUtils.PoppinsSemibold,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),

                                  SizedBox(
                                    height: 39.h,
                                    // height: 41.h,
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),

                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 2,
                                        itemBuilder: (context, index) {
                                          return ResturantWidget(
                                              onTap: () {
                                                // Future.delayed(
                                                //     Duration(seconds: 0), () {
                                                //   showModalBottomSheet(
                                                //       isDismissible: false,
                                                //       shape:
                                                //           RoundedRectangleBorder(
                                                //         borderRadius:
                                                //             BorderRadius.only(
                                                //           topLeft:
                                                //               Radius.circular(
                                                //                   20),
                                                //           topRight:
                                                //               Radius.circular(
                                                //                   20),
                                                //         ),
                                                //       ),
                                                //       context: context,
                                                //       builder: (builder) {
                                                //         return Container(
                                                //            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                                                //           // margin: EdgeInsets.only(left: 3.w),
                                                //
                                                //           height: 180.h,
                                                //           child:
                                                //               ResturantDetail(),
                                                //         );
                                                //       });
                                                // });
                                                model.navigationService.navigateTo(to: SearchDetails());
                                              },
                                              // image: ImageUtils.slider,
                                            image: model.nearImages[index]['title'],
                                            image2: model.nearLogos[index]['title'],
                                            location: model.nearbylocations[index]['title'],
                                          );
                                        }),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Image.asset(ImageUtils.nearByDeals1,
                                  // height: 50.i,
                                  //   width: 90.i,
                                  ),

                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  TextWidget(
                                    textTitle: Constants.sunset,
                                    color: ColorUtils.textColor,
                                    fontSize: 2.6.t,
                                    fontFamily: FontUtils.PoppinsSemibold,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SizedBox(
                                    height: 39.h,
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),

                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 2,
                                        itemBuilder: (context, index) {
                                          return ResturantWidget(
                                            onTap: () {
                                              // Future.delayed(
                                              //     Duration(seconds: 0), () {
                                              //   showModalBottomSheet(
                                              //       isDismissible: false,
                                              //       shape:
                                              //           RoundedRectangleBorder(
                                              //         borderRadius:
                                              //             BorderRadius.only(
                                              //           topLeft:
                                              //               Radius.circular(
                                              //                   20),
                                              //           topRight:
                                              //               Radius.circular(
                                              //                   20),
                                              //         ),
                                              //       ),
                                              //       context: context,
                                              //       builder: (builder) {
                                              //         return Container(
                                              //           margin: EdgeInsets
                                              //               .symmetric(
                                              //                   horizontal:
                                              //                       5.w,
                                              //                   vertical:
                                              //                       2.h),
                                              //           height: 180.h,
                                              //           child:
                                              //               ResturantDetail(),
                                              //         );
                                              //       });
                                              // });
                                              model.navigationService.navigateTo(to: SearchDetails());
                                            },
                                            image: model.sunset[index]['title'],
                                            image2: model.sunsetLogos[index]['title'],
                                            location: model.sunsetText[index]['title'],
                                          );
                                        }),
                                  ),

                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  TextWidget(
                                    textTitle: Constants.popularSearches,
                                    color: ColorUtils.textColor,
                                    fontSize: 2.6.t,
                                    fontFamily: FontUtils.PoppinsSemibold,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),



                                  SizedBox(
                                    height: 16.h,
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),

                                        scrollDirection: Axis.horizontal,
                                        itemCount: model.popularSearches.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            width: 22.w,
                                            padding: EdgeInsets.all(0.7.w),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                CircleAvatar(
                                                  maxRadius: 9.5.w,
                                                  backgroundImage: AssetImage(
                                                    model.popularSearch[index]
                                                    ['title'],
                                                  ),
                                                ),
                                                Container(
                                                  height: 5.h,
                                                  child: TextWidget(
                                                    textAlign: TextAlign.center,
                                                    maxLines: 2,
                                                    overFlow:
                                                    TextOverflow.ellipsis,
                                                    textTitle:
                                                    model.popularSearches[
                                                    index][
                                                    'imageDescription'],
                                                    color: ColorUtils.black,
                                                    fontFamily:
                                                    FontUtils.PoppinsMedium,
                                                    fontSize: 1.6.t,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),

                                  // SizedBox(
                                  //   height: 1.h,
                                  // ),

                                  DealsAll(
                                      title: Constants.youThere,
                                      fontSize: 2.6.t,
                                      fontSize1: 1.9.t),
                                  SizedBox(
                                    height: 2.h,
                                  ),

                                  SizedBox(
                                    height: 14.h,
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        itemCount: 2,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              // Future.delayed(
                                              //     Duration(seconds: 0), () {
                                              //   showModalBottomSheet(
                                              //       isDismissible: false,
                                              //       shape:
                                              //       RoundedRectangleBorder(
                                              //         borderRadius:
                                              //         BorderRadius.only(
                                              //           topLeft:
                                              //           Radius.circular(20),
                                              //           topRight:
                                              //           Radius.circular(20),
                                              //         ),
                                              //       ),
                                              //       context: context,
                                              //       builder: (builder) {
                                              //         return Container(
                                              //           margin: EdgeInsets
                                              //               .symmetric(
                                              //               horizontal: 5.w,
                                              //               vertical: 2.h),
                                              //           height: 180.h,
                                              //           child:
                                              //           ResturantDetail(),
                                              //         );
                                              //       });
                                              // });
                                              model.navigationService.navigateTo(to: SearchDetails());
                                            },
                                            child: Container(
                                                margin:
                                                EdgeInsets.only(right: 2.w,),
                                                child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        height: 13.h,
                                                        // color: ColorUtils.redColorExpiresIn,
                                                        child: Image.asset(
                                                          // ImageUtils.hy1,
                                                          model.haveYouImages[index]['image'],
                                                          // height: 18.h
                                                          height: 16.h,
                                                          width: 70.w,
                                                          // fit: BoxFit.cover,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),

                                                      // Align(
                                                      //   alignment:
                                                      //   Alignment.topCenter,
                                                      //   child: Container(
                                                      //     margin: EdgeInsets
                                                      //         .symmetric(
                                                      //         vertical: 3.h,
                                                      //         horizontal:
                                                      //         5.w),
                                                      //     // height: 30.0,
                                                      //     // width: 23.0,
                                                      //     // color: Colors.blue,
                                                      //     child:
                                                      //     Container(
                                                      //         child:
                                                      //         Image.asset(
                                                      //           model.haveyouthereImage[
                                                      //           index]['title'],
                                                      //           height: 10.i,
                                                      //           width: 10.i,
                                                      //         )),
                                                      //   ),
                                                      // ),
                                                      // Align(
                                                      //   alignment: Alignment.bottomCenter,
                                                      //   child: Container(
                                                      //     margin: EdgeInsets
                                                      //         .symmetric(
                                                      //         vertical: 2.h,
                                                      //         horizontal:
                                                      //         5.w),
                                                      //     // height: 30.0,
                                                      //     // width: 23.0,
                                                      //     // color: Colors.blue,
                                                      //     child:
                                                      //     Text(
                                                      //       model.haveyouText[
                                                      //       index]['title'],
                                                      //       style: TextStyle(
                                                      //         fontFamily: FontUtils
                                                      //             .PoppinsMedium,
                                                      //         color: ColorUtils
                                                      //             .white,
                                                      //       ),
                                                      //     ),
                                                      //   ),
                                                      // ),

                                                      Positioned(
                                                        top: 2.h,
                                                          left: 4.w,
                                                          child:
                                                          Container(
                                                                    child:
                                                                    Image.asset(
                                                                      model.haveyouthereImage[
                                                                      index]['title'],
                                                                      height: 9.i,
                                                                      width: 9.i,
                                                                    )),
                                                              ),
                                                      Positioned(
                                                          top: 7.h,
                                                          left: 4.w,
                                                          child: Text(
                                                                model.haveyouText[
                                                                index]['title'],
                                                                style: TextStyle(
                                                                  fontFamily: FontUtils
                                                                      .PoppinsSemibold,
                                                                  color: ColorUtils.white,
                                                                  fontSize: 1.6.t
                                                                ),
                                                              ) ),
                                                    ],
                                                  ),
                                                )),
                                          );
                                        }),
                                  ),

                                  // SizedBox(
                                  //   height: 1.h,
                                  // ),

                                  SizedBox(
                                    height: 14.h,
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),

                                        itemCount: 2,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              // Future.delayed(
                                              //   Duration(seconds: 0),
                                              //       () {
                                              //     showModalBottomSheet(
                                              //         isDismissible: false,
                                              //         shape:
                                              //         RoundedRectangleBorder(
                                              //           borderRadius:
                                              //           BorderRadius.only(
                                              //             topLeft:
                                              //             Radius.circular(
                                              //                 20),
                                              //             topRight:
                                              //             Radius.circular(
                                              //                 20),
                                              //           ),
                                              //         ),
                                              //         context: context,
                                              //         builder: (builder) {
                                              //           return Container(
                                              //             margin: EdgeInsets
                                              //                 .symmetric(
                                              //                 horizontal:
                                              //                 5.w,
                                              //                 vertical:
                                              //                 2.h),
                                              //             height: 180.h,
                                              //             child:
                                              //             ResturantDetail(),
                                              //           );
                                              //         });
                                              //   },
                                              // );
                                              model.navigationService.navigateTo(to: SearchDetails());
                                            },
                                            child: Container(
                                                margin:
                                                EdgeInsets.only(right: 2.w),
                                                child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        // color: ColorUtils.redColorExpiresIn,
                                                        height: 13.h,
                                                        child: Image.asset(
                                                          // ImageUtils.hy2,
                                                          model.haveYouImages1[index]['image'],
                                                          // height: 18.h,
                                                          height: 16.h,
                                                          width: 70.w,
                                                          // fit: BoxFit.cover,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                      // Align(
                                                      //   alignment:
                                                      //   Alignment.topCenter,
                                                      //   child: Container(
                                                      //     margin: EdgeInsets
                                                      //         .symmetric(
                                                      //         vertical: 3.h,
                                                      //         horizontal:
                                                      //         5.w),
                                                      //     // height: 30.0,
                                                      //     // width: 23.0,
                                                      //     // color: Colors.blue,
                                                      //     child: Container(
                                                      //         child:
                                                      //         Image.asset(
                                                      //           model.haveyouthereImage1[
                                                      //           index]['title'],
                                                      //           height: 10.i,
                                                      //           width: 10.i,
                                                      //         )),
                                                      //   ),
                                                      // ),
                                                      // Align(
                                                      //   alignment: Alignment
                                                      //       .bottomCenter,
                                                      //   child: Container(
                                                      //     margin: EdgeInsets
                                                      //         .symmetric(
                                                      //         vertical: 2.h,
                                                      //         horizontal:
                                                      //         5.w),
                                                      //     // height: 30.0,
                                                      //     // width: 23.0,
                                                      //     // color: Colors.blue,
                                                      //     child: Text(
                                                      //       model.haveyouText1[
                                                      //       index]['title'],
                                                      //       style: TextStyle(
                                                      //         fontFamily: FontUtils
                                                      //             .PoppinsMedium,
                                                      //         color: ColorUtils
                                                      //             .white,
                                                      //       ),
                                                      //     ),
                                                      //   ),
                                                      // ),

                                                      Positioned(
                                                        top: 2.h,
                                                        left: 4.w,
                                                        child:
                                                        Container(
                                                            child:
                                                            Image.asset(
                                                              model.haveyouthereImage1[
                                                              index]['title'],
                                                              height: 9.i,
                                                              width: 9.i,
                                                            )),
                                                      ),
                                                      Positioned(
                                                          top: 7.h,
                                                          left: 4.w,
                                                          child: Text(
                                                            model.haveyouText1[
                                                            index]['title'],
                                                            style: TextStyle(
                                                              fontFamily: FontUtils.PoppinsSemibold,
                                                              color: ColorUtils.white,
                                                              fontSize: 1.6.t
                                                            ),
                                                          ) ),
                                                    ],
                                                  ),
                                                )),
                                          );
                                        }),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),

                                  TextWidget(
                                    textTitle: Constants.clothing,
                                    color: ColorUtils.textColor,
                                    fontSize: 2.6.t,
                                    fontFamily: FontUtils.PoppinsSemibold,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),


                                  SizedBox(
                                    height: 39.h,
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),

                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 2,
                                        itemBuilder: (context, index) {
                                          return ResturantWidget(
                                            onTap: () {
                                              // Future.delayed(
                                              //     Duration(seconds: 0), () {
                                              //   showModalBottomSheet(
                                              //       isDismissible: false,
                                              //       shape:
                                              //           RoundedRectangleBorder(
                                              //         borderRadius:
                                              //             BorderRadius.only(
                                              //           topLeft:
                                              //               Radius.circular(20),
                                              //           topRight:
                                              //               Radius.circular(20),
                                              //         ),
                                              //       ),
                                              //       context: context,
                                              //       builder: (builder) {
                                              //         return Container(
                                              //           margin: EdgeInsets
                                              //               .symmetric(
                                              //                   horizontal: 5.w,
                                              //                   vertical: 2.h),
                                              //           height: 180.h,
                                              //           child:
                                              //               ResturantDetail(),
                                              //         );
                                              //       });
                                              // });
                                              model.navigationService.navigateTo(to: SearchDetails());
                                            },
                                            image: model.clothingbrand[index]['title'],
                                            image2: model.clothing[index]['title'],
                                            location: model.clothingbrandText[index]['title'],
                                          );
                                        }),
                                  ),

                                  SizedBox(
                                    height: 2.h,
                                  ),

                                  TextWidget(
                                    textTitle: Constants.electronics,
                                    color: ColorUtils.textColor,
                                    fontSize: 2.6.t,
                                    fontFamily: FontUtils.PoppinsSemibold,
                                  ),

                                  // SizedBox(
                                  //   height: 1.h,
                                  // ),

                                  Container(
                                    padding: EdgeInsets.only(top: 0.5.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.w),
                                    ),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 26.h,
                                          width: double.infinity,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: PageView.builder(
                                              controller:
                                              verticalControllerElectronics,
                                              scrollDirection: Axis.vertical,
                                              // itemCount: pages.length,
                                              itemBuilder: (_, index) {
                                                return FractionallySizedBox(
                                                  // widthFactor: 1 /
                                                  //     verticalControllerElectronics
                                                  //         .viewportFraction,
                                                  child: pagesVertical[index],
                                                );
                                              },
                                              itemCount: pagesVertical.length,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 6.h,
                                          bottom: 6.h,
                                          right: 8.w,
                                          child: SmoothPageIndicator(
                                            controller:
                                            verticalControllerElectronics,
                                            // PageController
                                            axisDirection: Axis.vertical,
                                            count: model
                                                .verticalElectronicsSlider
                                                .length,
                                            effect: ExpandingDotsEffect(
                                                dotColor: Colors.white,
                                                activeDotColor:
                                                ColorUtils.gradientColor,
                                                dotWidth: 2.w,
                                                dotHeight: 1.h),
                                            // your preferred effect
                                            onDotClicked: (index) {
                                              print(index);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    height: 2.h,
                                  ),

                                  DealsAll(
                                      title: Constants.myFavourite,
                                      fontSize: 2.6.t,
                                      fontSize1: 1.9.t),
                                  SizedBox(
                                    height: 2.h,
                                  ),

                                  // Container(
                                  //   height: 20.0,
                                  //   width: 20.0,
                                  //   color: Colors.black,
                                  // ),
                                  SizedBox(
                                    height: 42.h,
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),

                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 2,
                                        itemBuilder: (context, index) {
                                          return
                                            FavoriteResturantWidget(
                                                onTap: () {
                                                  // Future.delayed(
                                                  //     Duration(seconds: 0), () {
                                                  //   showModalBottomSheet(
                                                  //       isDismissible: false,
                                                  //       shape:
                                                  //           RoundedRectangleBorder(
                                                  //         borderRadius:
                                                  //             BorderRadius.only(
                                                  //           topLeft:
                                                  //               Radius.circular(20),
                                                  //           topRight:
                                                  //               Radius.circular(20),
                                                  //         ),
                                                  //       ),
                                                  //       context: context,
                                                  //       builder: (builder) {
                                                  //         return Container(
                                                  //           margin: EdgeInsets
                                                  //               .symmetric(
                                                  //                   horizontal: 5.w,
                                                  //                   vertical: 2.h),
                                                  //           height: 180.h,
                                                  //           child:
                                                  //               ResturantDetail(),
                                                  //         );
                                                  //       });
                                                  // });
                                                  model.navigationService.navigateTo(to: SearchDetails());
                                                },
                                                image: model.favoriteresturent[index]['title'],
                                                addressText: model.favoriteresturentAddress[index]['title'],
                                                text:model.favoriteresturentText[index]['title']


                                            );
                                        }),
                                  ),



                                  SizedBox(
                                    height: 2.h,
                                  ),

                                  ExpireDeals(
                                    title: Constants.todayDeals,
                                    expireDate: Constants.expireDate,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),

                                  Container(
                                    // height: 40.h,
                                    height: 38.h,
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: model.todays.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              // Future.delayed(
                                              //     Duration(seconds: 0), () {
                                              //   showModalBottomSheet(
                                              //       isDismissible: false,
                                              //       shape:
                                              //           RoundedRectangleBorder(
                                              //         borderRadius:
                                              //             BorderRadius.only(
                                              //           topLeft:
                                              //               Radius.circular(20),
                                              //           topRight:
                                              //               Radius.circular(20),
                                              //         ),
                                              //       ),
                                              //       context: context,
                                              //       builder: (builder) {
                                              //         return Container(
                                              //           margin: EdgeInsets
                                              //               .symmetric(
                                              //                   horizontal: 5.w,
                                              //                   vertical: 2.h),
                                              //           height: 180.h,
                                              //           child:
                                              //               ResturantDetail(),
                                              //         );
                                              //       });
                                              // });
                                              model.navigationService.navigateTo(to: SearchDetails());
                                            },
                                            child:
                                            newContainerShadowOne(
                                              padding: EdgeInsets.all(5.0),
                                              margin: EdgeInsets.only(
                                                  right: 5.w,
                                                  left: 0.5.w,
                                                  top: 0.5.h,
                                                  bottom: 0.7.h),
                                              // width: 50.w,
                                              width: 45.w,
                                              child: Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 14.w,
                                                      height: 2.4.h,
                                                      padding:
                                                      EdgeInsets.all(3),
                                                      decoration: BoxDecoration(
                                                        color: ColorUtils.pink,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(5),
                                                      ),
                                                      child: Center(
                                                        child: Row(
                                                          children: [
                                                            SizedBox(width: 1.w,),
                                                            TextWidget(
                                                              textTitle: Constants
                                                                  .saveAmount,
                                                              fontSize: 1.1.t,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w800,
                                                              color: ColorUtils
                                                                  .white,
                                                              fontFamily: FontUtils
                                                                  .PoppinsRegular,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 1.2.h,
                                                    ),
                                                    Center(
                                                      child: Image.asset(
                                                        model.todays[index]
                                                        ['images'],
                                                        height: 15.h,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 1.5.h,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 1.8.w),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          SizedBox(height: 1.h,),
                                                          Image.asset(
                                                            ImageUtils.express,
                                                            height: 2.h,
                                                          ),
                                                          SizedBox(
                                                            height: 1.h,
                                                          ),
                                                          SizedBox(
                                                            width: 38.w,
                                                            child: TextWidget(
                                                              textTitle: Constants
                                                                  .productTitle,
                                                              color: ColorUtils
                                                                  .textColor,
                                                              fontFamily: FontUtils.PoppinsMedium,
                                                              fontSize: 1.4.t,
                                                              overFlow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                              maxLines: 2,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 0.5.h,
                                                          ),
                                                          Row(
                                                            children: [
                                                              DealsRatingWidget(
                                                                initialRating:
                                                                4.5,
                                                              ),
                                                              SizedBox(
                                                                width: 1,
                                                              ),
                                                              TextWidget(
                                                                textTitle:
                                                                Constants.tewelve,
                                                                color:
                                                                ColorUtils.grey,
                                                                fontSize: 1.3.t,
                                                                fontFamily: FontUtils.PoppinsMedium,
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 0.5.h,
                                                          ),
                                                          Row(
                                                            children: [
                                                              TextWidget(
                                                                textTitle:
                                                                Constants
                                                                    .cutPrice,
                                                                color: ColorUtils
                                                                    .gradientColor,
                                                                fontSize: 1.4.t,
                                                                fontFamily:
                                                                FontUtils.PoppinsSemibold,
                                                              ),
                                                              SizedBox(
                                                                width: 1.w,
                                                              ),
                                                              TextWidget(
                                                                textTitle:
                                                                Constants
                                                                    .cutPrice1,
                                                                color:
                                                                ColorUtils
                                                                    .pink,
                                                                fontSize: 1.3.t,
                                                                fontFamily:
                                                                FontUtils
                                                                    .PoppinsMedium,
                                                                decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  ExpireDeals(
                                    title: Constants.weeklyDeals,
                                    expireDate: Constants.expireDate,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),


                                  Container(
                                    height: 38.h,
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),

                                        scrollDirection: Axis.horizontal,
                                        itemCount: model.todays.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              // Future.delayed(
                                              //   Duration(seconds: 0),
                                              //   () {
                                              //     showModalBottomSheet(
                                              //         isDismissible: false,
                                              //         shape:
                                              //             RoundedRectangleBorder(
                                              //           borderRadius:
                                              //               BorderRadius.only(
                                              //             topLeft:
                                              //                 Radius.circular(
                                              //                     20),
                                              //             topRight:
                                              //                 Radius.circular(
                                              //                     20),
                                              //           ),
                                              //         ),
                                              //         context: context,
                                              //         builder: (builder) {
                                              //           return Container(
                                              //             margin: EdgeInsets
                                              //                 .symmetric(
                                              //                     horizontal:
                                              //                         5.w,
                                              //                     vertical:
                                              //                         2.h),
                                              //             height: 180.h,
                                              //             child:
                                              //                 ResturantDetail(),
                                              //           );
                                              //         });
                                              //   },
                                              // );
                                              model.navigationService.navigateTo(to: SearchDetails());
                                            },
                                            child: newContainerShadow(
                                              padding: EdgeInsets.all(5.0),
                                              margin: EdgeInsets.only(
                                                  right: 5.w,
                                                  left: 0.5.w,
                                                  top: 0.5.h,
                                                  bottom: 0.7.h),
                                              width: 50.w,
                                              child: Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 13.w,
                                                      padding:
                                                      EdgeInsets.all(3),
                                                      decoration: BoxDecoration(
                                                        color: ColorUtils.pink,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(5),
                                                      ),
                                                      child: Center(
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 0.5.w,
                                                            ),
                                                            TextWidget(
                                                              textTitle: Constants
                                                                  .saveAmount,
                                                              fontSize: 1.1.t,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w800,
                                                              color: ColorUtils
                                                                  .white,
                                                              fontFamily: FontUtils
                                                                  .PoppinsRegular,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 1.2.h,
                                                    ),
                                                    Center(
                                                      child: Image.asset(
                                                        model.todays[index]
                                                        ['images'],
                                                        height: 15.h,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 1.5.h,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 1.8.w),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          SizedBox(height: 1.h,),
                                                          Image.asset(
                                                            ImageUtils.express,
                                                            height: 2.h,
                                                          ),
                                                          SizedBox(
                                                            height: 1.h,
                                                          ),
                                                          SizedBox(
                                                            width: 38.w,
                                                            child: TextWidget(
                                                              textTitle: Constants
                                                                  .productTitle,
                                                              color: ColorUtils
                                                                  .textColor,
                                                              fontFamily: FontUtils.PoppinsMedium,
                                                              fontSize: 1.4.t,
                                                              overFlow:
                                                              TextOverflow.ellipsis,
                                                              maxLines: 2,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 0.5.h,
                                                          ),
                                                          Row(
                                                            children: [
                                                              DealsRatingWidget(
                                                                initialRating:
                                                                4.5,
                                                              ),
                                                              SizedBox(
                                                                width: 1.5,
                                                              ),
                                                              TextWidget(
                                                                textTitle:
                                                                Constants.tewelve,
                                                                color:
                                                                ColorUtils
                                                                    .grey,
                                                                fontSize: 1.3.t,
                                                                fontFamily:
                                                                FontUtils
                                                                    .PoppinsMedium,
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 0.5.h,
                                                          ),
                                                          Row(
                                                            children: [
                                                              TextWidget(
                                                                textTitle:
                                                                Constants
                                                                    .cutPrice,
                                                                color: ColorUtils
                                                                    .gradientColor,
                                                                fontSize: 1.8.t,
                                                                fontFamily:
                                                                FontUtils
                                                                    .PoppinsSemibold,
                                                              ),
                                                              SizedBox(
                                                                width: 1.w,
                                                              ),
                                                              TextWidget(
                                                                textTitle:
                                                                Constants
                                                                    .cutPrice1,
                                                                color:
                                                                ColorUtils
                                                                    .pink,
                                                                fontSize: 1.6.t,
                                                                fontFamily:
                                                                FontUtils
                                                                    .PoppinsMedium,
                                                                decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  ExpireDeals(
                                    title: Constants.monthlyDeals,
                                    expireDate: Constants.expireDate,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Container(
                                    height: 38.h,
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),

                                        scrollDirection: Axis.horizontal,
                                        itemCount: model.todays.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              // Future.delayed(
                                              //     Duration(seconds: 0), () {
                                              //   showModalBottomSheet(
                                              //       isDismissible: false,
                                              //       shape:
                                              //           RoundedRectangleBorder(
                                              //         borderRadius:
                                              //             BorderRadius.only(
                                              //           topLeft:
                                              //               Radius.circular(20),
                                              //           topRight:
                                              //               Radius.circular(20),
                                              //         ),
                                              //       ),
                                              //       context: context,
                                              //       builder: (builder) {
                                              //         return Container(
                                              //           margin: EdgeInsets
                                              //               .symmetric(
                                              //                   horizontal: 5.w,
                                              //                   vertical: 2.h),
                                              //           height: 180.h,
                                              //           child:
                                              //               ResturantDetail(),
                                              //         );
                                              //       });
                                              // });
                                              model.navigationService.navigateTo(to: SearchDetails());
                                            },
                                            child: newContainerShadow(
                                              padding: EdgeInsets.all(5.0),
                                              margin: EdgeInsets.only(
                                                  right: 2.5.w,
                                                  left: 0.5.w,
                                                  top: 0.5.h,
                                                  bottom: 0.7.h),
                                              width: 50.w,
                                              child: Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 13.w,
                                                      padding:
                                                      EdgeInsets.all(3),
                                                      decoration: BoxDecoration(
                                                        color: ColorUtils.pink,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(5),
                                                      ),
                                                      child: Center(
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 0.5.w,
                                                            ),
                                                            TextWidget(
                                                              textTitle: Constants
                                                                  .saveAmount,
                                                              fontSize: 1.1.t,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w800,
                                                              color: ColorUtils
                                                                  .white,
                                                              fontFamily: FontUtils
                                                                  .PoppinsRegular,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 1.2.h,
                                                    ),
                                                    Center(
                                                      child: Image.asset(
                                                        model.todays[index]
                                                        ['images'],
                                                        height: 15.h,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 1.5.h,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 1.8.w),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          SizedBox(height: 1.h,),
                                                          Image.asset(
                                                            ImageUtils.express,
                                                            height: 2.h,
                                                          ),
                                                          SizedBox(
                                                            height: 1.h,
                                                          ),
                                                          SizedBox(
                                                            width: 38.w,
                                                            child: TextWidget(
                                                              textTitle: Constants
                                                                  .productTitle,
                                                              color: ColorUtils
                                                                  .textColor,
                                                              fontFamily: FontUtils
                                                                  .PoppinsMedium,
                                                              fontSize: 1.4.t,
                                                              overFlow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                              maxLines: 2,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 0.5.h,
                                                          ),
                                                          Row(
                                                            children: [
                                                              DealsRatingWidget(
                                                                initialRating:
                                                                4.5,
                                                              ),
                                                              SizedBox(
                                                                width: 1.5,
                                                              ),
                                                              TextWidget(
                                                                textTitle:
                                                                Constants.tewelve,
                                                                color:
                                                                ColorUtils
                                                                    .grey,
                                                                fontSize: 1.3.t,
                                                                fontFamily:
                                                                FontUtils
                                                                    .PoppinsMedium,
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 0.5.h,
                                                          ),
                                                          Row(
                                                            children: [
                                                              TextWidget(
                                                                textTitle:
                                                                Constants
                                                                    .cutPrice,
                                                                color: ColorUtils
                                                                    .gradientColor,
                                                                fontSize: 1.8.t,
                                                                fontFamily:
                                                                FontUtils
                                                                    .PoppinsSemibold,
                                                              ),
                                                              SizedBox(
                                                                width: 1.w,
                                                              ),
                                                              TextWidget(
                                                                textTitle:
                                                                Constants
                                                                    .cutPrice1,
                                                                color:
                                                                ColorUtils
                                                                    .pink,
                                                                fontSize: 1.6.t,
                                                                fontFamily:
                                                                FontUtils
                                                                    .PoppinsMedium,
                                                                decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ));
      },
    );
  }
}
