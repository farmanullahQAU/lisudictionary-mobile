import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:mm_dictionary/textStyles.dart';

import 'app_constants.dart';
import 'home.dart';


class IntroScreen extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Home()),
    );
  }

  _buildImage(String assetName, [double width = 350]) {
    return Lottie.asset(assetName, width: Get.width,repeat: true);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: TextStyles.headingText2.copyWith(color: Colors.black),
      bodyTextStyle: TextStyles.headingText2.copyWith(color: Colors.grey),
      //   descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: IntroductionScreen(
        //  showDoneButton: false,
        key: introKey,
        globalBackgroundColor: Colors.white,
        globalHeader: Align(
          alignment: Alignment.topRight,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 16),
              //      child: _buildImage(AppConstants.intro_image1, 100),
            ),
          ),
        ),

        pages: [
          PageViewModel(
            title: "Welcome to Lisu Dictionary",
            bodyWidget: Text(
              "Easy to use",
              textAlign: TextAlign.center,
              style: TextStyles.headingText2.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 15),
            ),
            image: _buildImage(AppConstants.intro_image1),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Search a word",
            //  body: "Another beautiful body text for this example onboarding",

            bodyWidget: Text(
              "Search a word in three language",
              textAlign: TextAlign.center,
              style: TextStyles.headingText2.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 15),
            ),
            image: _buildImage(AppConstants.intro_image1),

            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Add new word",
            // body: "Another beautiful body text for this example onboarding",
            bodyWidget: Text(
              "Add new word to Lisu dictionary",
              textAlign: TextAlign.center,
              style: TextStyles.headingText2.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 15),
            ),
            image: _buildImage(AppConstants.intro_image2),

            decoration: pageDecoration,
          ),
        ],
        onDone: () => _onIntroEnd(context),
        //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        skipFlex: 0,

        nextFlex: 0,
        //rtl: true, // Display as right-to-left
        skip: const Text('Skip'),
        next: Container(
            decoration:
                BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            width: 45,
            height: 45,
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(10.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          //    color: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
