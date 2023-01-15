import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/theme.dart';
import 'package:flutter/material.dart';


class ContainerTextField extends StatefulWidget {
  dynamic field1;
  dynamic field2;
  ContainerTextField({this.field1,this.field2});

  @override
  State<ContainerTextField> createState() => _ContainerTextFieldState();
}

class _ContainerTextFieldState extends State<ContainerTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorUtils.grey1,
          borderRadius:
          BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                left: 5.w, top: 2.h),
            child: TextFormField(
              controller: widget.field1,
              style: CustomTheme.placeholder,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle:
                CustomTheme.placeholder,
              ),
            ),
          ),
          SizedBox(height: 1.h),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
                horizontal: 5.w),
            child: Divider(
              thickness: 2,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: 5.w, top: 1.h),
            child: TextFormField(
              style: CustomTheme.placeholder,
              controller: widget.field2,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle:
                CustomTheme.placeholder,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
