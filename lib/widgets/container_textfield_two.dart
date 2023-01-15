import 'dart:ui';

import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:flutter/material.dart';


class ContainerTextFieldTwo extends StatefulWidget {
  dynamic field1;
  dynamic field2;
  dynamic field3;

  ContainerTextFieldTwo({this.field1,this.field2,this.field3});

  @override
  State<ContainerTextFieldTwo> createState() => _ContainerTextFieldTwoState();
}

class _ContainerTextFieldTwoState extends State<ContainerTextFieldTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      height: 30.h,
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
                    child: Text("Email Address",
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
                          hintText: "Muhammadanas@gmail.com",
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
                    child: Text("Password",
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
                          hintText: ".............",
                          hintStyle: TextStyle(
                            fontSize: 2.8.t,
                            color: ColorUtils.black
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
                    child: Text("Confirm Password",
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
                          hintText: ".............",
                          hintStyle: TextStyle(
                            fontSize: 2.8.t,color: ColorUtils.black
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
}