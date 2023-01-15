import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../app/locator.dart';


class counter extends StatefulWidget {
  const counter({Key? key}) : super(key: key);

  @override
  _counterState createState() => _counterState();
}

class _counterState extends State<counter> {


  var counternumber=1;
  void increment(){
    // setState(() {

    setState(() {
      counternumber++;

    });

  }

  void decrement(){
    setState(() {
      if(counternumber>1){
        counternumber--;
      }
      else{
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      // onModelReady: (data) => data.initializeSplash(),
      builder: (context, model, child) {
        return Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child:  Container(
              // width: 43.w,
              // color: Colors.black,
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: ColorUtils.grey,
                          // border: Border.all(color: ColorUtils.counterColor),
                          borderRadius: BorderRadius.all(
                              Radius.circular(10))),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print("abcd");
                              decrement();
                            },
                            child: Container(

                              child: SvgPicture.asset(
                                  ImageUtils.checkIcon),
                            ),
                          ),
                          Container(
                            width: 8.w,
                            child: Align(
                                alignment:
                                Alignment.center,
                                child: Text(counternumber.toString())),
                          ),
                          GestureDetector(
                            onTap: (){

                              increment();
                              print("amaa");
                            },
                            child: Container(
                              // color: Colors.redAccent,
                              // height: 40.0,
                              // width: 35.0,
                                child: SvgPicture.asset(
                                    ImageUtils.checkIcon)),
                          ),
                        ],
                      )),

                ],
              ),
            ));
      },
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
    );

  }
}