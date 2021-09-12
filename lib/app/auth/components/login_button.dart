import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {

  final String buttonText;
  final Widget icon;
  final Function onPressed;
  final Color? bgColor;
  final Color? textColor;

  const LoginButton({
    Key? key,
    required this.buttonText,
    required this.icon,
    required this.onPressed,
    this.bgColor = Colors.white,
    this.textColor = Colors.black
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(width: 10),
          Text(buttonText, style: TextStyle(
            color: textColor
          ))
        ],
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)),
        backgroundColor: MaterialStateProperty.all(bgColor)
      ),
    );
  }
}