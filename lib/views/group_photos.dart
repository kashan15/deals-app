import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/views/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:stacked/stacked.dart';

class AllGroupPhotos extends StatefulWidget {
  const AllGroupPhotos({Key? key}) : super(key: key);

  @override
  _AllGroupPhotosState createState() => _AllGroupPhotosState();
}

class _AllGroupPhotosState extends State<AllGroupPhotos> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => locator<MainViewModel>(),
    disposeViewModel: false,
    onModelReady: (model) {
    },
    builder: (context, model, child) {
          return SafeArea(
              top: true,
              bottom: false,
              child: WillPopScope(
              onWillPop: () async {
            return true;
          },
            child: Container(
              child: GridView.builder(
                // padding: EdgeInsets.all(10),
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  // physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: model.UserImagesOne.length,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.75,
                    crossAxisCount: 3,
                    // mainAxisSpacing: 1.9*SizeConfig.widthMultiplier,
                    // //childAspectRatio: 1,
                    // crossAxisSpacing: 1*SizeConfig.widthMultiplier
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, PageTransition(child: ViewZoomedImageTwo(index: index,), type: PageTransitionType.fade));
                        model.notifyListeners();
                        // Navigator.push(context, MaterialPageRoute(builder: (context) =>  ViewZoomedImage(index: index,),)

                      },
                      child: Container(
                        color: ColorUtils.redColorExpiresIn,
                        child: Image.asset(
                          model.UserImagesOne[index]['image'],
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  }),
            ),
          ));
    }
    );
  }
}
class ViewZoomedImageTwo extends StatefulWidget {
  final int? index;
  const ViewZoomedImageTwo({Key? key,this.index}):super(key:key);
  @override
  _ViewZoomedImageTwoState createState() => _ViewZoomedImageTwoState();
}

class _ViewZoomedImageTwoState extends State<ViewZoomedImageTwo> {
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    model.navigationService.back();
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 1.7.w, top: 3.h),
                    padding: EdgeInsets.all(13),
                    //height: 10.h,
                    decoration: BoxDecoration(
                      color: ColorUtils.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child:
                    // Icon(Icons.arrow_back_ios,
                    //   size: 5.i,
                    //   color: ColorUtils.grey,
                    // ),
                    // // SvgPicture.asset(ImageUtils.backArrow),
                    // height: 10.i,

                    Image.asset(ImageUtils.iconBack,
                      height: 5.i,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      child: PhotoViewGallery.builder(
                        itemCount: model.UserImagesOne.length,
                        pageController: pageController,
                        builder: (context, index) {
                          return  PhotoViewGalleryPageOptions(
                            imageProvider: AssetImage(model.UserImagesOne[index]['image']),
                            initialScale: PhotoViewComputedScale.contained * 1,
                            //heroAttributes: PhotoViewHeroAttributes(tag: galleryItems[index].id),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => locator<MainViewModel>(),
      onModelReady: (model){
        Future.delayed(Duration(milliseconds: 100)).then((value)async{
          pageController.jumpToPage(widget.index!);
        });
      },
      disposeViewModel: false,
    );
  }
}
