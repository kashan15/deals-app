import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/login.dart';
import 'package:deals_app/views/verification.dart';
import 'package:deals_app/widgets/button_gradient.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../app/locator.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.resetPasswordController.clear();
        model.notifyListeners();
      },
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
                        body: SingleChildScrollView(
                            child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5.h),
                                Container(
                                    height: 12.h,
                                    width: 40.w,
                                    child: Stack(
                                      children: [
                                        Container(
                                            alignment: Alignment.bottomLeft,
                                            child: Text(Constants.reset,
                                                style: CustomTheme.heading)),
                                        Positioned(
                                            left: 26.w,
                                            bottom: 2.h,
                                            child: SvgPicture.asset(
                                                ImageUtils.loginIcon))
                                      ],
                                    )),
                                Text(
                                  Constants.resetPassword,
                                  style: CustomTheme.semiheading,
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Container(
                                  height: 10.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: ColorUtils.grey1,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(left: 5.w, top: 2.h),
                                    child: TextFormField(
                                      controller: model.resetPasswordController,
                                      style: CustomTheme.placeholder,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: Constants.password,
                                        hintStyle: CustomTheme.placeholder,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Container(
                                  height: 10.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: ColorUtils.grey1,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(left: 5.w, top: 2.h),
                                    child: TextFormField(
                                      controller:
                                          model.resetConfirmPasswordController,
                                      style: CustomTheme.placeholder,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: Constants.confirmPassword,
                                        hintStyle: CustomTheme.placeholder,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                // Center(
                                //     child: Container(
                                //   child: Text(
                                //       Constants
                                //           .enterEmailReceiveResetPasswordLink,
                                //       style: CustomTheme.italicheading),
                                // )),
                                SizedBox(height: 6.h),
                                ButtonGradient(
                                    title: Constants.resetPassword,
                                    onPressed: () {
                                      model.resetPasswordValidationBackToLoginOne(context);
                                    }),
                                SizedBox(height: 6.h),
                                Container(
                                  height: height / 2,
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        Constants.alreadyHaveAccount,
                                        style: CustomTheme.mediumtext,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          model.navigationService
                                              .navigateToReplacement(
                                                  to: Login());
                                        },
                                        child: Text(Constants.login,
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 1.7.t,
                                              fontFamily:
                                                  FontUtils.PoppinsMedium,
                                              color: ColorUtils.black,
                                            )),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ))))));
      },
    );
  }
}
