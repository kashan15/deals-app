import 'Package:flutter/material.dart';
import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/views/favourite/resturant_list.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/offers/offers_list.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../app/locator.dart';

class SavedOffers extends StatefulWidget {
  const SavedOffers({Key? key}) : super(key: key);

  @override
  _SavedOffersState createState() => _SavedOffersState();
}

class _SavedOffersState extends State<SavedOffers> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {

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

                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(50))),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 12.h),
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
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 2.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(onPressed: (){
                                      model.navigationService.back();
                                    }, icon: Icon(Icons.arrow_back,color: ColorUtils.textColor,),),
                                    TextWidget(
                                      textTitle: "Saved Offers",
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
                                SizedBox(height: 2.h,),
                                Container(
                                  margin: EdgeInsets.only(left: 22.w),
                                  height: 5.h,
                                  width: double.infinity,
                                  child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      itemCount: model.favoriteTabbar.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          // mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                // model.favoriteselect = index;
                                                // model.notifyListeners();
                                              },
                                              child: Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                                                  margin: EdgeInsets.only( left: 3.w),
                                                  height: 5.h,
                                                  // margin: EdgeInsets.only(
                                                  //     left: 5.w),
                                                  decoration:
                                                  BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            model.favoriteselect == index
                                                                ? ColorUtils.gradientcolor1
                                                                : ColorUtils.white,
                                                            model.favoriteselect == index
                                                                ? ColorUtils.gradientcolor2
                                                                : ColorUtils.white,
                                                          ],
                                                          begin: Alignment.bottomLeft,
                                                          end: Alignment.topRight,
                                                          stops: [0.1, 0.6]),
                                                      borderRadius: BorderRadius.circular(20),
                                                      border: Border.all(
                                                        color: model.favoriteselect == index
                                                            ? ColorUtils.white
                                                            : ColorUtils.grey2,
                                                      )
                                                  ),
                                                  child: Center(
                                                    child: Text(model.favoriteTabbar[index]["tab"],
                                                        style:
                                                        TextStyle(
                                                          fontSize: 2.t,
                                                          fontFamily: model.favoriteselect == index ?
                                                          FontUtils.PoppinsMedium
                                                              : FontUtils.PoppinsRegular,
                                                          color: model.favoriteselect == index
                                                              ? ColorUtils.white
                                                              : ColorUtils.grey,
                                                        )),
                                                  )),
                                            ),

                                            // SizedBox(width: 2.w,)
                                          ],
                                        );
                                      }),
                                ),
                                ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: model.favourite.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context,index){
                                      return  OffersList(
                                        title:model.favourite[index]['title'],
                                        image: model.favourite[index]['image'],
                                      );
                                    }),

                                SizedBox(height: 4.h,),
                              ],
                            ),
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


