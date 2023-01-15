import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/widgets/button_gradient.dart';
import 'package:deals_app/widgets/container_border.dart';
import 'package:deals_app/widgets/container_shadow.dart';
import 'package:deals_app/widgets/listview_separated.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // SizedBox(height: 1.h,),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: ColorUtils.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                )),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height,
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 4.h),
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
                                          margin: EdgeInsets.only(left: 24.w),
                                          child: TextWidget(
                                            textTitle: Constants.contactUs,
                                            textAlign: TextAlign.start,
                                            color: ColorUtils.textColor,
                                            fontSize: 2.5.t,
                                            fontFamily:
                                                FontUtils.PoppinsSemibold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 3.h),
                                    TextWidget(
                                      textTitle: Constants.contactT1,
                                      textAlign: TextAlign.center,
                                      color: ColorUtils.textColor,
                                      fontSize: 2.t,
                                      fontFamily: FontUtils.PoppinsMedium,
                                    ),
                                    SizedBox(height: 1.h),
                                    TextWidget(
                                      textTitle: Constants.contactT2,
                                      textAlign: TextAlign.center,
                                      color: ColorUtils.grey,
                                      fontSize: 2.t,
                                      fontFamily: FontUtils.PoppinsMedium,
                                      height: 0.23.h,
                                    ),
                                    SizedBox(height: 3.h),
                                    TextWidget(
                                      textTitle: Constants.contactPhone,
                                      textAlign: TextAlign.center,
                                      color: ColorUtils.gradientColor,
                                      fontSize: 4.t,
                                      fontFamily: FontUtils.PoppinsMedium,
                                      height: 0.23.h,
                                    ),
                                    TextWidget(
                                      textTitle: Constants.contactT3,
                                      textAlign: TextAlign.center,
                                      color: ColorUtils.grey,
                                      fontSize: 1.7.t,
                                      fontFamily: FontUtils.PoppinsRegular,
                                      height: 0.23.h,
                                    ),
                                    SizedBox(height: 2.h),
                                    Container(

                                      height: 18.h,
                                      width: 87.w,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.transparent.withOpacity(0.1),
                                            spreadRadius: 3,
                                            blurRadius: 10,
                                            offset: Offset(0, 5), // changes position of shadow
                                          ),
                                        ],

                                        color: ColorUtils.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7.w, vertical: 2.h),

                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  ImageUtils.call,
                                                  height: 13.i,
                                                  width: 13.i,
                                                ),
                                                SizedBox(
                                                  width: 2.7.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    TextWidget(
                                                      textTitle:
                                                          Constants.speakUs,
                                                      textAlign:
                                                          TextAlign.start,
                                                      color: ColorUtils
                                                          .textColor,
                                                      fontSize: 2.1.t,
                                                      fontFamily: FontUtils
                                                          .PoppinsSemibold,
                                                    ),
                                                    TextWidget(
                                                      textTitle: Constants
                                                          .supportEmail,
                                                      textAlign:
                                                          TextAlign.start,
                                                      color: ColorUtils
                                                          .gradientColor,
                                                      fontSize: 1.8.t,
                                                      fontFamily: FontUtils
                                                          .PoppinsRegular,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 3.h),
                                            Row(
                                              children: [
                                                ContainerBorder(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                          ImageUtils.whatsApp,
                                                          height: 6.i,
                                                          // fit: BoxFit.cover,
                                                          width: 6.i,
                                                        ),
                                                        SizedBox(
                                                          width: 1.w,
                                                        ),
                                                        TextWidget(
                                                          textTitle: Constants
                                                              .supportNumber,
                                                          textAlign:
                                                              TextAlign.start,
                                                          color: ColorUtils
                                                              .textColor,
                                                          fontSize: 1.3.t,
                                                          fontFamily: FontUtils
                                                              .PoppinsMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 4.w,
                                                ),
                                                ContainerBorder(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                          ImageUtils
                                                              .callNumber,
                                                          height: 6.i,
                                                          width: 6.i,
                                                        ),
                                                        SizedBox(
                                                          width: 1.w,
                                                        ),
                                                        TextWidget(
                                                          textTitle: Constants
                                                              .supportNumber,
                                                          textAlign:
                                                              TextAlign.start,
                                                          color: ColorUtils
                                                              .textColor,
                                                          fontSize: 1.3.t,
                                                          fontFamily: FontUtils
                                                              .PoppinsMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            model.navigationService.back();
                                          },
                                          child: TextWidget(
                                            textTitle: Constants.sendMessage,
                                            textAlign: TextAlign.start,
                                            color: ColorUtils.textColor,
                                            fontSize: 2.5.t,
                                            fontFamily: FontUtils.PoppinsSemibold,
                                          ),
                                        ),
                                        
                                        //ButtonGradient(title: "Send Message", onPressed: (){model.navigationService.back();},)
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                ListView.separated(
                                    padding: EdgeInsets.zero,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:  EdgeInsets.all(5.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  TextWidget(
                                                    textTitle:model.contactUs[index]['NameHeader'],
                                                    textAlign: TextAlign.start,
                                                    color: ColorUtils.grey,
                                                    fontSize: 2.t,
                                                    fontFamily: FontUtils.PoppinsRegular,
                                                  ),
                                                  Container(
                                                    child: TextWidget(
                                                      textTitle: model.contactUs[index]['name'],
                                                      textAlign: TextAlign.start,
                                                      color: ColorUtils.textColor,
                                                      fontSize: 2.t,
                                                      fontFamily: FontUtils.PoppinsMedium,
                                                      maxLines: 5,
                                                      overFlow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Divider();
                                    },
                                    itemCount: model.contactUs.length),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Divider(),
                                    SizedBox(height: 3.h,),
                                    ButtonGradient(title: Constants.sendMessageButton,),
                                    SizedBox(
                                      height: 12.h,
                                    ),





                                  ],
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
            ),
          ),
        );
      },
    );
  }
}
