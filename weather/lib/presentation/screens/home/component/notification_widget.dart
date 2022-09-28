import 'package:flutter/material.dart';
import 'package:weather/core/constants/notification.dart';
import 'package:weather/core/themes/app_color.dart';

import '../../../../core/constants/colors.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({Key? key})
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
                child: Text("Your Notification",
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

              ListView.builder(
                  itemCount: constantNotification.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context,int index){
                    if(index == 0){
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'New',
                                  style: AppStyle.textStyle(context, AppColor.black, 13, FontWeight.w400, letterSpacing: -1,[]),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff95E5FF).withOpacity(0.28),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                            margin: const EdgeInsets.all(3),
                            child: Row(
                              children: <Widget>[
                                Image.asset(constantNotification[index].image ?? '', height: 22,),
                                const SizedBox(width: 10,),
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Text(constantNotification[index].time ?? '', style: AppStyle.textStyle(context, AppColor.textColor, 12, FontWeight.w300,[]),),
                                      const SizedBox(height: 2,),
                                      Text(constantNotification[index].text ?? '', style: AppStyle.textStyle(context, AppColor.textColor, 13, FontWeight.w700,[]),),
                                    ],
                                  ),),
                                const Spacer(),
                                const Icon(Icons.keyboard_arrow_down_sharp, color: AppColor.textColor,)
                              ],
                            ),
                          )
                        ],
                      );
                    }else{
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                            margin: const EdgeInsets.all(3),
                            child: Row(
                              children: <Widget>[
                                Image.asset(constantNotification[index].image ?? '', height: 22,),
                                const SizedBox(width: 10,),
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Text(constantNotification[index].time ?? '', style: AppStyle.textStyle(context, AppColor.textColor, 12, FontWeight.w300,[]),),
                                      const SizedBox(height: 2,),
                                      Text(constantNotification[index].text ?? '', style: AppStyle.textStyle(context, AppColor.textColor, 13, FontWeight.w700,[]),),
                                    ],
                                  ),),
                                const Spacer(),
                                const Icon(Icons.keyboard_arrow_down_sharp, color: AppColor.textColor,)
                              ],
                            ),
                          )
                        ],
                      );
                    }

                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}