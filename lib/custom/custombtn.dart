import 'package:deals_app/views/location.dart';
import 'package:deals_app/views/onboarding.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../app/locator.dart';
import '../utils/color_utils.dart';
import '../utils/theme.dart';
import '../viewmodels/main_viewmodel.dart';
import '../viewmodels/navigation_viewmodel.dart';

class Custombtn extends StatelessWidget {
  String? text;
  Icon? icon;
  Custombtn({this.text});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => locator<MainViewModel>(),
        disposeViewModel: false,
        onModelReady: (model) {},
        builder: (context, model, child) {
          return Container(
              height: 7.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    ColorUtils.gradientcolor1,
                    ColorUtils.gradientcolor2,
                  ], stops: [
                    0.1,
                    0.6
                  ]),
                  borderRadius: BorderRadius.circular(10)),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    model.navigationService.navigateTo(to: LocationScreen());
                  },
                  child: Row(
                    children: [
                      // SvgPicture.asset(),
                      Text(
                        "${text}",
                        style: CustomTheme.buttontext,
                      ),
                    ],
                  )));
        });
  }
}
