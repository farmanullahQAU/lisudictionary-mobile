
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_dictionary/components/formField.dart';
import 'package:mm_dictionary/model/word.dart';

import '../../../../constants.dart';
import '../home.dart';
import 'contributeController.dart';

class DictionarForm extends StatelessWidget {
   DictionarForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DictFormController>(
      builder: (controller) => Scaffold(
         appBar: AppBar(title: Text("Contribute"),),
        body: LayoutBuilder(
          builder: (context, constraints) => Scaffold(
            body: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: constraints.maxWidth * 0.95,
                    child: Card(
                      color: secondaryColor,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: controller.formKey,
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("English",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFEE2727))),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Field(
                                            //text field controller for word field
                                            controller: controller.wordController,

                                            validator: (val) =>
                                            val == "" ? "Enter word" : null,

                                            labelText: "Word",
                                            hintText: "Enter word...",
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Field(
                                            labelText: "Definition",
                                            hintText: "Enter definition... ",
                                            controller:
                                            controller.engDefController,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Field(
                                        labelText: "Example 1",
                                        hintText: "Enter example 1",
                                        controller:
                                        controller.engExample1Controller,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Field(
                                        controller:
                                        controller.engExample2Controller,
                                        labelText: "Example 2",
                                        hintText: "Enter example 2",
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Lius",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFEE2727))),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Field(
                                      controller: controller.lisuDefController,
                                      validator: (val) => val == ""
                                          ? "*definition shouldn't be empty"
                                          : null,
                                      labelText: "Definition",
                                      hintText: "Definition in lisu...",
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Field(
                                        controller:
                                        controller.lisuExample1Controller,
                                        labelText: "Example 1",
                                        hintText: "Enter example 1",
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Field(
                                        labelText: "Example 2",
                                        hintText: "Enter example 2",
                                        controller:
                                        controller.lisuExample2Controller,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Burmese",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFEE2727)),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Field(
                                      controller: controller.burmeseDefController,
                                      validator: (val) =>
                                      val == "" ? "*required" : null,
                                      labelText: "Definition",
                                      hintText: "Definition in burmese...",
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Field(
                                        controller:
                                        controller.burmeseExample1Controller,
                                        labelText: "Example 1",
                                        hintText: "Enter example 1",
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Field(
                                        labelText: "Example 2",
                                        hintText: "Enter example 2",
                                        controller:
                                        controller.burmeseExample2Controller,
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: constraints.maxWidth * 0.4,
                                    child: ElevatedButton(
                                      style: TextButton.styleFrom(

                                      ),
                                      onPressed: () {
                                        if (controller.formKey?.currentState
                                            ?.validate() ??
                                            false) {
                                          controller.formKey?.currentState
                                              ?.save();

                                          final word = new Word(
                                            word: controller.wordController?.text,
                                            engDefinition:
                                            controller.engDefController?.text,
                                            lisuDefinition: controller
                                                .lisuDefController?.text,
                                            burmerDefinition: controller
                                                .burmeseDefController?.text,
                                            engExamples: <String>[
                                              controller.engExample1Controller
                                                  ?.text ??
                                                  "",
                                              controller.engExample1Controller
                                                  ?.text ??
                                                  ""
                                            ],
                                            lisuExamples: <String>[
                                              controller.lisuExample1Controller
                                                  ?.text ??
                                                  "",
                                              controller.lisuExample2Controller
                                                  ?.text ??
                                                  ""
                                            ],
                                            burmerExamples: <String>[
                                              controller.burmeseExample1Controller
                                                  ?.text ??
                                                  "",
                                              controller.burmeseExample2Controller
                                                  ?.text ??
                                                  ""
                                            ],
                                          );
                                          print(
                                              controller.engDefController?.text);
                                          print(
                                              controller.lisuDefController?.text);
                                       //   Get.find<RecentController>()
                                       //        .words
                                       //        ?.add(word);
                                     //     Get.find<RecentController>().update();
                                          Get.back();
                                        }
                                      },
                                      //  icon: Icon(Icons.add),
                                      child: Text("SUBMIT"),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
