import 'package:get/get.dart';
import 'package:mm_dictionary/intro_screen.dart';
import 'package:mm_dictionary/word_details/details_page.dart';
import 'package:mm_dictionary/word_details/word_details_controller.dart';

import 'home.dart';

List<GetPage> pages = [
  GetPage(name: "/intro", page: () => IntroScreen()),
  GetPage(name: "/details", page: () => DetailPage(),binding: BindingsBuilder.put(() => WordDetailsController())),
];
