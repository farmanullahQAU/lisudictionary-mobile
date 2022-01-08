import 'package:flutter/material.dart';

import '../app_constants.dart';


class AuthButtons extends StatelessWidget {
  final Size? size;
  final Color? backgroundColor;
  final Color? textColor;
  final String? buttonText;
  final VoidCallback? onPress;
  final bool isTransparent;
  AuthButtons(
      {Key? key,
      this.size: const Size(300, 10),
      this.backgroundColor,
      this.textColor = Colors.white,
      this.buttonText,
      this.onPress,
      this.isTransparent = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius)),
        backgroundColor: this.backgroundColor ?? Colors.blue.shade700,
        //padding: const EdgeInsets.all(16.0),
        primary: Colors.white,
        //    textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: onPress,
      child: Center(
          child: Text("${this.buttonText}",
              style: TextStyle(color: this.textColor, fontSize: 15))),
    );

    // return TextButton(
    //
    //   style: TextButton.styleFrom(
    //
    //     fixedSize:size,
    //
    //     backgroundColor: backgroundColor,
    //  //   side: BorderSide(color: Colors.white)
    //
    //
    //   ),
    //
    //   onPressed:this.onPress,
    //   child: Text("${this.buttonText}", style: TextStyle(color: this.textColor),),
    // );
  }
}
