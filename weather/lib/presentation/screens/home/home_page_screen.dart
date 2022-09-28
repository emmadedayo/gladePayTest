import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constants/router_constant.dart';
import 'package:weather/logic/cubit/appCubit.dart';
import 'package:weather/logic/state/app_state.dart';
import 'package:weather/presentation/components/loading_screen.dart';
import 'package:weather/presentation/screens/general_component/general_component.dart';
import 'package:weather/presentation/screens/home/component/upper_appbar_widget.dart';
import 'package:weather/presentation/screens/home/component/weather_info_widget.dart';

import '../../../core/constants/colors.dart';
import 'component/weather_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

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
                child: emeState.isLoading?
                const LoadingScreen():
                SingleChildScrollView(
                  child: Container(
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
                        UpperAppBarWidget(appState: emeState,),
                        const SizedBox(height: 10),
                        WeatherImageWidget(appState: emeState,),
                        WeatherInformationWidget(appState: emeState,),
                        const SizedBox(height: 20,),

                        Padding(
                          padding: const EdgeInsets.only(left: 50,right: 50).r,
                          child: ButtonWidget(
                            buttonTextSize: 18,
                            containerHeight: 50.h,
                            containerWidth: 0,
                            buttonText: "Forecast report",
                            color: AppColor.colorWhite,
                            textColor: const Color(0xff444E72),
                            onTap: (){
                              Navigator.of(context).pushNamed(historyTime, arguments: {'history': emeState.forCastResponseEntity, 'hours': emeState.todayForCast,'future': emeState.futureForCast});
                            },
                            radius: 8,

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