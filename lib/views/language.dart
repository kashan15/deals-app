import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

  class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
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
                                          margin: EdgeInsets.only(left: 26.w),
                                          child: TextWidget(
                                            textTitle: Constants.language,
                                            textAlign: TextAlign.start,
                                            color: ColorUtils.textColor,
                                            fontSize: 2.5.t,
                                            fontFamily: FontUtils
                                                .PoppinsSemibold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 6.h),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 6,
                                            offset: Offset(0, 5), // changes position of shadow
                                          ),
                                        ],
                                      ),child: Padding(
                                        padding:  EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                             GestureDetector(
                                               onTap:(){
                                                 model.languageSelect == true;
                                               },
                                               child: TextWidget(
                                                 textTitle: Constants.english,
                                                 color: ColorUtils.textColor,
                                                 fontSize: 2.t,
                                                 fontFamily: FontUtils.PoppinsMedium,
                                               ),
                                             ),
                                              // TextWidget(
                                              //   textTitle: Constants.check,
                                              //   color: ColorUtils.gradientColor,
                                              //   fontSize: 2.t,
                                              //   fontFamily: FontUtils.PoppinsRegular,
                                              // ),

                                              Image.asset(ImageUtils.checkIcon,
                                              height: 2.h,
                                              ),
                                            ],
                                          ),
                                          Divider(height: 4.h,),
                                          TextWidget(
                                            textTitle: Constants.arabic,
                                            color: ColorUtils.textColor,
                                            fontSize: 2.t,
                                            fontFamily: FontUtils.PoppinsMedium,
                                          ),
                                        ],
                                    ),
                                      ),
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
