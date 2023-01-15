import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/widgets/buy_one_get_one.dart';
import 'package:deals_app/widgets/percent_off.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class OffersListThree extends StatefulWidget {
  dynamic title;
  dynamic image;
  void Function()? onTap;
  int? index;
  dynamic Icon;

  OffersListThree({this.title, this.image, this.onTap, this.index, this.Icon});

  @override
  State<OffersListThree> createState() => _OffersListThreeState();
}

class _OffersListThreeState extends State<OffersListThree> {
  bool likebutton = true;
  bool selectHeart = false;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => locator<MainViewModel>(),
        onModelReady: (model) {
        },
        disposeViewModel: false,
        builder: (context, model, child) {
          return GestureDetector(
            onTap: widget.onTap,
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorUtils.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: ColorUtils.white,
                          width: 3
                      ),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: ColorUtils.favotiteColor.withOpacity(0.3),
                      //     spreadRadius: 2,
                      //     blurRadius: 2,
                      //     offset: Offset(2, 5),
                      //
                      //     // color: Color.fromRGBO(115, 165, 254, 0.45),
                      //     // offset: Offset(0.1, 5),
                      //     // blurRadius: 15,
                      //   )
                      // ],

                      boxShadow: [
                        BoxShadow(
                          color: ColorUtils.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(2, 5),

                          // color: Color.fromRGBO(115, 165, 254, 0.45),
                          // offset: Offset(0.1, 5),
                          // blurRadius: 15,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.h),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              widget.image,
                              height: 30.i,
                              width: 26.i,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Container(
                              width: 60.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    textTitle: widget.title,
                                    textAlign: TextAlign.start,
                                    color: ColorUtils.black,
                                    fontSize: 2.t,
                                    fontFamily: FontUtils.PoppinsSemibold,
                                  ),
                                  // SvgPicture.asset(ImageUtils.heart),
                                  CircleAvatar(
                                    backgroundColor: ColorUtils.grey2,
                                    radius: 12,
                                    child: Center(child:
                                    // SvgPicture.asset(ImageUtils.heart),
                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          likebutton = !likebutton;

                                        });

                                      },
                                      child: CircleAvatar(
                                          radius: 3.5.w,
                                          backgroundColor: ColorUtils.grey2,
                                          child: likebutton?
                                          Icon(
                                            Icons.favorite_outline,
                                            color: ColorUtils.black,
                                            size: 4.5.w,
                                          ):
                                          Icon(
                                            Icons.favorite,
                                            color: ColorUtils.redColorExpiresIn,
                                            size: 4.5.w,
                                          )
                                      ),
                                    )
                                      //   GestureDetector(
                                      //     onTap: (){
                                      //     // if(!model.favoriteselect1){
                                      //     //   // model.favouriteIcon[widget.index!];
                                      //     // }
                                      //       model.favoriteselect1;
                                      //       model.notifyListeners();
                                      //     },
                                      //     child: SvgPicture.asset(widget.Icon,
                                      //       color: model.favoriteselect1 ? Colors.green : Colors.brown,),
                                      //   )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextWidget(
                              textTitle: Constants.resturantLocation,
                              textAlign: TextAlign.start,
                              color: ColorUtils.grey,
                              fontSize: 1.8.t,
                              fontFamily: FontUtils.PoppinsMedium,
                            ),
                            Row(
                                children:[
                                  TextWidget(
                                    textTitle: Constants.foodCategories1,
                                    textAlign: TextAlign.start,
                                    color: ColorUtils.grey,
                                    fontSize: 1.8.t,
                                    fontFamily: FontUtils.PoppinsRegular,
                                  ),
                                  SizedBox(width: 1.w,),
                                  CircleAvatar(
                                    radius: 2,
                                    backgroundColor: ColorUtils.gradientcolor2,
                                  ),
                                  SizedBox(width: 1.w,),
                                  TextWidget(
                                    textTitle: Constants.foodCategories2,
                                    textAlign: TextAlign.start,
                                    color: ColorUtils.grey,
                                    fontSize: 1.8.t,
                                    fontFamily: FontUtils.PoppinsRegular,
                                  ),
                                  SizedBox(width: 1.w,),
                                  CircleAvatar(
                                    radius: 2,
                                    backgroundColor: ColorUtils.gradientcolor2,
                                  ),
                                  SizedBox(width: 1.w,),
                                  TextWidget(
                                    textTitle: Constants.foodCategories3,
                                    textAlign: TextAlign.start,
                                    color: ColorUtils.grey,
                                    fontSize: 1.8.t,
                                    fontFamily: FontUtils.PoppinsRegular,
                                  ),

                                ]),
                            Padding(
                              padding: EdgeInsets.only(left: 0.w, top: 1.5.h,),
                              child: Row(
                                children: [
                                  ExpireTimeOne(
                                    title: Constants.expireTime1,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  PercentOff(title: Constants.percentOff),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

          );}
    );}
}
