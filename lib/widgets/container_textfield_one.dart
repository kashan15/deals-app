import 'dart:ui';

import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class ContainerTextFieldOne extends StatefulWidget {
  dynamic field1;
  dynamic field2;
  dynamic field3;
  dynamic field4;
  ContainerTextFieldOne({this.field1,this.field2,this.field3,this.field4});

  @override
  State<ContainerTextFieldOne> createState() => _ContainerTextFieldOneState();
}

class _ContainerTextFieldOneState extends State<ContainerTextFieldOne> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => locator<MainViewModel>(),
    onModelReady: (model) {
    },
    disposeViewModel: false,
    builder: (context, model, child) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            height: 40.h,
            width: double.infinity,
            // width: 90.w,
            decoration: BoxDecoration(
                color: ColorUtils.white,
                boxShadow: [
                  BoxShadow(
                    color: ColorUtils.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 9,
                    offset: Offset(0,4), // changes position of shadow
                  ),
                ],
                borderRadius:
                BorderRadius.circular(10)),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 5.w,),
                  child:
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        Container(
                          color: Colors.white,
                          margin: EdgeInsets.only(top: 2.h),
                          child: Text("Username",
                            style: TextStyle(
                              color: ColorUtils.gradientcolor2,
                              fontSize: 1.8.t,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          height: 4.h,
                          child: TextFormField(
                            controller: widget.field1,
                            style: CustomTheme.placeholder,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Muhammad123",
                                hintStyle: TextStyle(
                                    fontSize: 1.8.t,color: ColorUtils.black
                                )
                              // CustomTheme.placeholder,
                            ),
                          ),
                        ),
                      ] ),
                ),
                // SizedBox(height: 1.h),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                      horizontal: 5.w),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 5.w,),
                  child:
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        Container(
                          color: Colors.white,
                          margin: EdgeInsets.only(top: 2.h),
                          child: Text("First Name",
                            style: TextStyle(
                              color: ColorUtils.gradientcolor2,
                              fontSize: 1.8.t,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          height: 4.h,
                          child: TextFormField(
                            controller: widget.field2,
                            style: CustomTheme.placeholder,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Muhammad",
                                hintStyle: TextStyle(
                                    fontSize: 1.8.t,color: ColorUtils.black
                                )
                              // CustomTheme.placeholder,
                            ),
                          ),
                        ),
                      ] ),
                ),

                // Container(
                //   margin: EdgeInsets.only(
                //       left: 5.w, top: 0.h),
                //   child: TextFormField(
                //     style: CustomTheme.placeholder,
                //     controller: widget.field2,
                //     decoration: InputDecoration(
                //       border: InputBorder.none,
                //       hintStyle:
                //       CustomTheme.placeholder,
                //     ),
                //   ),
                // ),

                // SizedBox(height: 1.h),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                      horizontal: 5.w),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 5.w,),
                  child:
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        Container(
                          color: Colors.white,
                          margin: EdgeInsets.only(top: 2.h),
                          child: Text("Family Name",
                            style: TextStyle(
                              color: ColorUtils.gradientcolor2,
                              fontSize: 1.8.t,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          height: 4.h,
                          child: TextFormField(
                            controller: widget.field3,
                            style: CustomTheme.placeholder,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Anamoudi",
                                hintStyle: TextStyle(
                                    fontSize: 1.8.t,color: ColorUtils.black
                                )
                              // CustomTheme.placeholder,
                            ),
                          ),
                        ),
                      ] ),
                ),


                // Container(
                //   margin: EdgeInsets.only(
                //       left: 5.w, top: 0.h),
                //   child: TextFormField(
                //     style: CustomTheme.placeholder,
                //     controller: widget.field2,
                //     decoration: InputDecoration(
                //       border: InputBorder.none,
                //       hintStyle:
                //       CustomTheme.placeholder,
                //     ),
                //   ),
                // ),

                // SizedBox(height: 1.h),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                      horizontal: 5.w),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    model.openAndSelectDob(context);
                    context.unFocus();
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 5.w,),
                    child:
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children:[
                          Container(
                            color: Colors.white,
                            margin: EdgeInsets.only(top: 2.h),
                            child: Row( mainAxisAlignment: MainAxisAlignment.start,
                              children:[Text("Date OF Birth",
                                style: TextStyle(
                                  color: ColorUtils.gradientcolor2,
                                  fontSize: 1.8.t,
                                ),
                              ),
                            ]),
                          ),
                          Container(
                            color: Colors.white,
                            height: 4.h,
                             child:
                            Row(
                              children:[ Text(
                                model.editProfileSelectedDOB == null
                                    ? "22-01-1993"
                                    : DateFormat(
                                    'dd-MM-yyyy')
                                    .format(model
                                    .editProfileSelectedDOB),
                                style: model.editProfileSelectedDOB == null
                                    ? TextStyle(
                                  color: ColorUtils.black,
                                  fontFamily: FontUtils.PoppinsRegular,
                                  fontSize: 1.8.t,
                                )
                                    : TextStyle(
                                  color: ColorUtils.black,
                                  fontFamily: FontUtils.PoppinsRegular,
                                  fontSize: 1.8.t,
                                ),
                              ),
                            ]),
                            // TextFormField(
                            //   controller: widget.field4,
                            //   style: CustomTheme.placeholder,
                            //   decoration: InputDecoration(
                            //       border: InputBorder.none,
                            //       hintText: "22-01-1993",
                            //       hintStyle: TextStyle(
                            //         fontSize: 1.8.t,color: ColorUtils.black
                            //       )
                            //     // CustomTheme.placeholder,
                            //   ),
                            // ),
                          ),
                        ] ),
                  ),
                ),

                // Container(
                //   margin: EdgeInsets.only(
                //       left: 5.w, top: 0.h),
                //   child: TextFormField(
                //     style: CustomTheme.placeholder,
                //     controller: widget.field2,
                //     decoration: InputDecoration(
                //       border: InputBorder.none,
                //       hintStyle:
                //       CustomTheme.placeholder,
                //     ),
                //   ),
                // ),
              ],
            ),
          );
    }
    );}
}
