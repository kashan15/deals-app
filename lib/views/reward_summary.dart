import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/widgets/custom_container_checkins.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RewardSummary extends StatefulWidget {
  const RewardSummary({Key? key}) : super(key: key);

  @override
  _RewardSummaryState createState() => _RewardSummaryState();
}

class _RewardSummaryState extends State<RewardSummary> {
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
                      height: 21.h,
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
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(50))),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 6.h),
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
                          child: Column(
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      model.navigationService.back();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: ColorUtils.textColor,
                                    ),
                                  ),
                                  TextWidget(
                                    textTitle: Constants.myRewards,
                                    color: ColorUtils.textColor,
                                    fontSize: 2.5.t,
                                    fontFamily: FontUtils.PoppinsSemibold,
                                  ),
                                  TextWidget(
                                    textTitle: Constants.editProfile,
                                    color: Colors.transparent,
                                    fontSize: 1.t,
                                    fontFamily: FontUtils.PoppinsSemibold,
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.5.h,),
                              Expanded(
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 14.h,
                                        width: double.infinity,
                                        margin: EdgeInsets.symmetric(
                                            vertical: 1.h, horizontal: 8.w),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1.h, horizontal: 2.w),
                                        decoration: BoxDecoration(
                                          color: ColorUtils.white,
                                          borderRadius:
                                              BorderRadius.circular(3.w),
                                          boxShadow: [
                                            BoxShadow(
                                                color: ColorUtils
                                                    .blackBorderShadow,
                                                spreadRadius: 2,
                                                blurRadius: 6,
                                                offset: Offset(2, 4))
                                          ],
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              // margin: EdgeInsets.symmetric(
                                              //     horizontal: 2.w),
                                              height: 9.h,
                                              width: 23.w,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      ImageUtils
                                                          .rewardsScreenImage1,
                                                    ),
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3.w)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Total Rewards",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 1.9.t,
                                                          fontFamily: FontUtils
                                                              .PoppinsMedium,
                                                          color:
                                                              ColorUtils.grey),
                                                    ),
                                                    Text(
                                                      "500 points",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 2.9.t,
                                                          fontFamily: FontUtils
                                                              .PoppinsSemibold,
                                                          color:
                                                              ColorUtils.black),
                                                    ),
                                                    Text(
                                                      "133 AED",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 2.t,
                                                          fontFamily: FontUtils
                                                              .PoppinsMedium,
                                                          color: ColorUtils
                                                              .gradientcolor2),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 0.1.h,
                                      // ),
                                      SizedBox(height: 2.h,),
                                      ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: model.rewardsList.length,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                              onTap: () {},
                                              child: CustomContainerCheckIns(
                                                icon: model.rewardsList[index]
                                                    ["icon"],
                                                image: model.rewardsList[index]
                                                    ["image"],
                                                title: model.rewardsList[index]
                                                    ["imageName"],
                                                smallText:
                                                    model.rewardsList[index]
                                                        ["smallText"],
                                                description:
                                                    model.rewardsList[index]
                                                        ["description"],
                                              ));
                                        },
                                      ),
                                    ],
                                  ),
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
