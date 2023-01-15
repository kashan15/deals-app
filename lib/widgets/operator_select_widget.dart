import 'package:deals_app/app/locator.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/forgetpass.dart';
import 'package:deals_app/views/main_views/main_views.dart';
import 'package:deals_app/views/verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:flutter/cupertino.dart';

class OperatorSelectWidget extends StatefulWidget {
  const OperatorSelectWidget({Key? key}) : super(key: key);

  @override
  _OperatorSelectWidgetState createState() => _OperatorSelectWidgetState();
}

class _OperatorSelectWidgetState extends State<OperatorSelectWidget> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return Container(
          color: ColorUtils.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Text(
                Constants.selectYourOperator,
                style: CustomTheme.onboardheading,
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: double.infinity,
                height: 9.h,
                decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius: BorderRadius.circular(3.w),
                  boxShadow: [
                    // BoxShadow(color: ColorUtils.blackBorderShadow, blurRadius: 12)
                    BoxShadow(color: ColorUtils.blackBorderShadow, blurRadius: 12)
                  ],
                ),
                padding: EdgeInsets.all(3.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Constants.emailAddress,
                      style: CustomTheme.bottomSheetTextStyle,
                    ),
                    Transform.scale(
                      scale: 1.0,
                      child: Checkbox(
                        shape: CircleBorder(
                        ),

                        focusColor: ColorUtils.gradientcolor2,
                        activeColor: ColorUtils.gradientcolor2,
                        value: model.checkboxEmailSelect,
                        onChanged: (value) {
                          setState(() {
                            model.checkboxMobileSelect = false;
                            model.checkboxEmailSelect = value!;
                            model.notifyListeners();
                          });

                          // model
                          //     .selectEmailAsOperatorCheckBox(
                          //         value!);
                        },
                      ),
                    ),

                    // Container(height: 19,
                    //   width: 19,
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //       gradient: LinearGradient(
                    //         begin: Alignment.topLeft,
                    //         end: Alignment(10, 3),
                    //         colors: <Color>[
                    //           Colors.white,
                    //           Colors.grey,
                    //         ],
                    //       )
                    //   ),
                    //   child: Checkbox(
                    //       value: model.checkboxEmailSelect,
                    //       onChanged: (value) {
                    //         setState(() {
                    //           model.checkboxMobileSelect = false;
                    //           model.checkboxEmailSelect = value!;
                    //           model.notifyListeners();
                    //         });
                    //       }),
                    // ),



                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),

              // mobile number
              Container(
                width: double.infinity,
                height: 9.h,
                decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius: BorderRadius.circular(3.w),
                  boxShadow: [
                    BoxShadow(color: ColorUtils.blackBorderShadow, blurRadius: 12)
                  ],
                ),
                padding: EdgeInsets.all(3.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Constants.mobileNumber,
                      style: CustomTheme.bottomSheetTextStyle,
                    ),
                    Checkbox(
                      shape: CircleBorder(),
                      focusColor: ColorUtils.gradientcolor2,
                      activeColor: ColorUtils.gradientcolor2,
                      value: model.checkboxMobileSelect,
                      onChanged: (value) {
                        setState(() {
                          model.checkboxEmailSelect = false;
                          model.checkboxMobileSelect = value!;
                          model.notifyListeners();
                        });

                        // model
                        //     .selectEmailAsOperatorCheckBox(
                        //         value!);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),

              GestureDetector(
                // onTap: () async{
                //   if(model.checkboxMobileSelect == true) {
                //     await FirebaseAuth.instance.verifyPhoneNumber(
                //       // phoneNumber: '${'+'+model.signupCountryCode.text+model.selectedcountry}',
                //       // phoneNumber: '${model.signupCountryCode.text+model.signupPhoneController.text}',
                //       phoneNumber: '${model.completeLoginPhoneNumber.text}',
                //       // phoneNumber: '+92 3102591461',
                //       verificationCompleted: (PhoneAuthCredential credential) {},
                //       verificationFailed: (FirebaseAuthException e) {},
                //       codeSent: (String verificationId, int? resendToken) {
                //         model.verify = verificationId;
                //         model.navigationService.navigateTo(to: Verification());
                //       },
                //       codeAutoRetrievalTimeout: (String verificationId) {},
                //     );
                //     // model.navigationService.navigateTo(to: Verification());
                //
                //     // model.navigationService.navigateToUntil(
                //     //     to: MainViews(
                //     //   index: 0,
                //     // ));
                //   } else {
                //     model.navigationService.navigateTo(to: ForgetPassword());
                //   }
                //   },
                onTap: (){
                  if(model.checkboxMobileSelect == true){
                    model.navigationService.navigateTo(to: Verification(
                      navigate: "reset",
                    ));
                  }
                  else {
                    model.navigationService.navigateTo(to: Verification(
                      navigate: "intrest",
                    ));
                  }
                },
                child: Container(
                  height: 7.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            ColorUtils.gradientcolor1,
                            ColorUtils.gradientcolor2,
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          stops: [0.1, 0.6]),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      Constants.continueText,
                      style: CustomTheme.buttontext,
                    ),
                  ),
                ),
              ),

              // Container(
              //   height: 7.h,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //         colors: [
              //           ColorUtils
              //               .gradientcolor1,
              //           ColorUtils
              //               .gradientcolor2,
              //         ],
              //         begin: Alignment
              //             .bottomLeft,
              //         end: Alignment.topRight,
              //         stops: [0.1, 0.6],),
              //       borderRadius: BorderRadius.circular(10)),
              //   child: ElevatedButton(
              //     style: ButtonStyle(
              //       backgroundColor:
              //           MaterialStateProperty.all(Colors.transparent),
              //       shadowColor: MaterialStateProperty.all(Colors.transparent),
              //     ),
              //     onPressed: () {
              //       model.navigationService.navigateToUntil(
              //           to: MainViews(
              //         index: 0,
              //       ));
              //
              //       // model.registerValidate(context);
              //     },
              //     child: Text(
              //       "Continue",
              //       style: CustomTheme.buttontext,
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
