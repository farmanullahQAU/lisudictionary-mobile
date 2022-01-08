import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DictFormController extends GetxController{
  TextEditingController? wordController;
  TextEditingController? engDefController;

  TextEditingController? engExample1Controller;

  TextEditingController? engExample2Controller;
  TextEditingController? lisuDefController;

  TextEditingController? lisuExample1Controller;

  TextEditingController? lisuExample2Controller;
  TextEditingController? burmeseDefController;

  TextEditingController? burmeseExample1Controller;

  TextEditingController? burmeseExample2Controller;

  GlobalKey<FormState>? formKey=GlobalKey<FormState>();
  @override
  void onInit() {
    wordController=TextEditingController();
    engDefController=TextEditingController();
    lisuDefController=TextEditingController();
    burmeseDefController=TextEditingController();

    engExample1Controller=TextEditingController();
    engExample2Controller=TextEditingController();
    burmeseExample1Controller=TextEditingController();
    burmeseExample2Controller=TextEditingController();

    lisuExample1Controller=TextEditingController();
    lisuExample2Controller=TextEditingController();

    super.onInit();
  }


}