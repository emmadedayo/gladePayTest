import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/constants/colors.dart';
import 'package:weather/core/themes/app_color.dart';
import 'package:weather/data/entities/forcast_day_entity/forcast_day_entity.dart';
import 'package:weather/logic/cubit/appCubit.dart';
import 'package:weather/logic/state/app_state.dart';
import 'package:weather/presentation/screens/history/component/current_time_widget.dart';

import '../../../data/entities/forcast_response/forcast_response_entity.dart';
import '../../../data/entities/hour_entity/hour_entity.dart';
import 'component/history_weather.dart';

class HistoryTimeScreen extends StatefulWidget {
  final ForCastResponseEntity history;
  final List<Hour>? hours;
  final List<ForeCastDay>? future;
  const HistoryTimeScreen({Key? key, required this.history, required this.future, required this.hours}) : super(key: key);

  @override
  HistoryTimeScreenState createState() => HistoryTimeScreenState();
}

class HistoryTimeScreenState extends State<HistoryTimeScreen> {

  var day = DateFormat.d().format(DateTime.now());
  var month = DateFormat.LLL().format(DateTime.now());

  final itemKey = GlobalKey();
  final scrollController = ScrollController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  /// 4:00 to 7:00 250
  /// 500
  /// 750
  /// 1000
  /// 1250
  /// 1500
  void _scrollToIndex(index) {
    scrollController.jumpTo(1250);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return BlocProvider<AppCubit>(
      create: (context) => AppCubit(AppState(),),
      child: BlocListener<AppCubit, AppState>(
        listener: (context, state) {

        },
        child: BlocBuilder<AppCubit, AppState>(
          builder: (contextCubit, emeState) {
            return Scaffold(
              body: SafeArea(
                child:SingleChildScrollView(
                  primary: true,
                  child: Container(
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
                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                          width: double.infinity,
                          child: Row(
                            children: [
                              const Icon(Icons.arrow_back_ios,color: AppColor.colorWhite,size: 15,),
                              const SizedBox(width: 5),
                              Text("Back",style: AppStyle.textStyle(context, AppColor.colorWhite, 18, FontWeight.normal,[]),),
                              const Spacer(),
                              const Icon(Icons.settings,color: AppColor.colorWhite,size: 20,),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(left: 10,right: 10,top: 7,bottom: 30).r,
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 7,bottom: 30).r,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Today',
                                    style:AppStyle.textStyle(context, AppColor.colorWhite, 20, FontWeight.w600,[]),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    '$month, $day',
                                    style:AppStyle.textStyle(context, AppColor.colorWhite, 17, FontWeight.normal,[]),
                                    textAlign: TextAlign.left,
                                  ),

                                ],
                              ),
                              SizedBox(height: 50.h,),
                              SizedBox(
                                height: 150.0,
                                child:ListView.builder(
                                  shrinkWrap: true,
                                  key: itemKey,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget.hours?.length,
                                  controller: scrollController,
                                  itemBuilder: (context, index) {
                                    return CurrentTimeWidget(hours: widget.hours![index],);
                                  },
                                ),
                              ),
                              SizedBox(height: 30.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Next Forecast',
                                    style:AppStyle.textStyle(context, AppColor.colorWhite, 20, FontWeight.w600,[]),
                                    textAlign: TextAlign.left,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      _scrollToIndex(10);
                                    },
                                    child: const Icon(Icons.calendar_month,color: AppColor.colorWhite,size: 20,),
                                  )

                                ],
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                primary: false,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: widget.future?.length,
                                itemBuilder: (context, index) {
                                  return HistoryWeatherWidget(foreCastDay: widget.future![index],);
                                },
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                )
              ),
            );
          },
        ),
      ),
    );

  }
}