import 'dart:ui';

import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:flutter/material.dart';


class ContainerTextFieldFive extends StatefulWidget {

  ContainerTextFieldFive({key: Key,});

  @override
  State<ContainerTextFieldFive> createState() => _ContainerTextFieldFiveState();
}

class _ContainerTextFieldFiveState extends State<ContainerTextFieldFive> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      height: 8.h,
      // width: double.infinity,
      width: 90.w,
      decoration: BoxDecoration(
          color: ColorUtils.white,
          boxShadow: [
            BoxShadow(
              color: ColorUtils.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 9,
              offset: Offset(0, 4), // changes position of shadow
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
              Container(
              color: Colors.white,
                margin: EdgeInsets.only(top: 1.h),
                child: Text("My Interest",
                  style: TextStyle(
                    color: ColorUtils.gradientcolor2,
                    fontSize: 1.8.t,
                  ),
                ),
              ),
                Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: IconButton(
                    onPressed: () {

                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: ColorUtils.grey,
                    ),
                  ),
                ),
            ]),
            // Container(
            //   color: Colors.white,
            //   height: 4.h,
            //   child: TextFormField(
            //     controller: widget.field1,
            //     style: CustomTheme.placeholder,
            //     decoration: InputDecoration(
            //         border: InputBorder.none,
            //         hintText: "+971 50 1234 567",
            //         hintStyle: TextStyle(
            //             fontSize: 1.8.t,color: ColorUtils.black
            //         )
            //       // CustomTheme.placeholder,
            //     ),
            //   ),
            // ),
          ]),
    ), // SizedBox(height: 1.h),


    ]
    ,
    )
    ,
    );
  }
}
