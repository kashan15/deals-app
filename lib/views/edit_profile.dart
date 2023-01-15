import 'package:deals_app/custom/custombtn.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/main_views/main_views.dart';
import 'package:deals_app/views/settings.dart';
import 'package:deals_app/widgets/button_gradient.dart';
import 'package:deals_app/widgets/container_textfield.dart';
import 'package:deals_app/widgets/container_textfield_five.dart';
import 'package:deals_app/widgets/container_textfield_four.dart';
import 'package:deals_app/widgets/container_textfield_one.dart';
import 'package:deals_app/widgets/container_textfield_three.dart';
import 'package:deals_app/widgets/container_textfield_two.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../app/locator.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.firstNameRegisterScreen.text = Constants.userFirstName;
        model.lastNameRegisterScreen.text = Constants.userLastName;
        model.userEmail.text = Constants.userEmail;
        model.userPhone.text = Constants.supportNumber;
        model.countryRegisterScreen.text = Constants.userCountry;
        model.city.text = Constants.userCity;
        model.userName.clear();
        model.firstName.clear();
        model.familyName.clear();
        model.dob.clear();
        model.email.clear();
        model.password.clear();
        model.confirmPass.clear();
        model.phoneNum.clear();
        model.country.clear();
        model.city.clear();
        model.address.clear();
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
                body: Stack(
                  children: <Widget>[
                    Container(
                      height: 25.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            ColorUtils.gradientcolor1,
                            ColorUtils.gradientcolor2,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          stops: [0.1, 0.6],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(50))),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 12.h),
                      child: Card(
                        margin: EdgeInsets.zero,
                        borderOnForeground: false,
                        color: ColorUtils.white,
                        shadowColor: ColorUtils.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: ColorUtils.white, width: 1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        model.navigationService.back();
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: ColorUtils.textColor,
                                      ),
                                    ),
                                    SizedBox(width: 19.w,),
                                    TextWidget(
                                      textTitle: Constants.editProfile,
                                      color: ColorUtils.textColor,
                                      fontSize: 2.5.t,
                                      fontFamily: FontUtils.PoppinsSemibold,
                                    ),
                                    // SizedBox(width: 15.w,),
                                    // TextWidget(
                                    //   textTitle: Constants.editProfile,
                                    //   color: Colors.transparent,
                                    //   fontSize: 1.t,
                                    //   fontFamily: FontUtils.PoppinsSemibold,
                                    // ),
                                    SizedBox(width: 18.w,),
                                    IconButton(
                                        onPressed: (){
                                          model.navigationService.navigateTo(to: Settings());
                                        },
                                        icon: SvgPicture.asset(ImageUtils.settings)
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Stack(
                                    //   children: [
                                    //     Container(
                                    //       height: 20.h,
                                    //       width: 40.w,
                                    //       child: Image.asset(
                                    //           ImageUtils.profileImage),
                                    //       decoration: BoxDecoration(
                                    //         shape: BoxShape.circle,
                                    //         boxShadow: [
                                    //           BoxShadow(
                                    //               color: ColorUtils.grey,
                                    //               offset: Offset(0.1, 5),
                                    //               blurRadius: 5)
                                    //         ],
                                    //       ),
                                    //     ),
                                    //     Positioned(
                                    //       left: 31.w,
                                    //       top: 13.h,
                                    //       child: GestureDetector(
                                    //         onTap: () {},
                                    //         child: Container(
                                    //           height: 5.h,
                                    //           width: 8.w,
                                    //           decoration: BoxDecoration(
                                    //             color: ColorUtils.white,
                                    //             boxShadow: [
                                    //               BoxShadow(
                                    //                   color: ColorUtils.grey,
                                    //                   offset: Offset(0.1, 5),
                                    //                   blurRadius: 5)
                                    //             ],
                                    //             shape: BoxShape.circle,
                                    //           ),
                                    //           child: Icon(
                                    //             Icons.camera_alt,
                                    //             color:
                                    //                 ColorUtils.gradientcolor2,
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     )
                                    //   ],
                                    // ),

                                    PopupMenuButton(
                                      offset: Offset(50,-5),
                                      child:
                                      Container(
                                        height: 20.h,
                                        width: 40.w,
                                        child: Image.asset(
                                            ImageUtils.profileImage1),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: ColorUtils.white,
                                                offset: Offset(0.1, 5),
                                                blurRadius: 5)
                                          ],
                                        ),
                                      ),
                                      itemBuilder: (_) => <PopupMenuItem<String>>[
                                        new PopupMenuItem<String>(
                                          child: new Text('Camera'), value: 'Camera',
                                          onTap: (){
                                            model.enterDetailsOpenCamera();
                                          },
                                        ),
                                        new PopupMenuItem<String>(
                                          child: new Text('Gallery'), value: 'Gallery',
                                          onTap: (){
                                            model.enterDetailsGetImage();
                                          },
                                        ),
                                      ],
                                    ),

                                    // Container(
                                    //   height: 20.h,
                                    //   width: 40.w,
                                    //   child: Image.asset(
                                    //       ImageUtils.profileImage1),
                                    //   decoration: BoxDecoration(
                                    //     shape: BoxShape.circle,
                                    //     boxShadow: [
                                    //       BoxShadow(
                                    //           color: ColorUtils.white,
                                    //           offset: Offset(0.1, 5),
                                    //           blurRadius: 5)
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                ContainerTextFieldOne(
                                  field1: model.userName,
                                  field2: model.firstName,
                                  field3: model.familyName,
                                  field4: model.dob,

                                ),
                                // ContainerTextField(
                                //   field1: model.firstNameRegisterScreen,
                                //   field2: model.lastNameRegisterScreen,
                                // ),
                                SizedBox(
                                  height: 2.h,
                                ),

                                ContainerTextFieldTwo(
                                  field1: model.email,
                                  field2: model.password,
                                  field3: model.confirmPass,
                                ),

                                SizedBox(
                                  height: 2.h,
                                ),

                                ContainerTextFieldFour(
                                  field1: model.phoneNum,

                                ),

                                SizedBox(
                                  height: 2.h,
                                ),

                                ContainerTextFieldThree(
                                  field1: model.country,
                                  field2: model.city,
                                  field3: model.address,
                                ),


                                SizedBox(
                                  height: 2.h,
                                ),

                                ContainerTextFieldFive(

                                ),
                                // ContainerTextField(
                                //   field1: model.userEmail,
                                //   field2: model.userPhone,
                                // ),
                                // SizedBox(
                                //   height: 2.h,
                                // ),
                                // ContainerTextField(
                                //   field1: model.countryRegisterScreen,
                                //   field2: model.city,
                                // ),


                                SizedBox(
                                  height: 5.h,
                                ),
                                ButtonGradientTwo(
                                  title: Constants.updateProfile,
                                  // onPressed: (){ model.updateProfile(context);},
                                  onPressed: (){
                                    model.navigationService.navigateTo(to: MainViews(index: 0));
                                  },
                                ),

                                SizedBox(
                                  height: 4.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                        elevation: 0.0,
                        clipBehavior: Clip.antiAlias,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
