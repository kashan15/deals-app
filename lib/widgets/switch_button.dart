import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SwitchWidget extends StatefulWidget {
  bool status;
  SwitchWidget({required this.status});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: widget.status
                  ? [
                      ColorUtils.gradientcolor1,
                      ColorUtils.gradientcolor2,
                    ]
                  : [
                      ColorUtils.white,
                      ColorUtils.white,
                    ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.1, 0.6]),
        ),
        child: FlutterSwitch(
          width: 13.w,
          height: 3.5.h,
          valueFontSize: 5.t,
          toggleSize: 3.5.h,
          value: widget.status,
          activeColor: Colors.transparent,
          borderRadius: 20.0,
          padding: 4.0,
          showOnOff: false,
          onToggle: (val) {
            setState(() {
              widget.status = !widget.status;
            });
          },
        ),
      ),
    );
  }
}
