import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/themes/app_color.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/utilities/app_utility.dart';
import '../../../../data/entities/hour_entity/hour_entity.dart';

class CurrentTimeWidget extends StatelessWidget {
  final Hour hours;
  const CurrentTimeWidget({Key? key, required this.hours})
        : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Text(
            '${hours.tempC}°C',
            style:AppStyle.textStyle(context, AppColor.colorWhite, 11, FontWeight.normal,[]),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 20,),
          Image.network(
            'https:${hours.condition?.icon}',
            height: 50.h,
            width: 50.w,
          ),
          const SizedBox(height: 20,),
          Text(
            AppUtility.parseTime(hours.time.toString()),
            style:AppStyle.textStyle(context, AppColor.colorWhite, 11, FontWeight.normal,[]),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}