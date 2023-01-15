import 'package:deals_app/views/home/home.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/main_views/main_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../app/locator.dart';

class Reviews extends StatefulWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
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
              return true;
            },
            child: GestureDetector(
              onTap: () {
                //FocusScope.of(context).unfocus();
              },
              child: Scaffold(
                backgroundColor: ColorUtils.white,
                body: GestureDetector(
                  onTap: () {
                    model.navigationService.navigateTo(to: MainViews(index: 0));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        ColorUtils.gradientcolor2,
                        ColorUtils.gradientcolor1,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.6, 1],
                    )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {
                              model.navigationService.navigateTo(to: Home());
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 4.w, vertical: 4.h),
                              height: 10.h,
                              width: 10.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorUtils.white),
                              child: SvgPicture.asset(
                                ImageUtils.x,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          child: Stack(
                            children: [
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                      child: Text(
                                    "Reveal the offer now!",
                                    style: TextStyle(
                                        fontSize: 3.2.t,
                                        fontFamily: FontUtils.PoppinsMedium,
                                        color: ColorUtils.white),
                                  )),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Center(
                                      child: Text(
                                          "Tap on the gift to Reveal the offer",
                                          style: TextStyle(
                                              fontSize: 2.4.t,
                                              fontFamily:
                                                  FontUtils.PoppinsRegular,
                                              color: ColorUtils.white))),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Container(
                                      alignment: Alignment.bottomCenter,
                                      child: Image.asset(
                                        ImageUtils.barcode,
                                        fit: BoxFit.cover,
                                      )),
                                ],
                              ),
                              Image.asset(
                                ImageUtils.review,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
