import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonGradient extends StatelessWidget {
  dynamic title;
  void Function()? onPressed;
  ButtonGradient({required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
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
            title,
            style: CustomTheme.buttontext,
          ),
        ),
      ),
    );

    //   Container(
    //   height: 7.h,
    //   width: double.infinity,
    //   decoration: BoxDecoration(
    //       gradient: LinearGradient(colors: [
    //         ColorUtils.gradientcolor1,
    //         ColorUtils.gradientcolor2,
    //       ], stops: [
    //         0.1,
    //         0.6
    //       ]),
    //       borderRadius: BorderRadius.circular(10)),
    //   child: ElevatedButton(
    //     style: ButtonStyle(
    //       backgroundColor: MaterialStateProperty.all(
    //           Colors.transparent),
    //       shadowColor: MaterialStateProperty.all(
    //           Colors.transparent),
    //     ),
    //     onPressed: onPressed,
    //     child: Text(
    //       title,
    //       style: CustomTheme.buttontext,
    //     ),
    //   ),
    // );
  }
}

class ButtonGradientOne extends StatelessWidget {
  dynamic title;
  void Function()? onPressed;
  ButtonGradientOne({required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            SizedBox(width: 22.5.w,),
            SvgPicture.asset(ImageUtils.enableLocation),
            SizedBox(width: 5.w,),
            Text(
            title,
            style: CustomTheme.buttontext,
          ),
        ]),
      ),
    );

    //   Container(
    //   height: 7.h,
    //   width: double.infinity,
    //   decoration: BoxDecoration(
    //       gradient: LinearGradient(colors: [
    //         ColorUtils.gradientcolor1,
    //         ColorUtils.gradientcolor2,
    //       ], stops: [
    //         0.1,
    //         0.6
    //       ]),
    //       borderRadius: BorderRadius.circular(10)),
    //   child: ElevatedButton(
    //     style: ButtonStyle(
    //       backgroundColor: MaterialStateProperty.all(
    //           Colors.transparent),
    //       shadowColor: MaterialStateProperty.all(
    //           Colors.transparent),
    //     ),
    //     onPressed: onPressed,
    //     child: Text(
    //       title,
    //       style: CustomTheme.buttontext,
    //     ),
    //   ),
    // );
  }
}

class ButtonGradientTwo extends StatelessWidget {
  dynamic title;
  void Function()? onPressed;
  ButtonGradientTwo({required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
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
            title,
            style: CustomTheme.buttontext,
          ),
        ),
      ),
    );

    //   Container(
    //   height: 7.h,
    //   width: double.infinity,
    //   decoration: BoxDecoration(
    //       gradient: LinearGradient(colors: [
    //         ColorUtils.gradientcolor1,
    //         ColorUtils.gradientcolor2,
    //       ], stops: [
    //         0.1,
    //         0.6
    //       ]),
    //       borderRadius: BorderRadius.circular(10)),
    //   child: ElevatedButton(
    //     style: ButtonStyle(
    //       backgroundColor: MaterialStateProperty.all(
    //           Colors.transparent),
    //       shadowColor: MaterialStateProperty.all(
    //           Colors.transparent),
    //     ),
    //     onPressed: onPressed,
    //     child: Text(
    //       title,
    //       style: CustomTheme.buttontext,
    //     ),
    //   ),
    // );
  }
}
