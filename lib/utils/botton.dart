import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'media.dart';

class Custombutton {
  static Widget button(clr,text,siz,siz2){
    return ScreenUtilInit(
      builder: () =>  Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: clr,
          ),
          height: height / 15,
          width: width / 1.5,
          child: Row(
            children: [
              siz,
              Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              ),
              siz2,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: Image.asset("image/arrow.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}