import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/themes/app_color.dart';
import 'package:weather/data/entities/forcast_day_entity/forcast_day_entity.dart';
import 'package:weather/logic/state/app_state.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/utilities/app_utility.dart';

class HistoryWeatherWidget extends StatelessWidget {
  final ForeCastDay foreCastDay;
  final AppState appState;
  const HistoryWeatherWidget({Key? key, required this.foreCastDay,required this.appState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppUtility.getMonthAndDay(foreCastDay.hour[0].time.toString()),
            style:AppStyle.textStyle(context, AppColor.colorWhite, 14, FontWeight.w700,[]),
            textAlign: TextAlign.left,
          ),
          Image.network(
            'https:${foreCastDay.hour[0].condition.icon}',
            height: 50.h,
            width: 50.w,
          ),
          Text(
            AppUtility.getOption(appState.tempOption,foreCastDay.hour[0].tempC,foreCastDay.hour[0].tempF),
            style:AppStyle.textStyle(context, AppColor.colorWhite, 12, FontWeight.w400,[]),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}