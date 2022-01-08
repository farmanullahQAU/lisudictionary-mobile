import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mm_dictionary/core/services/firestore_services.dart';
import 'package:mm_dictionary/favourite.dart';
import 'package:mm_dictionary/textStyles.dart';
import 'package:mm_dictionary/word_details/word_details_controller.dart';

import '../app_constants.dart';
import 'components/drawer.dart';
import 'components/textfield.dart';
import 'constants.dart';
import 'contribute/contribute.dart';
import 'word_details/details_page.dart';
import 'home_controller.dart';
import 'dart:ui' as ui;

import 'model/word.dart';
//
// class Word {
//   String? engName = "English";
//   String? burmerName = "Burmer";
//   String? lisuName = "Lisu";
//   String? lisuDefinition;
//   String? engDefinition;
//   String? burmerDefinition;
//   List<String>? engExamples;
//   List<String>? lisuExamples;
//
//   List<String>? burmerExamples;
//   String? word;
//
//   Word(
//       {this.engName,
//       this.burmerName,
//       this.lisuName,
//       this.engDefinition,
//       this.burmerDefinition,
//       this.engExamples,
//       this.burmerExamples,
//       this.lisuDefinition,
//       this.word,
//       this.lisuExamples});
// }


/*

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        bottomNavigationBar:  BottomNavigationBar(
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.cyan[600],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Favourite',
              backgroundColor: Colors.indigo[700],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Contribute',
              backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.pink,
            ),
          ],
          currentIndex: controller.selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap:(index)=> controller.onSelected(index),
        ),

        drawer: AppDrawer(),

          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          backgroundColor: AppConstants.backgroundColor,
          //   drawer: AppDrawer(),

          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(


                stretch: false,
                backgroundColor: AppConstants.backgroundColor,
                // actions: [
                //   Padding(
                //     padding: const EdgeInsets.only(right: 8.0),
                //     child: Icon(Icons.search,size: 40,),
                //   )
                // ],

                centerTitle: true,
                // leading: IconButton(
                //     icon: Icon(Icons.filter_1),
                //     onPressed: () {
                //       // Do something
                //     }
                // ),
                expandedHeight: Get.height * 0.2,
                floating: false,
                pinned: true,
                //  snap: true,
                elevation: 50,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.indigo.shade900, Colors.lightBlue],
                      ),
                    ),
                  ),

                  //    centerTitle: true,
                  title: Container(
                    height: 40,
                    width: Get.width * 0.9,
                    child: TxtField(
                      controller: controller.searchController,
                      onChanged: (val) {
                        controller.isSearched(true);
                      },
                      suffixIcon:
                          Icon(Icons.search, color: Colors.grey.shade400),
                      lblTxt: "Email",
                      hintTxt: "Enter Word to Search",
                      fillColor: Colors.white,
                    ),
                  ),
                  // background: Image.network(
                  //   'https://images.pexels.com/photos/443356/pexels-photo-443356.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                  //   fit: BoxFit.cover,
                  // )
                ),
              ),
              SliverToBoxAdapter(
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0))),
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height,
                child: ListView(
                    children: controller.searched == false
                        ? words!
                            .map(
                              (e) => Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Column(
                                    children: [
                                      Text(e.word!,
                                          style: TextStyles.wordStyle),
                                      ListTileView(
                                        onTap: ()=>Get.to(()=>DetailPage(language: e.engName,
                                          definition: e.engDefinition,
                                          examples:e.engExamples,
                                          word: e.word,

                                        ),
                                        transition: Transition.leftToRight
                                        ),
                                        languageName: e.engName,
                                        definition: e.engDefinition,
                                      ),
                                      ListTileView(
                                        onTap: ()=>Get.to(()=>DetailPage(language: e.burmerName,
                                          definition: e.burmerDefinition,
                                          examples:e.burmerExamples,
                                          word: e.word,


                                        ),

                                            transition: Transition.leftToRight
                                        ),
                                        languageName: e.burmerName,
                                        definition: e.burmerDefinition,


                                      ),
                                      ListTileView(
                                        onTap: ()=>Get.to(()=>DetailPage(language: e.lisuName,
                                          definition: e.lisuDefinition,
                                          examples:e.lisuExamples,
                                          word: e.word,

                                        ),
                                            transition: Transition.leftToRight
                                        ),
                                        languageName: e.lisuName,
                                        definition: e.lisuDefinition,
                                      )
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Colors.indigo.shade900,
                                        Colors.lightBlue
                                      ]),
                                    ),
                                    width: Get.width,
                                    height: 5,
                                  )
                                ],
                              ),
                            )
                            .toList()
                        : words!
                            .where((word) => word.word!.toLowerCase()!.contains(
                                controller.searchController!.text
                                    .toLowerCase()))
                            .map((e) => Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Column(
                                      children: [
                                        Text(e.word!,
                                            style: TextStyles.wordStyle),
                                        ListTileView(
                                          languageName: e.engName,
                                          definition: e.engDefinition,
                                        ),
                                        ListTileView(
                                          languageName: e.burmerName,
                                          definition: e.burmerDefinition,
                                        ),
                                        ListTileView(
                                          languageName: e.lisuName,
                                          definition: e.lisuDefinition,
                                        )
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Colors.indigo.shade900,
                                          Colors.lightBlue
                                        ]),
                                      ),
                                      width: Get.width,
                                      height: 3,
                                    )
                                  ],
                                ))
                            .toList()

                    ),
              ))
            ],
          )),
    );
  }
}

class ListTileView extends StatelessWidget {
  String? languageName;
  String? definition;
  VoidCallback? onTap;
  ListTileView({Key? key, this.languageName, this.definition, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListTile(
        onTap: this.onTap,
        trailing: Icon(Icons.arrow_forward_ios_outlined),
        subtitle: Text(this.definition!),
        title: Text(this.languageName!, style: TextStyles.expansionTitleStyle),
      ),
    );
  }
}
*/
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(

        appBar: AppBar(
     title:   Container(
        height: Get.width/3*0.3,
        width: Get.width,
        child: TxtField(
          controller: controller.searchController,
          onChanged: (val) {
            controller.isSearched(true);
          },
        )


        )),
          bottomNavigationBar:  BottomNavigationBar(
            items:  <BottomNavigationBarItem>[
              BottomNavigationBarItem(

                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favourite',
              ),


            ],
            currentIndex: controller.selectedIndex.value,
            onTap:(index)=> controller.onSelected(index),
          ),

          drawer: AppDrawer(),

          // floatingActionButton:controller.selectedIndex.value==2?Container(): FloatingActionButton(
          //   onPressed: () {
          //
          //    Get.to(()=>DictionarForm());
          //   },
          //   child: Icon(Icons.add),
          // ),



          //   drawer: AppDrawer(),

          body:controller.selectedIndex.value!=0?
          //
          // IndexedStack(
          //
          //
          //   index: controller.selectedIndex.value,
          //   children: [
          //     Home(),
          // Favourite(),
          //     DictionarForm(),
          //
          //   ],
          //
          // )

         controller.myTabas.elementAt(controller.selectedIndex.value)
              :
          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: Container(

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0))),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child:

                    controller.searched.value==true&&controller.allWords!=null?
               ListView(children:
                   controller.allWords!


                       .where((word) => word.word!.toLowerCase().contains(
                controller.searchController!.text
                    .toLowerCase()))
              .map((e) => Column(
            children: [
              // Text(e.word!,
              //     style: TextStyles.wordStyle),
              ListTileView(
                word: e.word,

                onTap: (){
                  Get.find<WordDetailsController>().setWord(e);
                  print("dkkdkdkdkdkdkdkdk");
print(                  Get.find<WordDetailsController>().currentWord?.value.lisuDefinition);
                  Get.to(()=>DetailPage(


                    word: e,



                  ),
                    transition: Transition.leftToRight,
                  );

                },
                languageName:e.word,
                definition: e.engDefinition,
              ),

            ],
          ))
              .toList()
                 ,):

                FutureBuilder(
                  future:


                  Get.find<FirestoreService>().getWords(),

                  builder: (BuildContext context, AsyncSnapshot<List<Word>> snapshot) {

                    if(snapshot.hasData)
                    {
                      controller.intWords(snapshot.data);
                      return   SizedBox(
                          width: double.infinity,
                          child:
                          ListView(
                              children:
                              // controller.searched == false
                              //     ?

                              snapshot.data!
                                  .map(
                                    (e) => ListTileView(
                                  word: e.word,
                                      onTap: (){
                                        Get.find<WordDetailsController>().setWord(e);
                                        print("dkkdkdkdkdkdkdkdk");
                                        print(                  Get.find<WordDetailsController>().currentWord?.value.lisuDefinition);
                                        Get.to(()=>DetailPage(


                                          word: e,



                                        ),
                                          transition: Transition.leftToRight,
                                        );

                                      },

                                  languageName: e.word,
                                  definition: e.engDefinition,
                                ),
                              )
                                  .toList()
                            /*
                                        : words!
                                        .where((word) => word.word!.toLowerCase()!.contains(
                                        controller.searchController!.text
                                            .toLowerCase()))
                                        .map((e) => Column(
                                          children: [
                                            // Text(e.word!,
                                            //     style: TextStyles.wordStyle),
                                            ListTileView(
                                              word: e.word,

                                              onTap: ()=>Get.to(()=>DetailPage(
                                                word: e,

                                              ),
                                                  transition: Transition.leftToRight
                                              ),
                                              languageName: e.engName,
                                              definition: e.engDefinition,
                                            ),

                                          ],
                                        ))
                                        .toList()

                                        */

                          )
                      );

                    }
                    if(!snapshot.hasData)
                    {


                      return  AlertDialog(
                        content: Lottie.asset("assets/lottie/loader.json",width: Get.width*0.2,height: Get.width*0.1),
                        elevation: 0.0,
                        backgroundColor: bgColor,
                      );


                    }
                    return Center(child: const Text("Something went wrong"));
                  },)

              // ListView(
              //     children: controller.searched == false
              //         ? words!
              //         .map(
              //           (e) => Column(
              //             children: [
              //               // Text(e.word!,
              //               //     style: TextStyles.wordStyle),
              //               ListTileView(
              //                 word: e.word,
              //
              //                 onTap: ()=>Get.to(()=>DetailPage(
              //                   word: e,
              //
              //                 ),
              //                     transition: Transition.leftToRight
              //                 ),
              //                 languageName: e.engName,
              //                 definition: e.engDefinition,
              //               ),
              //
              //             ],
              //           ),
              //     )
              //         .toList()
              //         : words!
              //         .where((word) => word.word!.toLowerCase()!.contains(
              //         controller.searchController!.text
              //             .toLowerCase()))
              //         .map((e) => Column(
              //           children: [
              //             // Text(e.word!,
              //             //     style: TextStyles.wordStyle),
              //             ListTileView(
              //               word: e.word,
              //
              //               onTap: ()=>Get.to(()=>DetailPage(
              //                 word: e,
              //
              //               ),
              //                   transition: Transition.leftToRight
              //               ),
              //               languageName: e.engName,
              //               definition: e.engDefinition,
              //             ),
              //
              //           ],
              //         ))
              //         .toList()
              //
              // ),
            ),
          )

