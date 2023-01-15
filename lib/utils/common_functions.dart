import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/screen_utils.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/widgets/booking_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonFunctions{

  static Future   showDateOfBirthPicker(BuildContext context,DateTime initialDate) {
    String? openingTimeFrom;
    DateTime selectedDateTime;
    initialDate = initialDate==null? DateTime.now() : initialDate;
    DateTime maxDateTime = DateTime.now();
    selectedDateTime = maxDateTime;
    return  showModalBottomSheet(context: context, builder: (context){
      return Container(
        height: ScreenUtil.getInstance().height*.35,decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(4.i),topLeft: Radius.circular(4.i))
      ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // MaterialButton(
                  //   color: ColorUtils.blue,
                  //   onPressed: (){
                  //     Navigator.pop(context,selectedDateTime);
                  //   },
                  //   child: Text(
                  //     "Cancel",
                  //     style:
                  //     TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 1.9.t),
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context,selectedDateTime);
                    },
                    child: Container(
                      height: 4.7.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                ColorUtils.gradientcolor1,
                                ColorUtils.gradientcolor2,
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              stops: [0.1, 0.6]),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                        child: Text(
                          "Cancel",style:
                        TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 1.9.t),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                       Navigator.pop(context,selectedDateTime);


                    },

                    // onTap: (){
                    //   showTimePicker(
                    //       context: context,
                    //       initialTime: TimeOfDay.now(),
                    //       initialEntryMode: TimePickerEntryMode.dial,
                    //       confirmText: "CONFIRM",
                    //       cancelText: "NOT NOW",
                    //       helpText: "BOOKING TIME"
                    //   ).then((value){
                    //     openingTimeFrom = value!.format(context);
                    //     // model.notifyListeners();
                    //   });
                    // },
                    child: Container(
                      height: 4.7.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                ColorUtils.gradientcolor1,
                                ColorUtils.gradientcolor2,
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              stops: [0.1, 0.6]),
                          borderRadius: BorderRadius.circular(5)
                          ),
                      child: Center(
                        child: Text(
                              "Done",style:
                            TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 1.9.t),
                            ),
                      ),
                    ),
                  ),
                  // MaterialButton(
                  //   color: ColorUtils.blue,
                  //
                  //   //padding: EdgeInsets.zero,
                  //   onPressed: (){
                  //     Navigator.pop(context,selectedDateTime);
                  //   },
                  //   child: Text(
                  //     "Done",style:
                  //   TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 1.9.t),
                  //   ),
                  // ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: CupertinoTheme(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    maximumDate:  maxDateTime,
                    minimumDate: DateTime.now().subtract(Duration(days: 365*100)),
                    initialDateTime: initialDate,
                    onDateTimeChanged: (DateTime dateTime) {
                      selectedDateTime = dateTime;
                    },
                  ),
                  data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(color: ColorUtils.gradientcolor2,fontWeight: FontWeight.w400,fontSize: 1.9.t),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },isDismissible: false);
  }
}