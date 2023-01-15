import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ColorUtils.gradientcolor1,
                          ColorUtils.gradientcolor2,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        stops: [0.1, 0.6],
                      )),
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: SingleChildScrollView(
                            child: Container(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              decoration: BoxDecoration(
                                  color: ColorUtils.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  )),
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 3.h),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            model.navigationService.back();
                                          },
                                          child: Container(
                                              child: Icon(
                                                Icons.arrow_back,
                                                color: ColorUtils.textColor,
                                              )),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 28.w),
                                          child: TextWidget(
                                            textTitle: Constants.aboutUs,
                                            textAlign: TextAlign.start,
                                            color: ColorUtils.textColor,
                                            fontSize: 2.5.t,
                                            fontFamily: FontUtils
                                                .PoppinsSemibold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4.h),
                                    TextWidget(
                                      textTitle: Constants.ourMission,
                                      textAlign: TextAlign.start,
                                      color: ColorUtils.textHeadingColor,
                                      fontSize: 2.5.t,
                                      fontFamily: FontUtils.PoppinsSemibold,
                                    ),
                                    SizedBox(height: 2.h),
                                    TextWidget(
                                      textTitle: Constants.loremText,
                                      textAlign: TextAlign.start,
                                      color: ColorUtils.textColor,
                                      fontSize: 1.6.t,
                                      fontFamily: FontUtils.PoppinsRegular,
                                    ),
                                    SizedBox(height: 3.h),
                                    TextWidget(
                                      textTitle: Constants.whoWeAre,
                                      textAlign: TextAlign.start,
                                      color: ColorUtils.textHeadingColor,
                                      fontSize: 2.5.t,
                                      fontFamily: FontUtils.PoppinsSemibold,
                                    ),
                                    SizedBox(height: 2.h),
                                    TextWidget(
                                      textTitle: Constants.loremText,
                                      textAlign: TextAlign.start,
                                      color: ColorUtils.textColor,
                                      fontSize: 1.6.t,
                                      fontFamily: FontUtils.PoppinsRegular,
                                    ),
                                    SizedBox(height: 3.h),
                                    TextWidget(
                                      textTitle: Constants.whatWeDo,
                                      textAlign: TextAlign.start,
                                      color: ColorUtils.textHeadingColor,
                                      fontSize: 2.5.t,
                                      fontFamily: FontUtils.PoppinsSemibold,
                                    ),
                                    SizedBox(height: 2.h),
                                    TextWidget(
                                      textTitle: Constants.loremText,
                                      textAlign: TextAlign.start,
                                      color: ColorUtils.textColor,
                                      fontSize: 1.6.t,
                                      fontFamily: FontUtils.PoppinsRegular,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),);
      },
    );
  }
}
