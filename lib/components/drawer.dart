import 'package:flutter/material.dart';
import 'package:mm_dictionary/constants.dart';

import '../../app_constants.dart';
import '../textStyles.dart';

class AppDrawer extends StatelessWidget {


  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Drawer(
      child: Container(

        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[

            DrawerHeader(
                margin: EdgeInsets.zero,

                decoration:BoxDecoration(color:bgColor,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 40,backgroundImage: AssetImage(AppConstants.profile),),

                    Text("lisu dictionary",style: TextStyles.headingText2.copyWith(color: Colors.white),),
                  ],
                )),

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,



              decoration: BoxDecoration(

                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                ),

              child: SingleChildScrollView(child: Column(children: [


                ListTile(
               //   leading: Image.asset(AppConstants.setting_icon,width: 50,height: 50),
                  title: Text('Settings'),

                ),
                ListTile(
              //    leading:Image.asset(AppConstants.privacy_icon,width: 50,height: 50),
                  title: Text('Privacy Policy'),

                ),
                ListTile(
                 // leading: Image.asset(AppConstants.about_icon,width: 50,height: 50),
                  title: Text('About'),

                ),
                ListTile(
                  //leading: Image.asset(AppConstants.faq_icon,width: 50,height: 50),
                  title: Text('FAQ'),

                ),


              ],),),
            ),


          ],
        ),
      ),
    );
  }
}

