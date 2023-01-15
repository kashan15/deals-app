import 'dart:ui';

import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:flutter/material.dart';


class ContainerTextFieldFour extends StatefulWidget {
  dynamic field1;


  ContainerTextFieldFour({this.field1});

  @override
  State<ContainerTextFieldFour> createState() => _ContainerTextFieldFourState();
}

class _ContainerTextFieldFourState extends State<ContainerTextFieldFour> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      height: 10.h,
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
                    margin: EdgeInsets.only(top: 2.5.h),
                    child: Text("Phone Number",
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
                          hintText: "+971 50 1234 567",
                          hintStyle: TextStyle(
                              fontSize: 1.8.t,color: ColorUtils.black
                          )
                        // CustomTheme.placeholder,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ] ),
          ),
          // SizedBox(height: 1.h),


        ],
      ),
    );
  }
}
