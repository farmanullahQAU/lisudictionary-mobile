//
// import 'package:flutter/material.dart';
// class TxtField extends StatelessWidget {
//
//   final String? labelTxt,
//       TxtField({Key? key, this.labelTxt}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//
//
//
//       initialValue: 'Input text',
//       decoration: InputDecoration(
//
//
//         filled: true,
//
//         labelText: 'Label text',
//         //   errorText: 'Error message',
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: BorderSide(color: Colors.white)
//
//         ),
//         suffixIcon: Icon(
//           Icons.error,
//         ),
//
//         fillColor: Colors.blue[900],
//       ),
//
//
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../app_constants.dart';

class TxtField extends StatelessWidget {
  final double radius = AppConstants.borderRadius;
  final double radius2 = 10;
  final String? lblTxt;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final String? hintTxt;
  final bool? ispassword;
  final bool? isunique;
  Function? onChanged;
  TextEditingController? controller;


  TxtField(

      {Key? key,
      this.lblTxt,
        this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.fillColor,
        this.onChanged,
      this.hintTxt,
      this.ispassword = false,
      this.isunique = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
controller: this.controller,
      onChanged:(val)=> this.onChanged==null?null:this.onChanged!(val),
//obscureText:this.ispassword==true?context.read<IntroProvider>().visible:false,

      // style: TextStyle(color: Colors.black.withOpacity(0.6)),

      //  initialValue: 'Input text',
      decoration: InputDecoration(

        fillColor: this.fillColor,

        filled: true,

        //   labelText: lblTxt,
        //
        // hintStyle: TextStyle(color: Colors.grey.shade400),
        //  labelStyle: TextStyle(color: Colors.grey.shade500),
        //   errorText: 'Error message',
        focusedBorder: OutlineInputBorder(
          borderRadius: this.isunique == false
              ? BorderRadius.circular(radius)
              : BorderRadius.circular(radius2),
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: this.isunique == false
              ? BorderRadius.circular(radius)
              : BorderRadius.circular(radius2),
          borderSide: BorderSide(width: 1, color: Colors.orange),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: this.isunique == false
              ? BorderRadius.circular(radius)
              : BorderRadius.circular(radius2),
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
        border: OutlineInputBorder(
            borderRadius: this.isunique == false
                ? BorderRadius.circular(radius)
                : BorderRadius.circular(radius2),
            borderSide: BorderSide(
              width: 1,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: this.isunique == false
                ? BorderRadius.circular(radius)
                : BorderRadius.circular(radius2),
            borderSide: BorderSide(width: 1, color: Colors.white)),
        suffixIcon: this.suffixIcon,
        prefixIcon: this.prefixIcon,
        hintText: this.hintTxt,

        //    fillColor: AppConstants.cardBgColor,
      ),
    );
  }
}
