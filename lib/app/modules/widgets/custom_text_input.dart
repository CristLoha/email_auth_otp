import 'package:flutter/material.dart';

class CustomInputText extends StatelessWidget {
  final TextEditingController textEditingController;
  final String textFieldHintText;
  final Color textColor;
  final TextInputType inputType;
  final IconData textFieldIcon;

  const CustomInputText({
    Key? key,
    required this.textEditingController,
    required this.textFieldHintText,
    required this.textColor,
    required this.inputType,
    required this.textFieldIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: TextFormField(
        controller: textEditingController,
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: textFieldHintText,
          hintStyle: TextStyle(color: textColor),
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            textFieldIcon,
          ),
        ),
      ),
    );
  }
}
