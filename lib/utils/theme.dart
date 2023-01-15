import 'package:deals_app/utils/extensions.dart';
import "package:flutter/material.dart";
import 'color_utils.dart';
import 'font_utils.dart';

class CustomTheme {
    static final heading = TextStyle(
      fontSize: 5.t,
      fontFamily: FontUtils.playfairbold,
      color: ColorUtils.black,
    );
  static final semiheading = TextStyle(
    fontSize: 2.t,
    fontFamily: FontUtils.PoppinsRegular,
    color: ColorUtils.grey,
  );
  static final placeholder = TextStyle(
    fontSize: 1.8.t,
    fontFamily: FontUtils.PoppinsRegular,
    color: ColorUtils.black,
  );
  static final smallfont = TextStyle(
    fontSize: 1.5.t,
    fontFamily: FontUtils.PoppinsMedium,
    color: ColorUtils.grey.withOpacity(0.5),
  );
  static final mediumtext = TextStyle(
    fontSize: 1.8.t,
    fontFamily: FontUtils.PoppinsMedium,
    color: ColorUtils.black,
  );
  static final logoheading = TextStyle(
    fontSize: 1.8.t,
    fontFamily: FontUtils.PoppinsMedium,
    color: ColorUtils.white,
  );
  static final buttontext = TextStyle(
    fontSize: 2.t,
    fontFamily: FontUtils.PoppinsMedium,
    color: ColorUtils.white,
  );
  static final italicheading = TextStyle(
    fontSize: 1.6.t,
    fontFamily: FontUtils.Poppinsitalic,
    color: ColorUtils.grey,
  );
  static final onboardheading = TextStyle(
    fontSize: 3.t,
    fontFamily: FontUtils.PoppinsSemibold,
    color: ColorUtils.black,
  );
  static final onoboardtext = TextStyle(
    fontSize: 2.t,
    fontFamily: FontUtils.PoppinsRegular,
    color: ColorUtils.black,
  );

  static final searchtextfeild = TextStyle(
    fontSize: 2.t,
    fontFamily: FontUtils.PoppinsMedium,
    color: ColorUtils.searchColor,
  );
  static final locationfeild = TextStyle(
    fontSize: 2.t,
    fontFamily: FontUtils.PoppinsMedium,
    color: ColorUtils.grey,
  );
  static final homepageheading = TextStyle(
    fontSize: 3.5.t,
    fontFamily: FontUtils.playfairbold,
    color: ColorUtils.white,
  );
  static final bottomSheetTextStyle = TextStyle(
    fontSize: 2.1.t,
    fontFamily: FontUtils.PoppinsMedium,
    color: ColorUtils.black,
  );
}
