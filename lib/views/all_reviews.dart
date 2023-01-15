import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/widgets/rating_widget.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AllRewiews extends StatefulWidget {
  const AllRewiews({Key? key}) : super(key: key);

  @override
  State<AllRewiews> createState() => _AllRewiewsState();
}

class _AllRewiewsState extends State<AllRewiews> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.selectCategory = null;
        model.notifyListeners();

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
                        margin: EdgeInsets.only(top: 12.h),
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
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 2.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,color: ColorUtils.textColor,),),
                                            TextWidget(
                                              textTitle: Constants.reviews,
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
                                        SizedBox(height: 2.h,),

                                        TextWidget(
                                          textTitle: Constants.allReviews,
                                          color: ColorUtils.textColor,
                                          fontSize: 2.5.t,
                                          fontFamily: FontUtils.PoppinsSemibold,
                                        ),
                                        SizedBox(height: 1.h,),

                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                TextWidget(
                                                  textTitle: Constants.ratingPoint,
                                                  color: ColorUtils.textColor,
                                                  fontSize: 6.t,
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
                                            SizedBox(width: 4.w,),

                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                SizedBox(height: 3.h,),
                                                Image.asset(ImageUtils.progressbar,
                                                  height: 7.5.h,
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
                                        ListView.separated(
                                          padding: EdgeInsets.zero,
                                          physics: NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                            itemBuilder: (context,index){
                                          return   Column(
                                            children: [
                                              // SizedBox(height: 1.h,),
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




                                      ],
                                    ),
                                  ),









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
