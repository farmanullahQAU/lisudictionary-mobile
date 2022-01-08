
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_dictionary/core/services/device_infor_services.dart';
import 'package:mm_dictionary/favourite.dart';
import 'package:mm_dictionary/word_details/word_details_controller.dart';

import '../constants.dart';
import '../home.dart';
import '../model/word.dart';
class DetailPage extends StatelessWidget {

  Word? word;



   DetailPage({Key? key,this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WordDetailsController>(
      builder:(controller)=> Scaffold(
        appBar: AppBar(
          title: Text(controller.currentWord?.value.word??"",),
          elevation: 0.0,
         ),
        body: Align(
          alignment: Alignment.center,
          child: Column(

            children: [
              Container(
                width: Get.width*0.95,
                child: Card(
                  color: secondaryColor,

                  elevation: 15,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        trailing: IconButton(


                          icon:

                          Icon(Icons.favorite,
                            color:controller.currentWord?.value.favoriteList!=null&&(controller.currentWord!.value.favoriteList!.contains(Get.find<DeviceInfoService>().deviceId)==true)?Colors.yellow:Colors.white54,
                            ), onPressed: () async {

                           if( controller.currentWord?.value.favoriteList?.contains(Get.find<DeviceInfoService>().deviceId)==false)
                             {
                               await FirebaseFirestore.instance.collection("words").doc(controller.currentWord?.value.id).update({"favoriteList":FieldValue.arrayUnion([ Get.find<DeviceInfoService>().deviceId])});
                              controller.currentWord?.value.favoriteList?.add(Get.find<DeviceInfoService>().deviceId!);
                               controller.update();

                             }
                           else{

                             await FirebaseFirestore.instance.collection("words").doc(controller.currentWord?.value.id).update({"favoriteList":FieldValue.arrayRemove([ Get.find<DeviceInfoService>().deviceId])});

                             controller.currentWord?.value.favoriteList?.remove(Get.find<DeviceInfoService>().deviceId!);

                             controller.update();
                           }







                        },
                        ),
                        title: Text(this.word?.word??""),

                        //   title:  Text(this.invitation!.invitedBy!),
                        // subtitle: Text(
                        //   this.language:??"",
                        //   style: TextStyle(
                        //       color: Colors.black.withOpacity(0.6),fontStyle: FontStyle.italic),
                        // ),
                        subtitle: RichText(
                          text: TextSpan(
                            text: "English:  ",
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(color: definitionColor),
                            children:  <TextSpan>[
                              TextSpan(text: this.word?.engDefinition??"", style: Theme.of(context) .textTheme
                                  .caption!
                                  .copyWith(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                  word?.engExamples!=null?    Padding(
                        padding:  EdgeInsets.symmetric(horizontal:Get.width/2*0.1),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:this.word!.engExamples!.map((e) => Text(e,

                          style:  Theme.of(context) .textTheme
                              .caption!
                              .copyWith(color: Colors.white70),
                          )).toList(),
                        ),
                      ):Container(),

word!.burmerDefinition!.isNotEmpty?
                      Column(
                        children: [
                          Divider(),

                          ListTile(

                            title: Text(this.word?.word??"",
                            ),


                            subtitle: RichText(
                              text: TextSpan(
                                text: "Burmese:  ",
                                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: definitionColor),
                                children:  <TextSpan>[
                                  TextSpan(text: this.word?.burmerDefinition??"", style: Theme.of(context) .textTheme
                                  .caption!
                                  .copyWith(color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ):Container(),
word?.burmerExamples!=null?
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal:Get.width/2*0.1),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:this.word!.burmerExamples!.map((e) => Text(e,

                            style: Theme.of(context) .textTheme
                              .caption!
                              .copyWith(color: Colors.white70),
                          )).toList(),
                        ),
                      ):Container(),

                      word!.lisuDefinition!.isNotEmpty?
                      Column(
                        children: [
                          Divider(),

                          ListTile(

                            title: Text(this.word?.word??""),


                            subtitle: RichText(
                              text: TextSpan(
                                text: "Lisu ",
                                style:              Theme.of(context).textTheme.bodyText2?.copyWith(color: definitionColor),
                                children:  <TextSpan>[
                                  TextSpan(text: this.word?.lisuDefinition??"", style: Theme.of(context) .textTheme
                                  .caption!
                                  .copyWith(color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ):Container(),
word?.lisuExamples!=null?
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal:Get.width/2*0.1),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:this.word!.lisuExamples!.map((e) => Text(e,

                            style: Theme.of(context) .textTheme
                              .caption!
                              .copyWith(color: Colors.white70),
                          )).toList(),
                        ),
                      ):Container(),

                      ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          // TextButton(
                          //   onPressed: () async {
                          // //    Get.back();
                          //   },
                          //   child: const Text('ACCEPT'),
                          // ),

                        ],
                      ),
                      // Image.asset('assets/card-sample-image.jpg'),
                      // Image.asset('assets/card-sample-image-2.jpg'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
