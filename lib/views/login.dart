import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/views/forgetpass.dart';
import 'package:deals_app/views/forgetpass_one.dart';
import 'package:deals_app/views/register.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/widgets/button_gradient.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:stacked/stacked.dart';
import '../app/locator.dart';

bool obscuretext = true;
bool isSwitched = false;
void toggleSwitch(bool value) {
  isSwitched = !isSwitched;
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.emailRegisterScreen.clear();
        model.passwordRegisterScreen.clear();
        model.notifyListeners();
      },
      builder: (context, model, child) {
        return SafeArea(
            top: false,
            bottom: false,
            child: WillPopScope(
                onWillPop: () async {
                  SystemNavigator.pop();
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
                            SizedBox(height: 10.h),
                            Container(
                              height: 12.h,
                              width: 40.w,
                              child: Stack(
                                children: [
                                  Container(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(Constants.login,
                                          style: CustomTheme.heading)),
                                  Positioned(
                                      left: 24.w,
                                      bottom: 2.8.h,
                                      child: SvgPicture.asset(
                                          ImageUtils.loginIcon))
                                ],
                              ),
                            ),
                            Text(
                              Constants.loginWithYourUserNameOrEmail,
                              style: CustomTheme.semiheading,
                            ),
                            SizedBox(height: 5.h),
                            Form(
                              key: model.formKey,
                              child: Container(
                                height: 20.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: ColorUtils.grey1,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 5.w, top: 2.h),
                                      child: TextFormField(
                                        controller: model.loginEmailOrPhone,
                                        style: CustomTheme.placeholder,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText:
                                              Constants.hintTextEmailOrPhone,
                                          hintStyle: CustomTheme.placeholder,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    Container(
                                      alignment: Alignment.center,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child: Divider(
                                        // color:ColorUtils.linecolor ,
                                        thickness: 2,
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 5.w, top: 1.h),
                                      child: TextFormField(
                                        controller: model.loginPassword,
                                        obscureText: obscuretext,
                                        style: CustomTheme.placeholder,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText:
                                                Constants.hintTextPassword,
                                            hintStyle: CustomTheme.placeholder,
                                            suffixIcon: GestureDetector(
                                                onTap: () {
                                                  obscuretext = !obscuretext;
                                                  model.notifyListeners();
                                                },
                                                child: Icon(obscuretext
                                                    ? Icons.visibility_off
                                                    : Icons.visibility))),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Constants.rememberPassword,
                                  style: CustomTheme.placeholder,
                                ),
                                Container(
                                  // height: 4.h,
                                  // width: 13.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                        colors:
                                            model.loginRememberPasswordSwitch
                                                ? [
                                                    ColorUtils.gradientcolor1,
                                                    ColorUtils.gradientcolor2,
                                                  ]
                                                : [
                                                    ColorUtils.white,
                                                    ColorUtils.white,
                                                  ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        stops: [0.1, 0.6]),
                                  ),
                                  child: FlutterSwitch(
                                      height: 3.5.h,
                                      width: 12.w,
                                      toggleSize: 5.5.i,
                                      toggleColor: ColorUtils.white,
                                      activeColor: Colors.transparent,
                                      inactiveColor: ColorUtils.grey,
                                      value: model.loginRememberPasswordSwitch,
                                      onToggle: (val) {
                                        model.loginRememberPasswordSwitch = val;
                                        model.notifyListeners();
                                      }),
                                )
                              ],
                            ),
                            SizedBox(height: 4.h),
                            ButtonGradient(
                              title: Constants.loginWithYourId,
                              onPressed: () {
                                model.loginValidate(context);
                              },
                            ),
                            // GestureDetector(
                            //       onTap: () {
                            //         model.loginValidate(context);
                            //       },
                            //       child: Container(
                            //         height: 7.h,
                            //         width: double.infinity,
                            //         decoration: BoxDecoration(
                            //             gradient: LinearGradient(
                            //                 colors: [
                            //                   ColorUtils.gradientcolor1,
                            //                   ColorUtils.gradientcolor2,
                            //                 ],
                            //                 begin: Alignment.bottomLeft,
                            //                 end: Alignment.topRight,
                            //                 stops: [0.1, 0.6]),
                            //             borderRadius: BorderRadius.circular(10)),
                            //         child: Center(
                            //           child: Text(
                            //             Constants.loginWithYourId,
                            //             style: CustomTheme.buttontext,
                            //           ),
                            //         ),
                            //       ),
                            //     ),

                            // Container(
                            //   height: 7.h,
                            //   width: double.infinity,
                            //   decoration: BoxDecoration(
                            //       gradient: LinearGradient(
                            //         colors: [
                            //           ColorUtils.gradientcolor1,
                            //           ColorUtils.gradientcolor2,
                            //         ],
                            //         begin: Alignment.bottomLeft,
                            //         end: Alignment.topRight,
                            //         stops: [0.1, 0.6],
                            //       ),
                            //       borderRadius: BorderRadius.circular(10)),
                            //   child: ElevatedButton(
                            //     style: ButtonStyle(
                            //       backgroundColor: MaterialStateProperty.all(
                            //           Colors.transparent),
                            //       shadowColor: MaterialStateProperty.all(
                            //           Colors.transparent),
                            //     ),
                            //     onPressed: () {
                            //       model.loginValidate(context);
                            //     },
                            //     child: Text(
                            //       "Login With Your ID",
                            //       style: CustomTheme.buttontext,
                            //     ),
                            //   ),
                            // ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 10.0, right: 15.0),
                                    child: Divider(
                                      thickness: 1.5,
                                      color: ColorUtils.grey.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                                Text(
                                  Constants.or,
                                  style: CustomTheme.smallfont,
                                ),
                                Expanded(
                                    child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 15.0, right: 10.0),
                                  child: Divider(
                                    color: ColorUtils.grey.withOpacity(0.5),
                                    thickness: 1.5,
                                  ),
                                )),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding:
                                    EdgeInsets.only(left: 6.w, right: 1.5.w),
                                height: 8.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: ColorUtils.facebookcolor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      Constants.loginWithFacebook,
                                      style: CustomTheme.logoheading,
                                    ),
                                    Container(
                                      height: 6.5.h,
                                      // width: 12.w,
                                      width: 14.w,
                                      padding: EdgeInsets.all(2.8.w),
                                      decoration: BoxDecoration(
                                          color: ColorUtils.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: SvgPicture.asset(
                                        ImageUtils.facebooklogo,
                                        color: ColorUtils.facebookcolor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding:
                                    EdgeInsets.only(left: 6.w, right: 1.5.w),
                                height: 8.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: ColorUtils.googlecolor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(Constants.loginWithGoogle,
                                        style: CustomTheme.logoheading),
                                    Container(
                                      height: 6.5.h,
                                      // width: 12.w,
                                      width: 14.w,
                                      padding: EdgeInsets.all(2.8.w),
                                      decoration: BoxDecoration(
                                          color: ColorUtils.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: SvgPicture.asset(
                                        ImageUtils.googlelogo,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.only(left: 6.w, right: 2.w),
                                height: 8.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: ColorUtils.applecolor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(Constants.loginWithApple,
                                        style: CustomTheme.logoheading),
                                    Container(
                                      height: 6.5.h,
                                      // width: 12.w,
                                      width: 14.w,
                                      padding: EdgeInsets.all(2.8.w),
                                      decoration: BoxDecoration(
                                          color: ColorUtils.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: SvgPicture.asset(
                                        ImageUtils.applelogo,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    model.navigationService.navigateTo(to: Register());
                                  },
                                  child: Text(Constants.createAccount,
                                      style: CustomTheme.mediumtext),
                                ),
                                Container(
                                  // color: ColorUtils.redColorExpiresIn,
                                  margin: EdgeInsets.only(left: 0.w),
                                    child: Icon(Icons.arrow_right_alt,
                                    size: 7.i,
                                    )),
                                SizedBox(width: 20.w,),
                                TextButton(
                                  onPressed: () {
                                    // model.navigationService.navigateTo(to: ForgetPassword());
                                    model.navigationService.navigateTo(to: ForgetPasswordOne());
                                  },
                                  child: Text(Constants.forgotPassword,
                                      style: CustomTheme.mediumtext),
                                )
                              ],
                            ),
                            SizedBox(height: 2.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                )));
      },
    );
  }
}
