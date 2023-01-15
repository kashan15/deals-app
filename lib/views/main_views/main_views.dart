import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/utils/size_config.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/categories.dart';
import 'package:deals_app/views/home/home.dart';
import 'package:deals_app/views/hot_deals.dart';
import 'package:deals_app/views/location/location.dart';
import 'package:deals_app/views/main_views/my_curved_nav_bar.dart';
import 'package:deals_app/views/search.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


  MainViewModel mainViewModel = locator<MainViewModel>();

class MainViews extends StatefulWidget {
  int index;
  MainViews({Key? key, required this.index}) : super(key: key);

  @override
  State<MainViews> createState() => _MainViewsState();
}

class _MainViewsState extends State<MainViews> {
  int currentIndex = 0;
  Widget body = Home();

  @override
  void initState() {
    currentIndex = widget.index;
    onClick(currentIndex);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async{

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
              child:Scaffold(
                resizeToAvoidBottomInset: false,
                body: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: body,
                    ),
                    MyCurvedNavBar(
                      barIconColor: ColorUtils.grey,
                      selectedIconColor: ColorUtils.white,
                      color: ColorUtils.white,
                      buttonBackgroundColor: ColorUtils.gradientColor,
                      index: currentIndex,
                      animationCurve: Curves.ease,
                      animationDuration: Duration(milliseconds: 300),
                      height: SizeConfig.heightMultiplier * 8,
                      //backgroundColor: Colors.redAccent,
                      parentDecoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color(0xFFefefef),
                            blurRadius: 3 * SizeConfig.imageSizeMultiplier,
                            offset: Offset(0, -10))
                      ]),
                      items: <String>[
                        ImageUtils.home,
                        ImageUtils.categories,
                        ImageUtils.searchNormal,
                        ImageUtils.location,
                        ImageUtils.hotdeals,
                      ],
                      onTap: (index) {
                        currentIndex = index;
                        //MainView(index: 3,);
                        onClick(currentIndex);
                        setState(() {});
                      },
                    ),
                  ],
                ),

              ),
            ),
          ),
        );
      },
    );
  }
  onClick(int selectedIndex) {
    currentIndex = selectedIndex;
    switch (currentIndex) {
      case 0:
        body = Home();
        break;
      case 1:
        body = Categories();
        break;
      case 2:
        body = Search();
        break;
      case 3:
        body = Location();
        break;
      case 4:
        body = HotDeals();
        break;
    }
    setState(() {

    });
  }
}