/*
          SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(



                  stretch: true,
                  // actions: [
                  //   Padding(
                  //     padding: const EdgeInsets.only(right: 8.0),
                  //     child: Icon(Icons.search,size: 40,),
                  //   )
                  // ],

                  centerTitle: true,
                  // leading: IconButton(
                  //     icon: Icon(Icons.filter_1),
                  //     onPressed: () {
                  //       // Do something
                  //     }
                  // ),
                  expandedHeight: Get.height * 0.2,
                  floating: false,
                  pinned: true,
                  //  snap: true,
                  elevation: 50,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    // background: Container(
                    //   // decoration: BoxDecoration(
                    //   //   gradient: LinearGradient(
                    //   //     colors: [Colors.cyan.shade900, Colors.lightBlue],
                    //   //   ),
                    //   // ),
                    // ),

                    //    centerTitle: true,
                    title: Container(
                      height: Get.width/3*0.2,
                      width: Get.width * 0.6,
                      child: TxtField(
                        controller: controller.searchController,
                        onChanged: (val) {
                          controller.isSearched(true);
                        },
                        suffixIcon:
                        Icon(Icons.search),
                        lblTxt: "Email",
                      ),
                    ),
                    // background: Image.network(
                    //   'https://images.pexels.com/photos/443356/pexels-photo-443356.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                    //   fit: BoxFit.cover,
                    // )
                  ),
                ),
                SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top:20.0),
                      child: Container(

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0))),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.6,
                        child:
                        FutureBuilder(
                          future:


                          Get.find<FirestoreService>().getWords(),

                          builder: (BuildContext context, AsyncSnapshot<List<Word>> snapshot) {

                            if(snapshot.hasData)
                            {
controller.intWords(snapshot.data);
                              return   SizedBox(
                                width: double.infinity,
                                child:
                                ListView(
                                    children:
                                    // controller.searched == false
                                    //     ?

                                    snapshot.data!
                                        .map(
                                          (e) => ListTileView(
                                            word: e.word,

                                            onTap: ()=>Get.to(()=>DetailPage(
                                              word: e,

                                            ),
                                                transition: Transition.leftToRight
                                            ),
                                            languageName: e.word,
                                            definition: e.engDefinition,
                                          ),
                                    )
                                        .toList()
                                     /*
                                        : words!
                                        .where((word) => word.word!.toLowerCase()!.contains(
                                        controller.searchController!.text
                                            .toLowerCase()))
                                        .map((e) => Column(
                                          children: [
                                            // Text(e.word!,
                                            //     style: TextStyles.wordStyle),
                                            ListTileView(
                                              word: e.word,

                                              onTap: ()=>Get.to(()=>DetailPage(
                                                word: e,

                                              ),
                                                  transition: Transition.leftToRight
                                              ),
                                              languageName: e.engName,
                                              definition: e.engDefinition,
                                            ),

                                          ],
                                        ))
                                        .toList()

                                        */

                                )
                              );

                            }
                            if(!snapshot.hasData)
                            {


                              return  AlertDialog(
                                content: Lottie.asset("assets/lottie/loader.json",width: Get.width*0.1,height: Get.width*0.1),
                                elevation: 0.0,
                                backgroundColor: secondaryColor,
                              );


                            }
                            return Center(child: const Text("Something went wrong"));
                          },)

                        // ListView(
                        //     children: controller.searched == false
                        //         ? words!
                        //         .map(
                        //           (e) => Column(
                        //             children: [
                        //               // Text(e.word!,
                        //               //     style: TextStyles.wordStyle),
                        //               ListTileView(
                        //                 word: e.word,
                        //
                        //                 onTap: ()=>Get.to(()=>DetailPage(
                        //                   word: e,
                        //
                        //                 ),
                        //                     transition: Transition.leftToRight
                        //                 ),
                        //                 languageName: e.engName,
                        //                 definition: e.engDefinition,
                        //               ),
                        //
                        //             ],
                        //           ),
                        //     )
                        //         .toList()
                        //         : words!
                        //         .where((word) => word.word!.toLowerCase()!.contains(
                        //         controller.searchController!.text
                        //             .toLowerCase()))
                        //         .map((e) => Column(
                        //           children: [
                        //             // Text(e.word!,
                        //             //     style: TextStyles.wordStyle),
                        //             ListTileView(
                        //               word: e.word,
                        //
                        //               onTap: ()=>Get.to(()=>DetailPage(
                        //                 word: e,
                        //
                        //               ),
                        //                   transition: Transition.leftToRight
                        //               ),
                        //               languageName: e.engName,
                        //               definition: e.engDefinition,
                        //             ),
                        //
                        //           ],
                        //         ))
                        //         .toList()
                        //
                        // ),
                      ),
                    ))
              ],
            ),
          )),
      */
      )
    );
  }
}

