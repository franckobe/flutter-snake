import 'package:flutter/material.dart';
import 'package:snake/tools/ValleyColors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, this.color, required this.onPressed}) : super(key: key);

  final String text;
  final Color? color;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) => color ?? ValleyColors.purple1),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide.none
          )
        )
      ),
    );
  }
}
