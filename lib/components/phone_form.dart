import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
class PhoneNumberField extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  PhoneNumberField({Key? key}) : super(key: key);
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(


      inputDecoration: InputDecoration(
          hintText : "Enter your number",
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,


          fillColor: Colors.red),
      onInputChanged: (PhoneNumber number) {
        print(number.phoneNumber);
      },
      onInputValidated: (bool value) {
        print(value);
      },
      selectorConfig: SelectorConfig(
        showFlags: false,

        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: TextStyle(color: Colors.grey),
      initialValue: number,
      textFieldController: controller,
      formatInput: false,
      keyboardType:
      TextInputType.numberWithOptions(signed: true, decimal: true),
      //
      inputBorder:  InputBorder.none,
      onSaved: (PhoneNumber number) {
        print('On Saved: $number');
      },
    );
  }
}
