import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onpressed;
  final Text textButton;
  const CustomButton({
    required this.onpressed,
    required this.textButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ElevatedButton(
        onPressed: onpressed,
        child: textButton,
      ),
    );
  }
}
