class NotificationModel {
  const NotificationModel({this.image,this.text,this.time,this.form});
  final String? image;
  final String? time;
  final String? text;
  final bool? form;
}

const List<NotificationModel> constantNotification = <NotificationModel>[
  NotificationModel(image: 'assets/images/sun.png',text:'A sunny day in your location, consider wearing your UV protection',time: '10 minutes ago',form: true),
  NotificationModel(image: 'assets/images/wind_dark.png',text:"A cloudy day will occur all day long, don't worry about the heat of the sun",time: '1 day ago',form: false),
  NotificationModel(image: 'assets/images/cloud.png',text:"Potential for rain today is 84%, don't forget to bring your umbrella.",time: '2 days ago',form: false),
];