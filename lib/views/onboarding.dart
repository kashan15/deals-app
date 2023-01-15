import 'package:deals_app/custom/custombtn.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/location.dart';
import 'package:deals_app/views/login.dart';
import 'package:deals_app/views/main_views/main_views.dart';
import 'package:deals_app/widgets/button_gradient.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import '../app/locator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return SafeArea(
            top: false,
            bottom: false,
            child: WillPopScope(
                onWillPop: () async {
                  SystemNavigator.pop();
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 6.h),
                                  height: 50.h,
                                  child: PageView.builder(

                                      controller: PageController(
                                        initialPage: 1,
                                          viewportFraction: 0.2.w),
                                      itemCount: model.Onboarding_images.length,
                                      itemBuilder: (context, index) {

                                        return Container(
                                            width: 50.w,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 2.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Image.asset(
                                              model.Onboarding_images[index]
                                                  ["image"],
                                              fit: BoxFit.fill,
                                            ));
                                      })),
                            ),
                            Text(
                              "Standard Lorem Ipsum",
                              style: CustomTheme.onboardheading,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore aliqua.",
                              textAlign: TextAlign.center,
                              style: CustomTheme.onoboardtext,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            DotsIndicator(
                                dotsCount: model.Onboarding_images.length,
                            // position: model.Onboarding_images.i
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            ButtonGradient(
                              title: "Get Satrted",
                              onPressed: () {
                                model.navigationService.navigateToReplacement(
                                    to: Login());
                              },
                            )
                          ]),
                    )),
                  ),
                )));
      },
    );
  }
}
