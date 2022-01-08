import 'package:get/get.dart';
import 'package:mm_dictionary/model/word.dart';

class WordDetailsController extends GetxController{

  Rx<Word>? currentWord;

  setWord(Word word)
  {

    this.currentWord=word.obs;
    update();
  }

  @override
  void onInit() {
    this.currentWord=Word().obs;
    super.onInit();
  }

}