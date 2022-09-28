import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: ScreenUtil().screenHeight,
      width: ScreenUtil().screenWidth,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColor.primaryBoxShadow,
            blurRadius: 10.0,
            spreadRadius: 0.0,
            offset: Offset(0.0, 0.0), // shadow direction: bottom right
          )
        ],
        gradient: LinearGradient(
          begin: Alignment(-1.0, -4.0),
          end: Alignment(1.0, 4.0),
          colors: [
            AppColor.primaryColor,
            AppColor.primaryColorTwo
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 150.h,),
          Center(
            child: Image.asset("assets/images/front.png", width: 137.w, height: 87.h,),
          ),
          SizedBox(height: 50.h,),
           const Text(
            "Weather",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white
            ),
          ),
          SizedBox(height: 50.h,),
          const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            ),
          ),
        ],
      ),
    );

  }
}