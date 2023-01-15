import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/views/forgetpass.dart';
import 'package:deals_app/views/interest/interest.dart';
import 'package:deals_app/views/onboarding.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/widgets/button_gradient.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:stacked/stacked.dart';
import '../app/locator.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key, required this.navigate}) : super(key: key);
  final navigate;

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final FirebaseAuth auth = FirebaseAuth.instance;

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
                      body: SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.h),
                                // Row(
                                //   children: [
                                //  Container(
                                //    height: 8.h,
                                //    width:45.w,
                                //    child: Stack(children: [
                                //      Row(children: [
                                Text(Constants.verification,
                                    // style: CustomTheme.heading
                                  style: TextStyle(
                                      fontSize: 7.t,
                                      fontFamily: FontUtils.playfairbold,
                                      color: ColorUtils.black
                                  ),
                                ),
                                Container(
                                  // height: 5.5.h,
                                  width: 80.w,
                                  // color: ColorUtils.redColorExpiresIn,
                                  child: Text(
                                    Constants.verifyWithCodeRecevive,
                                    // style: CustomTheme.semiheading,
                                    style: TextStyle(
                                      fontSize: 2.6.t,
                                      color: ColorUtils.grey
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                                  child: OtpTextField(
                                    onCodeChanged: (value) {
                                      model.verificationOtpController.text =
                                          value;
                                      model.notifyListeners();
                                    },
                                    fillColor: ColorUtils.grey1,
                                    filled: true,
                                    numberOfFields: 4,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    showFieldAsBox: true,
                                    enabledBorderColor: ColorUtils.grey1,
                                    disabledBorderColor: ColorUtils.grey1,
                                    borderColor: ColorUtils.grey1,
                                    fieldWidth: 15.w,
                                    obscureText: true,
                                    textStyle: TextStyle(
                                        fontFamily: FontUtils.PoppinsSemibold,
                                        fontWeight: FontWeight.w900,
                                        height: 0.5,
                                        fontSize: 5.t),
                                    borderRadius: BorderRadius.circular(10),
                                    focusedBorderColor: ColorUtils.grey1,
                                  ),
                                ),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Center(
                                  child: Container(
                                    child: Text(
                                      Constants.resendCodeIn,
                                      style: CustomTheme.mediumtext,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ButtonGradient(
                                  onPressed: () {

                                    // if(widget.navigate=="reset"){
                                    //   print("*(***");
                                    //   model.navigationService.navigateTo(to: InterestScreen());
                                    // }
                                    // else{
                                    //   model.navigationService.navigateTo(to: InterestScreen());
                                    // }

                                    model.navigationService.navigateTo(to: InterestScreen());

                                    // PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: model.verify , smsCode: smsCode);
                                    // await auth.signInWithCredential(credential);
                                    // },
                                    // model.navigationService.navigateTo(to: InterestScreen());
                                  },
                                  title: Constants.verify,
                                )
                                // Center(
                                //   child: Container(
                                //     height: 7.h,
                                //     width: double.infinity,
                                //     decoration: BoxDecoration(
                                //         gradient: LinearGradient(colors: [
                                //           ColorUtils.gradientcolor1,
                                //           ColorUtils.gradientcolor2,
                                //         ], stops: [
                                //           0.1,
                                //           0.6
                                //         ]),
                                //         borderRadius:
                                //             BorderRadius.circular(10)),
                                //     child: ElevatedButton(
                                //       style: ButtonStyle(
                                //         backgroundColor:
                                //             MaterialStateProperty.all(
                                //                 Colors.transparent),
                                //         shadowColor: MaterialStateProperty.all(
                                //             Colors.transparent),
                                //       ),
                                //       onPressed: () {
                                //         model.resetPasswordPasswordValidation(context);
                                //
                                //       },
                                //       child: Text(
                                //         "Verify",
                                //         style: CustomTheme.buttontext,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ]),
                        ),
                      ),
                    ))));
      },
    );
  }
}
