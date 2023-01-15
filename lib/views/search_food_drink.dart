import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/favourite/resturant_list.dart';
import 'package:deals_app/views/resturant_detail.dart';
import 'package:deals_app/widgets/resturant_widget.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SearchFood extends StatefulWidget {
  const SearchFood({Key? key}) : super(key: key);

  @override
  State<SearchFood> createState() => _SearchFoodState();
}

class _SearchFoodState extends State<SearchFood> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
      },
      builder: (context, model, child) {

        return
          SafeArea(
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
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 2.h,),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            Image.asset(ImageUtils.profileImage,
                                              height: 6.h,
                                            ),
                                            Container(
                                              height: 5.h,
                                              width: 75.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  color: ColorUtils.grey.withOpacity(0.1)),
                                              child: Container(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                        margin: EdgeInsets.symmetric(
                                                            horizontal: 4.w),
                                                        child: Icon(
                                                          Icons.search,
                                                          color: ColorUtils.searchColor,
                                                        )),
                                                    Expanded(
                                                      child: TextField(
                                                        style: CustomTheme
                                                            .searchtextfeild,
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          hintText: "Search here...",
                                                          hintStyle: CustomTheme
                                                              .searchtextfeild,
                                                        ),
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 2.h,),
                                        Container(
                                          height: 5.h,
                                          width: double.infinity,
                                          child: ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              itemCount: model.tabbar.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        model.select = index;
                                                        model.notifyListeners();
                                                      },
                                                      child: Container(
                                                          padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 3.w),
                                                          height: 5.h,
// margin: EdgeInsets.only(
//     left: 5.w),
                                                          decoration: BoxDecoration(

                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(20)),
                                                          child: Center(
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                    model.tabbar[index]
                                                                    ["tab"],
                                                                    style: TextStyle(
                                                                      fontSize: 2.t,
                                                                      fontFamily: FontUtils
                                                                          .PoppinsMedium,
                                                                      color:
                                                                      ColorUtils
                                                                          .black,
                                                                    )),
                                                                model.select == index?   Container(
                                                                  height: 0.3.h,
                                                                  width: 5.w,
                                                                  color: ColorUtils.gradientColor,
                                                                ):Container(height: 0.0,width: 0.0,),
                                                              ],
                                                            ),
                                                          )),
                                                    ),
// SizedBox(width: 2.w,)
                                                  ],
                                                );
                                              }),
                                        ),
                                        SizedBox(height: 2.h,),




                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 39.h,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: 3,
                                                  itemBuilder: (context, index) {
                                                    return ResturantWidget(image: ImageUtils.slider);
                                                  }),
                                            ),
                                            SizedBox(height: 2.h,),
                                            TextWidget(
                                              textTitle: Constants.result,
                                              color: ColorUtils.textColor,
                                              fontSize: 2.t,
                                              fontFamily: FontUtils.PoppinsSemibold,
                                            ),
                                            ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: model.favourite.length,
                                                physics: NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemBuilder: (context,index){
                                                  return  GestureDetector(
                                                    onTap: (){

                                                    },
                                                    child: ResturantList(
                                                      onTap: (){

                                                      },
                                                      title:model.favourite[index]['title'],
                                                      image: model.favourite[index]['image'],
                                                    ),
                                                  );
                                                }),
                                          ],
                                        ),



                                      ],
                                    ),
                                  ),
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
