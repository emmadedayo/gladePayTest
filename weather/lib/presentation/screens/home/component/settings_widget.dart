import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/constants/notification.dart';
import 'package:weather/core/constants/option_constant.dart';
import 'package:weather/core/themes/app_color.dart';
import 'package:weather/logic/cubit/appCubit.dart';
import 'package:weather/logic/state/app_state.dart';

import '../../../../core/constants/colors.dart';

class SettingsWidget extends StatelessWidget {
  final AppState appState;
  const SettingsWidget({Key? key,required this.appState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          //padding: const EdgeInsets.all(15.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(13)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                    color: AppColor.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
                child: Text("Settings",
                    textAlign: TextAlign.left,
                    style: AppStyle.textStyle(context, AppColor.textColor, 24, FontWeight.w500,[
                      const Shadow(
                          offset: Offset(1.5, 1.9),
                          blurRadius: 3.0,
                          color: Color.fromRGBO(0, 0, 0, 0.1)
                      ),
                    ])
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 10),
                child:Center(
                  child: Text(
                    'Customize your view',
                    style: AppStyle.textStyle(context, AppColor.black, 14, FontWeight.normal,[]),
                  ),
                ),
              ),

              ListView.builder(
                  itemCount: optionModel.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context,int index){
                    return Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            margin: const EdgeInsets.all(3),
                            child:ListTile(
                              title: Text(optionModel[index].text ?? '',style: AppStyle.textStyle(context, AppColor.textColor, 12, FontWeight.w300,[]),),
                              trailing:appState.tempOption == "C" ? optionModel[index].value == "C" ? const Icon(Icons.check,color: AppColor.primaryColor,) : const Icon(Icons.check,color: Colors.transparent,) : optionModel[index].value == "F" ? const Icon(Icons.check,color: AppColor.primaryColor,) : const Icon(Icons.check,color: Colors.transparent,),
                            ),
                          ),
                          onTap: (){
                            Navigator.pop(context,optionModel[index].value);
                          },
                        )
                      ],
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}