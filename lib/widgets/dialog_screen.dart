import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/views/search_restaurant_details.dart';
import 'package:deals_app/views/votings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/color_utils.dart';
import '../utils/dimensions.dart';
import '../utils/font_utils.dart';

class DialogScreen extends StatefulWidget {

  String title;
  String btnTxt;
  String icon;

  DialogScreen({Key? key, required this.title, required this.btnTxt, required this.icon}) : super(key: key);

  @override
  _DialogScreenState createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      backgroundColor: Colors.white,
      child: WillPopScope(
        onWillPop: () async {
          return true;
        },
    child: GestureDetector(
    onTap: () {
    // FocusScope.of(context).unfocus();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VotingsScreen()),
      );
    },
        child: Stack(
          children:[
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.horizontalPadding,
                  vertical: Dimensions.verticalPadding
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(height: 1.h),

                  Container(
                    color: Colors.white,
                    child: Image.asset(ImageUtils.popupImage,

                    ),
                  ),

                  // Positioned(
                  //   top: 3.h,
                  //   left: 5.w,
                  //   child: CircleAvatar(
                  //     radius: 5,
                  //   ),
                  // ),
                  // SizedBox(height: 3.h),

                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Voted Successfully!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorUtils.black,
                        fontFamily: FontUtils.PoppinsSemibold,
                        fontSize: 2.5.t,
                      ),
                    ),
                  ),

                  SizedBox(height: 1.h),

                  //Not Possible To Choose
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Thank you for your vote",

                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorUtils.grey,
                        fontFamily: FontUtils.PoppinsMedium,
                        fontSize: 1.8.t,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),

                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children:[
                  //       ElevatedButton(
                  //         onPressed: ()  {
                  //           Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //               builder: (BuildContext context) => SearchDetails()));
                  //         },
                  //         child: const Text(
                  //             "Back to Login"
                  //         ),
                  //         style: ElevatedButton.styleFrom(
                  //           primary: ColorUtils.blue,
                  //           onPrimary: ColorUtils.white,
                  //           elevation: 1,
                  //           shape: StadiumBorder(),
                  //           minimumSize: Size(60.w, 6.h),
                  //           textStyle: TextStyle(
                  //             color: ColorUtils.white,
                  //             fontFamily: FontUtils.PoppinsMedium,
                  //             // fontWeight: FontWeight.bold,
                  //             fontSize: 1.8.t,
                  //             //height: 0
                  //           ),
                  //         ),
                  //       ),
                  //     ] ),
                ],
              ),
          ),
    ],
         ),
      ),
    ));



  }
}


