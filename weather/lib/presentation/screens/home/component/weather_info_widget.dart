import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/themes/app_color.dart';
import 'package:weather/logic/state/app_state.dart';

import '../../../../core/constants/colors.dart';

class WeatherInformationWidget extends StatelessWidget {
  final AppState appState;
  const WeatherInformationWidget({Key? key, required this.appState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var day = DateFormat.d().format(DateTime.now());
    var month = DateFormat.LLLL().format(DateTime.now());
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 20,right: 20,bottom: 10).r,
      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10).r,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0xff7dc1f1),
          ),
        ],
        borderRadius: BorderRadius.circular(
          13.9839.r,
        ),
        border: Border.all(
          color: const Color(0xffbbd4e6),
          width: 2,
        ),
        color: AppColor.colorWhite.withOpacity(0.30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          const SizedBox(height: 10,),
          Text(
            'Today, $day $month',
            style:AppStyle.textStyle(context, AppColor.colorWhite, 20, FontWeight.w600,[]),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10,),
          Text(
            '${appState.currentLocation?.current.tempC}\u00B0',
            style:AppStyle.textStyle(context, AppColor.colorWhite, 70, FontWeight.w400,[
              const Shadow(
                  offset: Offset(1.5, 1.9),
                  blurRadius: 3.0,
                  color: Color.fromRGBO(0, 0, 0, 0.1)
              ),
            ]),
            textAlign: TextAlign.left,
          ),
          Text(
            '${appState.currentLocation?.current.condition.text}',
            style:AppStyle.textStyle(context, AppColor.colorWhite, 20, FontWeight.w600,[
              const Shadow(
                  offset: Offset(1.5, 1.9),
                  blurRadius: 3.0,
                  color: Color.fromRGBO(0, 0, 0, 0.1)
              ),
            ]),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 20,),
          Padding(
              padding: const EdgeInsets.only(left: 50,right: 10,top: 7,bottom: 7).r,
              child:Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Image.asset('assets/images/wind.png',height: 20.19),
                        const SizedBox(width: 15,),
                        Text(
                          'Wind',
                          style:AppStyle.textStyle(context, AppColor.colorWhite, 16, FontWeight.normal,[]),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(width: 14,),
                        const VerticalDivider(
                          color: AppColor.colorWhite,
                          thickness: 1,
                        ),
                        const SizedBox(width: 14,),
                        Text(
                          '${appState.currentLocation?.current.windKph} km/h',
                          style:AppStyle.textStyle(context, AppColor.colorWhite, 16, FontWeight.normal,[]),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  IntrinsicHeight(
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Image.asset('assets/images/hum.png',height: 20.19),
                        const SizedBox(width: 15,),
                        Text(
                          'Hum',
                          style:AppStyle.textStyle(context, AppColor.colorWhite, 16, FontWeight.normal,[]),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(width: 14,),
                        const VerticalDivider(
                          color: AppColor.colorWhite,
                          thickness: 1,
                        ),
                        const SizedBox(width: 14,),
                        Text(
                          '${appState.currentLocation?.current.humidity} %',
                          style:AppStyle.textStyle(context, AppColor.colorWhite, 16, FontWeight.normal,[]),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  )
                ],
              )
          )

        ],
      ),
    );
  }
}