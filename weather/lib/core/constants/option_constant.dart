class OptionModel {
  final String? text;
  final String? value;
  const OptionModel({this.text,this.value});
}

const List<OptionModel> optionModel = <OptionModel>[
  OptionModel(text:'Display Condition in Celsius',value: 'C'),
  OptionModel(text:'Display Condition in Fahrenheit',value: 'F'),
];