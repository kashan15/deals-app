import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/about_us.dart';
import 'package:deals_app/views/contact_us.dart';
import 'package:deals_app/views/edit_profile.dart';
import 'package:deals_app/views/language.dart';
import 'package:deals_app/views/login.dart';
import 'package:deals_app/views/terms_policies.dart';
import 'package:deals_app/widgets/container_shadow.dart';
import 'package:deals_app/widgets/switch_button.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
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
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: ColorUtils.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  )),
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 7.h),
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
                                              textTitle: Constants.settings,
                                              textAlign: TextAlign.start,
                                              color: ColorUtils.textColor,
                                              fontSize: 2.5.t,
                                              fontFamily:
                                                  FontUtils.PoppinsSemibold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2.h),
                                      GestureDetector(
                                        onTap: () {
                                          model.navigationService
                                              .navigateTo(to: Language());
                                        },
                                        child: ContainerShadow(
                                          padding: EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 2.w),
                                                child: TextWidget(
                                                  textTitle: Constants.language,
                                                  textAlign: TextAlign.start,
                                                  color: ColorUtils.textColor,
                                                  fontSize: 2.t,
                                                  fontFamily:
                                                      FontUtils.PoppinsMedium,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Row(
                                                children: [
                                                  TextWidget(
                                                    textTitle:
                                                        Constants.english,
                                                    textAlign: TextAlign.start,
                                                    color: ColorUtils.grey,
                                                    fontSize: 2.t,
                                                    fontFamily:
                                                        FontUtils.PoppinsMedium,
                                                  ),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.arrow_forward,
                                                        color: ColorUtils.grey,
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 2.5.h),
                                      ContainerShadow(
                                        padding: EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(left: 2.w),
                                              child: TextWidget(
                                                textTitle: Constants.myAddress,
                                                textAlign: TextAlign.start,
                                                color: ColorUtils.textColor,
                                                fontSize: 2.t,
                                                fontFamily:
                                                    FontUtils.PoppinsMedium,
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.arrow_forward,
                                                  color: ColorUtils.grey,
                                                )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 2.5.h),
                                      ContainerShadow(
                                        padding: EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(left: 2.w),
                                              child: TextWidget(
                                                textTitle:
                                                    Constants.updatesOnWhatsapp,
                                                textAlign: TextAlign.start,
                                                color: ColorUtils.textColor,
                                                fontSize: 2.t,
                                                fontFamily:
                                                    FontUtils.PoppinsMedium,
                                              ),
                                            ),
                                            SwitchWidget(
                                              status: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 2.5.h),
                                      ContainerShadow(
                                        padding: EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(left: 2.w),
                                              child: TextWidget(
                                                textTitle: Constants
                                                    .promotinalMessages,
                                                textAlign: TextAlign.start,
                                                color: ColorUtils.textColor,
                                                fontSize: 2.t,
                                                fontFamily:
                                                    FontUtils.PoppinsMedium,
                                              ),
                                            ),
                                            SwitchWidget(
                                              status: false,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 2.5.h),
                                      ContainerShadow(
                                        padding: EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(left: 2.w),
                                              child: TextWidget(
                                                textTitle:
                                                    Constants.promotinalEmail,
                                                textAlign: TextAlign.start,
                                                color: ColorUtils.textColor,
                                                fontSize: 2.t,
                                                fontFamily:
                                                    FontUtils.PoppinsMedium,
                                              ),
                                            ),
                                            SwitchWidget(
                                              status: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 2.5.h),
                                      GestureDetector(
                                        onTap: () {
                                          model.navigationService
                                              .navigateTo(to: AboutUs());
                                        },
                                        child: ContainerShadow(
                                          padding: EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 2.w),
                                                child: TextWidget(
                                                  textTitle: Constants.aboutUs,
                                                  textAlign: TextAlign.start,
                                                  color: ColorUtils.textColor,
                                                  fontSize: 2.t,
                                                  fontFamily:
                                                      FontUtils.PoppinsMedium,
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.arrow_forward,
                                                    color: ColorUtils.grey,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 2.5.h),
                                      GestureDetector(
                                        onTap: () {
                                          model.navigationService
                                              .navigateTo(to: TermsPolices());
                                        },
                                        child: ContainerShadow(
                                          padding: EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 2.w),
                                                child: TextWidget(
                                                  textTitle:
                                                      Constants.termsPolicies,
                                                  textAlign: TextAlign.start,
                                                  color: ColorUtils.textColor,
                                                  fontSize: 2.t,
                                                  fontFamily:
                                                      FontUtils.PoppinsMedium,
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.arrow_forward,
                                                    color: ColorUtils.grey,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 1.h),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      ListView.separated(
                                          padding: EdgeInsets.zero,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                if (model.settingsOpt[index]
                                                        ['title'] ==
                                                    Constants.editProfile) {
                                                  model.navigationService
                                                      .navigateTo(
                                                          to: EditProfile());
                                                } else if (model
                                                            .settingsOpt[index]
                                                        ['title'] ==
                                                    Constants.contactUs) {
                                                  model.navigationService
                                                      .navigateTo(
                                                          to: ContactUs());
                                                } else if (model
                                                            .settingsOpt[index]
                                                        ['title'] ==
                                                    Constants.logout) {
                                                  model.navigationService
                                                      .navigateToUntil(
                                                          to: Login());
                                                }
                                              },
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 1.5.h),
                                                decoration: BoxDecoration(
                                                  color: ColorUtils.white,
                                                ),
                                               child:
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Image.asset(
                                                              model.settingsOpt[
                                                                  index]['icon'],
                                                              height: 10.i,
                                                              width: 10.i,
                                                            ),
                                                            SizedBox(
                                                              width: 2.w,
                                                            ),
                                                            TextWidget(
                                                              textTitle: model.settingsOpt[index]['title'],
                                                              textAlign: TextAlign.start,
                                                              color: ColorUtils.textColor,
                                                              fontFamily: FontUtils
                                                                  .PoppinsSemibold,
                                                              fontSize: 1.5.t,
                                                            ),
                                                          ],
                                                        ),
                                                        index == 0
                                                            ? SwitchWidget(
                                                                status: true,
                                                              )
                                                            : index == 1 ?
                                                        SwitchWidget(
                                                          status: true,
                                                        ) :
                                                        index == 2 ?
                                                        SwitchWidget(
                                                          status: true,
                                                        ) :
                                                        Icon(
                                                                Icons.keyboard_arrow_right,
                                                                color: ColorUtils.grey,
                                                              )

                                                      ],
                                                    ),


                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return Divider();
                                          },
                                          itemCount: model.settingsOpt.length),
                                      SizedBox(
                                        height: 12.h,
                                      ),

                                    ],
                                  ),
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
          ),
        );
      },
    );
  }
}
