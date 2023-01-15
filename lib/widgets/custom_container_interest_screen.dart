import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:stacked/stacked.dart';

class CustomContainerInterestScreen extends StatefulWidget {
  CustomContainerInterestScreen({Key? key, required this.index})
      : super(key: key);
  dynamic index;
  @override
  _CustomContainerInterestScreenState createState() =>
      _CustomContainerInterestScreenState();
}

class _CustomContainerInterestScreenState
    extends State<CustomContainerInterestScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image:
                        AssetImage(model.interestScreen[widget.index]["image"]),
                    fit: BoxFit.fill),
              ),
            ),

            /// TODO
            // Positioned(
            //   top: 0.h,
            //   bottom: 18.h,
            //   right: 0,
            //   left: 0,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: ColorUtils.black.withOpacity(0.2),
            //     ),
            //   ),
            // ),
            // Positioned(
            //   top: 3.h,
            //   bottom: 15.h,
            //   right: 0,
            //   left: 36.w,
            //   child: GestureDetector(
            //     onTap: () {
            //       model.interestScreen[widget.index]["isChecked"] =
            //           !model.interestScreen[widget.index]["isChecked"];
            //       model.notifyListeners();
            //     },
            //     child: Container(
            //       decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           gradient: LinearGradient(
            //               colors: model.interestScreen[widget.index]
            //                       ["isChecked"]
            //                   ? [
            //                       ColorUtils.gradientcolor1,
            //                       ColorUtils.gradientcolor2,
            //                     ]
            //                   : [
            //                       ColorUtils.white,
            //                       ColorUtils.white,
            //                     ],
            //               begin: Alignment.topLeft,
            //               end: Alignment.bottomLeft),
            //           border: Border.all(
            //               color: model.interestScreen[widget.index]["isChecked"]
            //                   ? Colors.transparent
            //                   : ColorUtils.black)),
            //       child: model.interestScreen[widget.index]["isChecked"]
            //           ? SvgPicture.asset(
            //               ImageUtils.tickRound,
            //               color: ColorUtils.black,
            //             )
            //           : Container(),
            //     ),
            //   ),
            // ),
            //Checkbox(value: null, onChanged: (bool) {}),
          ],
        );
      },
    );
  }
}
