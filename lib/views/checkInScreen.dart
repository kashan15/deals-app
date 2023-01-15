import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/widgets/custom_container_checkins.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({Key? key}) : super(key: key);

  @override
  _CheckInScreenState createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
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
                                    textTitle: Constants.muCheckIn,
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
                              Expanded(
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 2.h,),
                                      ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: model.checkIns.length,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                              onTap: () {},
                                              child: CustomContainerCheckIns(
                                                icon: model.checkIns[index]
                                                    ["icon"],
                                                image: model.checkIns[index]
                                                    ["image"],
                                                title: model.checkIns[index]
                                                    ["imageName"],
                                                smallText: model.checkIns[index]
                                                    ["smallText"],
                                                description:
                                                    model.checkIns[index]
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
