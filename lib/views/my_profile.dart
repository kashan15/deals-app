import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/settings.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
                FocusScope.of(context).unfocus();
              },
              child: Scaffold(
                backgroundColor: ColorUtils.white,
                body: Stack(
                  children: <Widget>[
                    Container(
                      height: 25.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            ColorUtils.gradientcolor1,
                            ColorUtils.gradientcolor2,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          stops: [0.1, 0.6],
                        ),
                      ),
                      child: Container(
                        margin:
                            EdgeInsets.only(left: 4.w, right: 4.w, top: 3.8.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 3.h),
                              child: Column(
                                children: [
                                  Image.asset(
                                    ImageUtils.profileImage,
                                    height: 22.i,
                                    width: 22.i,
                                  ),
                                  TextWidget(
                                    textTitle: Constants.userName,
                                    textAlign: TextAlign.center,
                                    color: ColorUtils.white,
                                    fontSize: 2.t,
                                    fontFamily: FontUtils.PoppinsSemibold,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 6.3.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextWidget(
                                    textTitle: Constants.num1,
                                    fontSize: 2.8.t,
                                    fontFamily: FontUtils.PoppinsSemibold,
                                    color: ColorUtils.white,
                                  ),
                                  TextWidget(
                                    textTitle: Constants.redemptions,
                                    fontSize: 1.3.t,
                                    fontFamily: FontUtils.PoppinsRegular,
                                    color: ColorUtils.white,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 6.3.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextWidget(
                                    textTitle: Constants.num2,
                                    fontSize: 2.8.t,
                                    fontFamily: FontUtils.PoppinsSemibold,
                                    color: ColorUtils.white,
                                  ),
                                  TextWidget(
                                    textTitle: Constants.checkIn,
                                    fontSize: 1.3.t,
                                    fontFamily: FontUtils.PoppinsRegular,
                                    color: ColorUtils.white,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 2.8.h),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 5.w),
                                    child: IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          model.navigationService.navigateTo(to: Settings());
                                        },
                                        icon: Icon(
                                          Icons.settings,
                                          color: ColorUtils.white,
                                        )),
                                  ),
                                  TextWidget(
                                    textTitle: Constants.num3,
                                    fontSize: 2.8.t,
                                    fontFamily: FontUtils.PoppinsSemibold,
                                    color: ColorUtils.white,
                                  ),
                                  TextWidget(
                                    textTitle: Constants.offersSaved,
                                    fontSize: 1.3.t,
                                    fontFamily: FontUtils.PoppinsRegular,
                                    color: ColorUtils.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(50))),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 22.h),
                      child: Card(
                        margin: EdgeInsets.zero,
                        borderOnForeground: false,
                        color: ColorUtils.white,
                        shadowColor: ColorUtils.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: ColorUtils.white, width: 1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              TextWidget(
                                textTitle: Constants.favouriteLocation,
                                color: ColorUtils.textColor,
                                fontFamily: FontUtils.PoppinsSemibold,
                                fontSize: 2.5.t,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              GridView.builder(
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:  model.favLocation.length,
                                itemBuilder: (context, index) => Image.asset(
                                  model.favLocation[index]['images'],
                                  height: 10.h,
                                  width: 20.w,
                                  fit: BoxFit.cover,
                                ),
                                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 160.0,
                                  mainAxisSpacing: 0.0,
                                  crossAxisSpacing: 0.0,
                                  childAspectRatio: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        elevation: 0.0,
                        clipBehavior: Clip.antiAlias,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

