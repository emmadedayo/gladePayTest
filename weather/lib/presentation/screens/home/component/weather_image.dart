import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/logic/state/app_state.dart';

class WeatherImageWidget extends StatelessWidget {
  final AppState appState;
  const WeatherImageWidget({Key? key, required this.appState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          margin: const EdgeInsets.all(50),
          width: 200.43.w,
          height: 120.26.h,
          child: Image.network(
            'https:${appState.currentLocation?.current.condition.icon}',
            fit: BoxFit.contain,
          ),
        )
    );
  }
}