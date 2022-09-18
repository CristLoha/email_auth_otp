import 'package:flutter/material.dart';

class CustomInputText extends StatelessWidget {
  final TextEditingController textEditingController;
  final String textFieldHintText;
  final Color textColor;
  final TextInputType inputType;
  final IconData textFieldIcon;
  final String textFieldErrorText;
  final Function onValueChanged;
  final Function onSendOtpClicked;
  final String textfilledType;
  const CustomInputText({
    Key? key,
    required this.textEditingController,
    required this.textFieldHintText,
    required this.textColor,
    required this.inputType,
    required this.textFieldIcon,
    required this.textFieldErrorText,
    required this.onValueChanged,
    required this.onSendOtpClicked,
    required this.textfilledType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: TextFormField(
        controller: textEditingController,
        keyboardType: inputType,
        onChanged: (value) {
          onValueChanged(value);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return textFieldErrorText;
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: textFieldHintText,
          hintStyle: TextStyle(color: textColor),
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            textFieldIcon,
          ),
          suffixIcon: textfilledType == 'email'
              ? TextButton(
                  onPressed: () {
                    onSendOtpClicked();
                  },
                  child: Text('send otp'),
                )
              : Text(''),
        ),
      ),
    );
  }
}
