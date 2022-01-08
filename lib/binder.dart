import 'package:get/get.dart';
import 'package:mm_dictionary/core/services/device_infor_services.dart';
import 'package:mm_dictionary/core/services/firestore_services.dart';
import 'package:mm_dictionary/home_controller.dart';
import 'package:mm_dictionary/word_details/word_details_controller.dart';

import 'contribute/contributeController.dart';

class Binder extends Bindings {
  @override
  void dependencies() {
    Get.put(DeviceInfoService());

    Get.put(WordDetailsController());
    Get.put(HomeController());



    Get.put(DictFormController());
    Get.put(FirestoreService());


  }
}