import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather/core/constants/colors.dart';
import 'package:weather/core/themes/app_color.dart';
import 'package:weather/core/utilities/app_utility.dart';
import 'package:weather/logic/state/mapState.dart';


class MapScreenComponent extends StatelessWidget {
  final MapState mapState;
  final ScrollController scrollController;
  final PanelController? panelController;

  const MapScreenComponent({Key? key, required this.scrollController, this.panelController, required this.mapState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    var day = DateFormat.d().format(DateTime.now());
    var month = DateFormat.LLLL().format(DateTime.now());

    return SingleChildScrollView(
      controller: scrollController,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Container(
          margin: const EdgeInsets.only(left: 20,right: 20,top: 7,bottom: 30).r,
          padding: const EdgeInsets.only(left: 20,right: 20,top: 7,bottom: 30).r,
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
              dragHandle(),
              SizedBox(height: 10.h,),
              Text(
                'Today, $day $month',
                style:AppStyle.textStyle(context, AppColor.colorWhite, 20, FontWeight.w600,[]),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10,),
              Center(
                  child: SizedBox(
                    width: 40.43.w,
                    height: 40.26.h,
                    child: Image.network(
                      'https:${mapState.currentLocation?.current.condition.icon}',
                      fit: BoxFit.contain,
                    ),
                  )
              ),
              const SizedBox(height: 20,),
              Text(
                AppUtility.getOption(mapState.tempOption,mapState.currentLocation?.current.tempC,mapState.currentLocation?.current.tempF),
                style:AppStyle.textStyle(context, AppColor.colorWhite, 70, FontWeight.w600,[
                  const Shadow(
                    offset: Offset(0.1, 0.1),
                    blurRadius: 1.0,
                    color: AppColor.colorWhite,
                  ),
                ]),
                textAlign: TextAlign.left,
              ),
              Text(
                '${mapState.currentLocation?.current.condition.text}',
                style:AppStyle.textStyle(context, AppColor.colorWhite, 20, FontWeight.w600,[
                  const Shadow(
                    offset: Offset(0.1, 0.1),
                    blurRadius: 1.0,
                    color: AppColor.colorWhite,
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
                              '${mapState.currentLocation?.current.windKph} km/h',
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
                              '${mapState.currentLocation?.current.humidity} %',
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
        ),
      ),
    );
  }

  Widget dragHandle() => GestureDetector(
      onTap:togglePanel,
      child: Center(
        child: Container(
          height: 5,
          width: 50,
          decoration: BoxDecoration(
            color: AppColor.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      )
  );

  void togglePanel() => panelController!.isPanelOpen ? panelController?.close() : panelController?.open();
}

