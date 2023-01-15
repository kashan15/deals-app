import 'package:country_dial_code/country_dial_code.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:deals_app/views/login.dart';
import 'package:deals_app/views/main_views/main_views.dart';
import 'package:deals_app/views/verification.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/widgets/operator_select_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:stacked/stacked.dart';
import 'package:country_picker/country_picker.dart';
import '../app/locator.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool showpassword = true;
  bool showpassword1 = true;

  var country_flag;
  // var selectedcountry;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.firstNameRegisterScreen.clear();
        model.lastNameRegisterScreen.clear();
        model.emailRegisterScreen.clear();
        model.phoneNumberRegisterScreen.clear();
        // model.loginPhoneController1.clear();
        model.countryRegisterScreen.clear();
        model.passwordRegisterScreen.clear();
        model.passwordRegisterScreen1.clear();
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
                          SizedBox(height: 10.h),
                          // Row(
                          //   children: [
                          //  Container(
                          //    height: 8.h,
                          //    width:45.w,
                          //    child: Stack(children: [
                          //      Row(children: [

                          Container(
                            child: Container(
                                margin: EdgeInsets.only(left: 48.w, top: 0.h),
                                child: SvgPicture.asset(ImageUtils.Register)),
                          ),
                          Container(
                              child: Text("Register",
                                  style: TextStyle(
                                      fontSize: 6.t,
                                      fontFamily: FontUtils.playfairbold,
                                      color: ColorUtils.black,
                                      height: 0.04.t))),
                          //     ],),
                          //   //   Positioned(
                          //   //     bottom: 10.h,
                          //   //       left:30.w,
                          //   //       child: SvgPicture.asset(ImageUtils.loginIcon))
                          //   // ],),
                          // )
                          // ],
                          // ),
                          //  ,
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            child: Text(
                              "Register with your email and password.",
                              style: CustomTheme.semiheading,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Container(
                            height: 20.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: ColorUtils.grey1,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 5.w, top: 2.h),
                                  child: TextFormField(
                                    controller: model.firstNameRegisterScreen,
                                    style: CustomTheme.placeholder,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "First Name",
                                      hintStyle: CustomTheme.placeholder,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Divider(
                                    // color:ColorUtils.linecolor ,
                                    thickness: 2,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5.w, top: 1.h),
                                  child: TextFormField(
                                    controller: model.lastNameRegisterScreen,
                                    style: CustomTheme.placeholder,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Last Name",
                                      hintStyle: CustomTheme.placeholder,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Container(
                            height: 20.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: ColorUtils.grey1,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 5.w, top: 2.h),
                                  child: TextFormField(
                                    controller: model.emailRegisterScreen,
                                    style: CustomTheme.placeholder,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email Adress",
                                      hintStyle: CustomTheme.placeholder,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Divider(
                                    // color:ColorUtils.linecolor ,
                                    thickness: 2,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 4.w, top: 1.h),
                                  child: IntlPhoneField(
                                    showCountryFlag: false,
                                    textAlignVertical: TextAlignVertical.center,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    dropdownIconPosition: IconPosition.trailing,
                                    //dropDownIcon: Icon(Icons.),
                                    //showDropdownIcon: false,
                                    showDropdownIcon: true,
                                    dropdownIcon: Icon(Icons.keyboard_arrow_down),
                                    style: TextStyle(
                                        fontFamily: FontUtils.PoppinsRegular,
                                        fontSize: 1.8.t,
                                        color: ColorUtils.black,
                                    ),
                                    //autoValidate: false,
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      hintText: "Phone Number",
                                      hintStyle: CustomTheme.placeholder,
                                      suffixText: "",
                                      isDense: true,
                                      alignLabelWithHint: true,
                                      counterText: "",
                                      contentPadding: EdgeInsets.only(top: 0.h,left: 0.w,right: 0.w,bottom: 0.h),
                                      focusedBorder: InputBorder.none,
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 0.0.t,
                                      ),
                                      //alignLabelWithHint: true,
                                      //contentPadding: EdgeInsets.zero,
                                      //labelText: 'Phone Number',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    onTap: (){},
                                    initialCountryCode: 'PE',
                                    onChanged: (phone) {
                                      model.loginCountryCode = phone.countryCode ;
                                      model.loginPhoneController.text = phone.number;
                                      model.completeLoginPhoneNumber.text = phone.completeNumber;
                                      model.notifyListeners();
                                    },
                                  ),
                                  // IntlPhoneField(
                                  //   textAlignVertical: TextAlignVertical.center,
                                  //
                                  //   //countryCodeTextColor: ColorUtils.darkBlue,
                                  //   //  controller: model.loginPhoneController,
                                  //   // controller: TextEditingController(text: '${model.phoneNo}'),
                                  //   controller: model.loginPhoneController1,
                                  //   autovalidateMode: AutovalidateMode.disabled,
                                  //   dropdownIconPosition: IconPosition.trailing,
                                  //   //dropDownIcon: Icon(Icons.),
                                  //   //showDropdownIcon: false,
                                  //   style: CustomTheme.placeholder,
                                  //   // TextStyle(
                                  //   //     fontFamily: FontUtils.PoppinsMedium,
                                  //   //     fontSize: 2.5.t,
                                  //   //     color: ColorUtils.black
                                  //   // ),
                                  //   //autoValidate: false,
                                  //   autofocus: false,
                                  //   decoration: InputDecoration(
                                  //     suffixText: "",
                                  //     isDense: true,
                                  //     alignLabelWithHint: true,
                                  //     counterText: "",
                                  //     contentPadding: EdgeInsets.only(
                                  //         top: 0.h,
                                  //         left: 0.w,
                                  //         right: 0.w,
                                  //         bottom: 0.h),
                                  //     focusedBorder: InputBorder.none,
                                  //     labelStyle: TextStyle(
                                  //       color: Colors.white,
                                  //       fontSize: 0.0.t,
                                  //     ),
                                  //     //alignLabelWithHint: true,
                                  //     //contentPadding: EdgeInsets.zero,
                                  //     //labelText: 'Phone Number',
                                  //     border: OutlineInputBorder(
                                  //       borderSide: BorderSide.none,
                                  //     ),
                                  //   ),
                                  //   onTap: () {},
                                  //   // initialCountryCode: 'PE',
                                  //
                                  //   //initialCountryCode: '${model.loginCountryCode}',
                                  //   initialValue: '${model.country_code}',
                                  //   onChanged: (phone) {
                                  //     // model.country_code! + model.phoneNo!;
                                  //     model.loginCountryCode =
                                  //         phone.countryCode;
                                  //     model.loginPhoneController1.text =
                                  //         phone.number;
                                  //     model.completeLoginPhoneNumber.text =
                                  //         phone.completeNumber;
                                  //     model.notifyListeners();
                                  //   },
                                  // ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Container(
                            height: 20.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: ColorUtils.grey1,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                // Container(
                                //   margin: EdgeInsets.only(left: 5.w, top: 2.h),
                                //   child: TextFormField(
                                //     controller: model.countryRegisterScreen,
                                //     style: CustomTheme.placeholder,
                                //     decoration: InputDecoration(
                                //       border: InputBorder.none,
                                //       hintText: "Country",
                                //       hintStyle: CustomTheme.placeholder,
                                //     ),
                                //   ),
                                // ),

                                Container(
                                  margin: EdgeInsets.only(left: 5.w, top: 1.h),
                                  child: TextFormField(
                                    controller: model.passwordRegisterScreen,
                                    obscureText: showpassword1,
                                    style: CustomTheme.placeholder,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle: CustomTheme.placeholder,
                                        suffixIcon: GestureDetector(
                                            onTap: () {
                                              showpassword1 = !showpassword1;
                                              model.notifyListeners();
                                            },
                                            child: Icon(
                                              showpassword1
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: ColorUtils.grey,
                                            ))),
                                  ),
                                ),

                                SizedBox(height: 1.h),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Divider(
                                    // color:ColorUtils.linecolor ,
                                    thickness: 2,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5.w, top: 1.h),
                                  child: TextFormField(
                                    controller: model.passwordRegisterScreen1,
                                    obscureText: showpassword,
                                    style: CustomTheme.placeholder,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Confirm Password",
                                        hintStyle: CustomTheme.placeholder,
                                        suffixIcon: GestureDetector(
                                            onTap: () {
                                              showpassword = !showpassword;
                                              model.notifyListeners();
                                            },
                                            child: Icon(
                                              showpassword
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: ColorUtils.grey,
                                            ))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              model.registerValidate(context);
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
                                  "Register",
                                  style: CustomTheme.buttontext,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Already have an Account?",
                                style: CustomTheme.mediumtext,
                              ),
                              TextButton(
                                onPressed: () {
                                  // model.navigationService.back();
                                  model.navigationService.navigateTo(to: Login());
                                },
                                child: Text("Login",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 1.7.t,
                                      fontFamily: FontUtils.PoppinsMedium,
                                      color: ColorUtils.black,
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
                  ),
                )));
      },
    );
  }
}
