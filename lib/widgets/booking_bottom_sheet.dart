
import 'package:counter/counter.dart';
import 'package:deals_app/app/locator.dart';
import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/widgets/button_gradient.dart';
import 'package:deals_app/widgets/container_textfield_one.dart';
import 'package:deals_app/widgets/rating_widget.dart';
import 'package:deals_app/widgets/rating_widget_one.dart';
import 'package:deals_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class BookingBottomSheet extends StatefulWidget {
  int index;
  BookingBottomSheet({Key? key, required this.index}) : super(key: key);

  @override
  _BookingBottomSheetState createState() => _BookingBottomSheetState();
}

class _BookingBottomSheetState extends State<BookingBottomSheet> {


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      onModelReady: (model) {
        model.counter = 0;
      },
      disposeViewModel: false,
      builder: (context, model, child) {
        return Container(
          color: ColorUtils.white,
          margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          height: 45.h,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: (){
                        model.navigationService.back();
                      },
                        child: Icon(Icons.arrow_back)),
                    SizedBox(width: 23.w,),
                    Text("Book a table",
                    style: TextStyle(
                      fontSize: 2.5.t,
                      fontFamily: FontUtils.PoppinsSemibold
                    ),
                    ),
                  ],
                ),



                SizedBox(height: 2.h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              height: 27.h,
              // width: double.infinity,
              width: 90.w,
              decoration: BoxDecoration(
                  color: ColorUtils.white,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: ColorUtils.grey.withOpacity(0.3),
                  //     spreadRadius: 2,
                  //     blurRadius: 9,
                  //     offset: Offset(0, 4), // changes position of shadow
                  //   ),
                  // ],
                  borderRadius:
                  BorderRadius.circular(10)),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 5.w,),
                    child:
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Container(
                                  color: Colors.white,
                                  margin: EdgeInsets.only(top: 3.h),
                                  child: Text("Number of person",
                                    style: TextStyle(
                                      color: ColorUtils.gradientcolor2,
                                      fontSize: 1.8.t,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 3.h, right: 4.w),
                                    child:
                                    Container(
                                      child:
                                      // Counter(
                                      //   configuration: DefaultConfiguration(
                                      //   ),
                                      //   min: 0,
                                      //   max: 100,
                                      //   bound: 1,
                                      //   step: 1,
                                      //   onValueChanged: print, ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            //minus decrease quantity
                                            onTap: model.minusCounter,
                                            //     () {
                                            //   model.ifSubtractQuantityPressed(
                                            //       widget.index, context);
                                            // },
                                            child: CircleAvatar(
                                              maxRadius: 1.8.h,
                                              backgroundColor:
                                              ColorUtils.white,
                                              child: CircleAvatar(
                                                maxRadius: 1.6.h,
                                                backgroundColor: ColorUtils.white,
                                                child:
                                                SvgPicture.asset(
                                                  ImageUtils.minusIcon,
                                                  height: 0.5.i,
                                                ),

                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(
                                            model.counter.toString(),
                                            // overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 2.t,
                                                fontFamily: FontUtils.PoppinsRegular),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          GestureDetector(
                                            //plus increase quantity
                                            onTap: model.plusCounter,
                                            child: CircleAvatar(
                                              maxRadius: 1.8.h,
                                              backgroundColor:
                                              ColorUtils.white,
                                              child: CircleAvatar(
                                                maxRadius: 1.6.h,
                                                backgroundColor: ColorUtils.white,
                                                child:
                                                SvgPicture.asset(
                                                  ImageUtils.plusIcon,
                                                  height: 2.5.i,
                                                ),

                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),
                                    // ),child: model.selectCount(context),
                                  // IconButton(
                                  //   onPressed: () {
                                  //
                                  //   },
                                  //   icon: Icon(
                                  //     Icons.arrow_forward,
                                  //     color: ColorUtils.grey,
                                  //   ),
                                  // ),

                                )]),
                          SizedBox(height: 1.h,),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 5.w),
                            child: Divider(
                              thickness: 2,
                            ),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:[
                                  Container(
                                    color: Colors.white,
                                    margin: EdgeInsets.only(top: 1.h),
                                    child: Text("Select Date",
                                      style: TextStyle(
                                        color: ColorUtils.gradientcolor2,
                                        fontSize: 1.8.t,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 1.5.h, right: 14.w),
                                    child: GestureDetector(
                                      onTap: (){
                                        // model.openAndSelectDob(context);
                                        // context.unFocus();
                                        // showTimePicker(
                                        //     context: context,
                                        //     initialTime: TimeOfDay.now(),
                                        //     initialEntryMode: TimePickerEntryMode.dial,
                                        //     confirmText: "CONFIRM",
                                        //     cancelText: "NOT NOW",
                                        //     helpText: "BOOKING TIME"
                                        // ).then((value){
                                        //   model.openingTimeFrom = value!.format(context);
                                        //   model.notifyListeners();
                                        // });
                                        model.selectDate(context);
                                        model.dateSelected = true;
                                        model.notifyListeners();
                                        context.unFocus();

                                      },
                                      child: Image.asset(ImageUtils.CalenderIcon,
                                      height: 6.i,),
                                    )
                                    ),

                                ]),
                              // Container(
                              //   child: Row(
                              //     children:[
                              //       Text(
                              //       model.editProfileSelectedDOB == null
                              //           ? "Date of Birth"
                              //           : DateFormat(
                              //           'dd-MM-yyyy')
                              //           .format(model
                              //           .editProfileSelectedDOB),
                              //       style: model.editProfileSelectedDOB ==
                              //           null
                              //           ? TextStyle(
                              //         color: ColorUtils.black,
                              //         fontFamily: FontUtils
                              //             .PoppinsSemibold,
                              //         fontSize: 1.8.t,
                              //       )
                              //           : TextStyle(
                              //         color: ColorUtils.black,
                              //         fontFamily: FontUtils
                              //             .PoppinsRegular,
                              //         fontSize: 1.8.t,
                              //       ),
                              //     ),
                              //       Text(","),
                              //       //Text(model.openingTimeFrom == null ? "time?" : model.openingTimeFrom)
                              //   ]),
                              // ),
                              Container(
                                child: Text(
                                  model.selectedDate == null
                                      ? ""
                                      : DateFormat('dd-MM-yyyy')
                                      .format(model.selectedDate),
                                  style: model.selectedDate == null ? TextStyle(
                                    color: ColorUtils.blue,
                                    fontFamily: FontUtils.PoppinsSemibold
                                  )
                                      :
                                  TextStyle(
                                    color: ColorUtils.black,
                                    fontFamily: FontUtils.PoppinsRegular,
                                    fontSize: 1.8.t,
                                  ),
                                ),
                                //Text(model.openingTimeFrom == null ? "time?" : model.openingTimeFrom)
                              )

                          ]),
                          SizedBox(height: 1.h,),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 5.w),
                            child: Divider(
                              thickness: 2,
                            ),
                          ),

                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[
                                      Container(
                                        color: Colors.white,
                                        margin: EdgeInsets.only(top: 1.h),
                                        child: Text("Select Time",
                                          style: TextStyle(
                                            color: ColorUtils.gradientcolor2,
                                            fontSize: 1.8.t,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 1.5.h, right: 14.w),
                                          child: GestureDetector(
                                            onTap: (){

                                              showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.now(),
                                                  builder: (context, child) {
                                                    return Theme(
                                                      data: Theme.of(context).copyWith(
                                                        colorScheme: ColorScheme.light(
                                                          primary: ColorUtils.gradientcolor2, // <-- SEE HERE
                                                          onPrimary: ColorUtils.white, // <-- SEE HERE
                                                          onSurface: ColorUtils.black, // <-- SEE HERE
                                                        ),
                                                        textButtonTheme: TextButtonThemeData(
                                                          style:
                                                          TextButton.styleFrom(
                                                            primary: ColorUtils.gradientcolor2,
                                                            // button text color
                                                          ),
                                                        ),
                                                      ),
                                                      child: child!,
                                                    );
                                                  },
                                                  initialEntryMode: TimePickerEntryMode.dial,
                                                  confirmText: "CONFIRM",
                                                  cancelText: "NOT NOW",
                                                  helpText: "BOOKING TIME"
                                              ).then((value){
                                                model.openingTimeFrom = value!.format(context);
                                                model.notifyListeners();
                                              });

                                            },
                                            child: Icon(Icons.access_time, size: 6.i, )
                                          )
                                      ),

                                    ]),
                                Text(model.openingTimeFrom == null ? "12:00 PM" : model.openingTimeFrom)
                                //   ]),
                                // ),


                              ]),


                          // Container(
                          //   color: Colors.white,
                          //   height: 4.h,
                          //   child: TextFormField(
                          //     controller: widget.field1,
                          //     style: CustomTheme.placeholder,
                          //     decoration: InputDecoration(
                          //         border: InputBorder.none,
                          //         hintText: "+971 50 1234 567",
                          //         hintStyle: TextStyle(
                          //             fontSize: 1.8.t,color: ColorUtils.black
                          //         )
                          //       // CustomTheme.placeholder,
                          //     ),
                          //   ),
                          // ),
                        ]),
                  ), // SizedBox(height: 1.h),


                ]
                ,
              )
              ,
            ),
                SizedBox(height: 2.h,),
                ButtonGradient(
                  title: Constants.submit, onPressed: (){model.navigationService.back();},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TimeCheck extends StatefulWidget {
  const TimeCheck({Key? key}) : super(key: key);

  @override
  _TimeCheckState createState() => _TimeCheckState();
}

class _TimeCheckState extends State<TimeCheck> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      onModelReady: (model) {
      },
      disposeViewModel: false,
      builder: (context, model, child) {
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(6)),
            border: Border.all(color: ColorUtils.blue),
          ),
          child: GestureDetector(
            onTap: (){
              showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  initialEntryMode: TimePickerEntryMode.dial,
                  confirmText: "CONFIRM",
                  cancelText: "NOT NOW",
                  helpText: "BOOKING TIME"
              ).then((value){
                model.openingTimeFrom = value!.format(context);
                model.notifyListeners();
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 1.2.h,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    model.openingTimeFrom == null ? "time?" : model.openingTimeFrom,
                    //DateFormat("HH:mm:ss").parse(model.openingTimeFrom!).toString(),
                    style: TextStyle(
                      fontFamily: FontUtils.PoppinsSemibold,
                      fontSize: 2.t,
                      color: ColorUtils.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),

    );
  }
    );}}
