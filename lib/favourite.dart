
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';
import 'word_details/details_page.dart';
import 'home.dart';
import 'model/word.dart';
class Favourite extends StatelessWidget {
  List<Word>? favourite = [



    Word(
        word: "Love",

        burmerDefinition: "burmer definition",
        lisuDefinition: "defintion in lisu",
        engExamples: ["to beloved osomeone very", "this is example 2 in enblish"],
        burmerExamples: ["burmer examples 1", "burmer example 2"],

        lisuExamples: ["isu example 1",'isu exmple 2', "isu example 3"]
    ),

    Word(
        word: "Hate",
        engDefinition: "hate someone .....",
        burmerDefinition: "burmer definition Hate",
        lisuDefinition: "defintion in lisu",
        engExamples: [
          "to hate osomeone very hated",
          "this is hate example 2 in enblish"
        ],
        burmerExamples: [
          "burmer examples of hate",
          "burmer example 2"
        ],

        lisuExamples: ["isu example for hate 1",'isu exmple for hate 2', "isu example for hate 3"]

    )
  ];

  Word? word;



Favourite({Key? key,this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(

          itemCount: this.favourite?.length,

          itemBuilder: (context,index){
        return AddCard(favourite:favourite?[index]??null);
      }),
    );
  }
}
class  AddCard extends StatelessWidget {
  Word? favourite;
    AddCard({Key? key,this.favourite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: IconButton(


      icon: Icon(Icons.favorite,
    ), onPressed: () {


    },
    ),

      title:


    Text(favourite?.word??""),

      children: [

        ListTile(

          title: Text(favourite?.word??""),


          subtitle: RichText(
            text: TextSpan(
              text: "${favourite?.engDefinition} : ",
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: definitionColor),
              children:  <TextSpan>[
                TextSpan(text: favourite?.engDefinition??"", style: Theme.of(context) .textTheme
                    .caption!
                    .copyWith(color: Colors.white),),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:Get.width/2*0.1),
            child: Column(
              children:favourite!.engExamples!.map((e) => Text(e,

                style:  Theme.of(context) .textTheme
                    .caption!
                    .copyWith(color: Colors.white70),
              )).toList(),
            ),
          ),
        ),

        ListTile(

          title: Text(favourite?.word??""),


          subtitle: RichText(
            text: TextSpan(
              text: "${favourite?.burmerDefinition} : ",
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: definitionColor),
              children:  <TextSpan>[
                TextSpan(text: favourite?.engDefinition??"", style: Theme.of(context) .textTheme
                    .caption!
                    .copyWith(color: Colors.white),),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:Get.width/2*0.1),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:favourite!.burmerExamples!.map((e) => Text(e,

                style:  Theme.of(context) .textTheme
                    .caption!
                    .copyWith(color: Colors.white70),
              )).toList(),
            ),
          ),
        ),
        ListTile(

          title: Text(favourite?.word??""),


          subtitle: RichText(
            text: TextSpan(
              text: "${favourite?.lisuDefinition} : ",
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: definitionColor),
              children:  <TextSpan>[
                TextSpan(text: favourite?.lisuDefinition??"", style: Theme.of(context) .textTheme
                    .caption!
                    .copyWith(color: Colors.white),),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:Get.width/2*0.1),


            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:favourite!.lisuExamples!.map((e) => Text(e,

                style:  Theme.of(context) .textTheme
                    .caption!
                    .copyWith(color: Colors.white70),
              )).toList(),
            ),
          ),
        ),

      ],
    );
  }
}
