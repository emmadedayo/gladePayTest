import 'package:flutter/material.dart';
import 'package:weather/core/constants/router_constant.dart';
import 'package:weather/core/themes/app_color.dart';
import 'package:weather/logic/state/app_state.dart';

import '../../../../core/constants/colors.dart';
import 'notification_widget.dart';

class UpperAppBarWidget extends StatelessWidget {
  final AppState appState;
  const UpperAppBarWidget({Key? key, required this.appState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
      width: double.infinity,
      child: Row(
        children: [
          GestureDetector(
            child:  Image.asset('assets/images/location.png',height: 23.19,color: AppColor.colorWhite,),
            onTap: (){
              Navigator.pushNamed(context, locationSearch);
            },
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 10,
            child: Text("${appState.currentLocation?.location.name},${appState.currentLocation?.location.region},${appState.currentLocation?.location.country} ",
                style: AppStyle.textStyle(context, AppColor.colorWhite, 16, FontWeight.w500,[])
            ),
          ),
          const Spacer(),
          GestureDetector(
            child:Image.asset('assets/images/notification.png',height: 20.19,),
            onTap: (){
              showModalBottomSheet(
                enableDrag: true,
                isDismissible: true,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                context: context,
                builder: (BuildContext bc) {
                  return const NotificationWidget();
                },
              );
            },
          )
        ],
      ),
    );
  }
}