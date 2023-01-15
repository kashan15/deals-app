import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../viewmodels/main_viewmodel.dart';

class CustomContainerCheckIns extends StatefulWidget {
  CustomContainerCheckIns({
    Key? key,
    required this.icon,
    required this.image,
    required this.title,
    required this.smallText,
    required this.description,
  }) : super(key: key);
  dynamic icon;
  String image;
  dynamic title;
  dynamic smallText;
  dynamic description;
  @override
  _CustomContainerCheckInsState createState() =>
      _CustomContainerCheckInsState();
}

class _CustomContainerCheckInsState extends State<CustomContainerCheckIns> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return Container(
          height: 11.h,
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
          decoration: BoxDecoration(
              color: ColorUtils.white,
              borderRadius: BorderRadius.circular(3.w),
              boxShadow: [
                BoxShadow(
                    color: ColorUtils.blackBorderShadow,
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: Offset(2, 4))
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // height: 7.h,
                height: 10.5.h,
                width: 18.w,
                padding: EdgeInsets.all(0.8.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    ColorUtils.gradientcolor1,
                    ColorUtils.gradientcolor2,
                  ], stops: [
                    0.1,
                    0.6
                  ]),
                  shape: BoxShape.circle,
                ),
                child:

                // CircleAvatar(
                //   backgroundColor: ColorUtils.white,
                //   maxRadius: 12.w,
                //   child: Padding(
                //     padding: EdgeInsets.all(2),
                //     child: CircleAvatar(
                //       maxRadius: 10.5.w,
                //       backgroundColor: ColorUtils.black,
                //       backgroundImage: AssetImage(
                //         widget.image,
                //       ),
                //     ),
                //   ),
                // ),

                CircleAvatar(
                  backgroundColor: ColorUtils.white,
                  child: CircleAvatar(
                    backgroundColor: ColorUtils.white,
                    radius: 30,
                    backgroundImage:
                    // AssetImage(ImageUtils.slider),
                    AssetImage(widget.image),
                  ),
                ),
              ),
              SizedBox(width: 2.5.w,),
              Expanded(
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(3.w)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 1.h,),
                      Text(
                        widget.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 2.t,
                            fontFamily: FontUtils.PoppinsSemibold,
                            color: ColorUtils.black),
                      ),SizedBox(height: 0.7.h,),
                      Text(
                        widget.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 1.6.t,
                            fontFamily: FontUtils.PoppinsRegular,
                            color: ColorUtils.grey),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      widget.icon,
                      height: 7.i,
                      width: 7.i,
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      widget.smallText,
                      style: TextStyle(fontSize: 1.t),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
            ],
          ),
        );
      },
    );
  }
}
