import 'package:flutter/material.dart';
import 'package:luci_test/theme/app_colors.dart';

class OptionalDropDownWidget extends StatelessWidget {
  const OptionalDropDownWidget(
      {Key? key, this.titleOptional = '', required this.options})
      : super(key: key);
  final String titleOptional;
  final List<String> options;

  bool isFinalOfList(String value) {
    return value == options.last;
  }

  Color getColorItem(String value) {
    if (isFinalOfList(value)) {
      return Colors.orange;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      iconEnabledColor: AppColors.red,
      hint: SizedBox(
        child: Text(
          titleOptional,
          style: const TextStyle(color: Colors.red),
          textAlign: TextAlign.end,
        ),
      ),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.transparent,
      ),
      onChanged: (String? newValue) {},
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: getColorItem(value)),
          ),
        );
      }).toList(),
    );
  }
}