class ListTileView extends StatelessWidget {
  String? languageName;
  String? word;
  String? definition;
  VoidCallback? onTap;
  ListTileView({Key? key, this.languageName, this.definition, this.onTap,this.word})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Card(
    //   child: ListTile(
    //     onTap: this.onTap,
    //     trailing: Icon(Icons.arrow_forward_ios_outlined),
    //     subtitle: Text(this.definition!),
    //     title: Text(this.languageName!, style: TextStyles.expansionTitleStyle),
    //   ),
    // );
    return Card(
        elevation: 5.0,
        margin: new EdgeInsets.only(left: Get.width/4*0.1, right:Get.width/4*0.1,bottom: 6.0),
    child: Container(

  //  decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),

      decoration: BoxDecoration(
color: secondaryColor,

          ),
      child: ListTile(

        onTap:onTap,

          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          // leading: Container(
          //   padding: EdgeInsets.only(right: 12.0),
          //   decoration: new BoxDecoration(
          //       border: new Border(
          //           right: new BorderSide(width: 1.0, color: Colors.white24))),
          //   child: Text(this.word??"",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          // ),
          title: Text(
            this.word??"",
          ),


          subtitle: Text(this.definition??"",style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.cyan),),
          trailing:
          Icon(Icons.arrow_forward_ios_outlined)),
    ));
  }
}