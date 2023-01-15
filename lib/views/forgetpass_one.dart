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

class ForgetPasswordOne extends StatefulWidget {
  const ForgetPasswordOne({Key? key}) : super(key: key);

  @override
  _ForgetPasswordOneState createState() => _ForgetPasswordOneState();
}

class _ForgetPasswordOneState extends State<ForgetPasswordOne> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.resetEmailController.clear();
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
                              margin: EdgeInsets.symmetric(horizontal: 6.w),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5.h),
                                    Container(
                                        height: 15.h,
                                        width: 80.w,
                                        child: Stack(
                                          children: [
                                            Container(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(Constants.forgetPasswordText,
                                                    style:
                                                    // CustomTheme.heading
                                                TextStyle(
                                                  fontSize: 3.5.t,
                                                  fontFamily: FontUtils.playfairbold
                                                )
                                                )),
                                            Positioned(
                                                left: 55.w,
                                                bottom: 2.h,
                                                child: SvgPicture.asset(
                                                    ImageUtils.loginIcon))
                                          ],
                                        )),
                                    Text(
                                      Constants.resetPassword1,
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
                                          // controller: model.resetPasswordController,
                                          controller: model.resetEmailController,
                                          style: CustomTheme.placeholder,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: Constants.emailText,
                                            hintStyle: CustomTheme.placeholder,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 1.h,
                                    ),

                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                                      child: Container(
                                        height: 5.h,
                                        width: 80.w,
                                        // color: ColorUtils.redColorExpiresIn,
                                        child: Center(
                                          child: Text("Enter your email to receive Reset Password Link.",
                                          style: TextStyle(
                                            fontSize: 1.4.t,
                                            color: ColorUtils.grey,
                                            fontFamily: FontUtils.Poppinsitalic
                                          ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Container(
                                    //   height: 10.h,
                                    //   width: double.infinity,
                                    //   decoration: BoxDecoration(
                                    //       color: ColorUtils.grey1,
                                    //       borderRadius: BorderRadius.circular(10)),
                                    //   child: Container(
                                    //     margin:
                                    //     EdgeInsets.only(left: 5.w, top: 2.h),
                                    //     child: TextFormField(
                                    //       controller:
                                    //       model.resetConfirmPasswordController,
                                    //       style: CustomTheme.placeholder,
                                    //       decoration: InputDecoration(
                                    //         border: InputBorder.none,
                                    //         hintText: Constants.confirmPassword,
                                    //         hintStyle: CustomTheme.placeholder,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),



                                    // Center(
                                    //     child: Container(
                                    //   child: Text(
                                    //       Constants
                                    //           .enterEmailReceiveResetPasswordLink,
                                    //       style: CustomTheme.italicheading),
                                    // )),


                                    SizedBox(height: 4.h),
                                    ButtonGradient(
                                        title: Constants.forgetPassword,
                                        onPressed: () {
                                          model.resetPasswordValidationBackToLogin(context);
                                        }),
                                    SizedBox(height: 13.h),
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
