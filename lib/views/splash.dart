import 'package:deals_app/views/favourite/favourites.dart';
import 'package:deals_app/views/about_us.dart';
import 'package:deals_app/views/contact_us.dart';
import 'package:deals_app/views/edit_profile.dart';
import 'package:deals_app/views/forgetpass.dart';
import 'package:deals_app/views/language.dart';
import 'package:deals_app/views/location.dart';
import 'package:deals_app/views/login.dart';
import 'package:deals_app/views/onboarding.dart';
import 'package:deals_app/views/register.dart';
import 'package:deals_app/views/reviews.dart';
import 'package:deals_app/views/search.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/settings.dart';
import 'package:deals_app/views/terms_policies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:phlox_animations/phlox_animations.dart';
import '../app/locator.dart';


  MainViewModel mainViewModel = locator<MainViewModel>();
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  void _animate() {
    Future.delayed(Duration(seconds: 6), () {
      setState(() {
        mainViewModel.navigationService.navigateToUntil(to: Onboarding());
        // _animationController.forward();

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        _animationController =
            AnimationController(vsync: this, duration: Duration(seconds: 3));
        _animation =
            Tween<double>(begin: 0, end: 1).animate(_animationController);
        _animationController.forward();
        _animate();
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
                        resizeToAvoidBottomInset: false,
                        backgroundColor: ColorUtils.black,
                        body: Stack(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Expanded(
                                        child: ScaleTransition(
                                      scale: _animation,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                            color: ColorUtils.black,
                                            width: 1.5,
                                          )),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          child: Image.asset(
                                            ImageUtils.imagesplash1,
                                            fit: BoxFit.cover,
                                          )),
                                    )),
                                    Expanded(
                                        child: ScaleTransition(
                                      scale: _animation,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                            color: ColorUtils.black,
                                            width: 1.5,
                                          )),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          child: Image.asset(
                                            ImageUtils.imagesplash3,
                                            fit: BoxFit.fill,
                                          )),
                                    )),
                                    Expanded(
                                        child: ScaleTransition(
                                      scale: _animation,
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: ColorUtils.black,
                                              width: 1.5,
                                            ),
                                          ),
                                          child: Image.asset(
                                            ImageUtils.imagesplash4,
                                            fit: BoxFit.cover,
                                          )),
                                    )),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Expanded(
                                        child: ScaleTransition(
                                      scale: _animation,
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                            color: ColorUtils.black,
                                            width: 1.5,
                                          )),
                                          child: Image.asset(
                                            ImageUtils.imagesplash2,
                                            fit: BoxFit.cover,
                                          )),
                                    )),
                                    Expanded(
                                        child: ScaleTransition(
                                      scale: _animation,
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                            color: ColorUtils.black,
                                            width: 1.5,
                                          )),
                                          child: Image.asset(
                                            ImageUtils.imagesplash5,
                                            fit: BoxFit.cover,
                                          )),
                                    )),
                                  ],
                                )
                              ],
                            ),
                            Positioned(
                              top: 42.h,
                              left: 36.w,
                              child: ScaleTransition(
                                scale: _animation,
                                child: Container(
                                  height: 16.h,
                                  width: 29.w,
                                  color: ColorUtils.black,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(ImageUtils.loginIcon),
                                        Text(
                                          "DEALS",
                                          style: TextStyle(
                                              fontFamily:
                                                  FontUtils.playfairbold,
                                              fontSize: 3.2.t,
                                              color: ColorUtils.white),
                                        )
                                      ]),
                                ),
                              ),
                            )
                          ],
                        )))));
      },
    );
  }
}
