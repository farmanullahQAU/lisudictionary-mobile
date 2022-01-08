import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mm_dictionary/contribute/contribute.dart';
import 'package:mm_dictionary/favourite.dart';

import 'home.dart';
import 'model/word.dart';

class HomeController extends GetxController{

  List<Word>? allWords=[];

  intWords(List<Word>? words)
  {

    this.allWords=words;
  }

  List<Widget> myTabas=[
    Home(),
Favourite(),
    DictionarForm()

  ];
RxInt selectedIndex=0.obs;
  void  onSelected(int index) {

      selectedIndex = index.obs;
      update();

  }
  RxBool searched=false.obs;
  isSearched(bool val)
  {
    this.searched=val.obs;
    update();
  }

  TextEditingController? searchController;
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    this.searchController=TextEditingController();
    super.onInit();
  }


}