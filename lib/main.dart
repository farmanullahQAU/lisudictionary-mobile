import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages.dart';
import 'binder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
//
class MyApp extends StatelessWidget {


  Color primaryColor = Color(0xFF2697FF);
  Color secondaryColor = Color(0xFF2A2D3E);
  Color bgColor = Color(0xFF212332);

  double defaultPadding = 16.0;
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      //return LayoutBuilder
      builder: (context, constraints) {
        return OrientationBuilder(
          //return OrientationBuilder
          builder: (context, orientation) {
            //initialize SizerUtil()s
            return GetMaterialApp(

              theme: ThemeData.dark().copyWith(


              scaffoldBackgroundColor: bgColor,

                  textTheme:
                  GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white,
                    displayColor: Colors.white,


                  ),
            canvasColor: secondaryColor,
                appBarTheme:AppBarTheme(backgroundColor:
                secondaryColor.withGreen(44)

                )


            ),
              title: "Farman Ullah",
              initialBinding: Binder(),
              initialRoute: "/intro",
              smartManagement: SmartManagement.keepFactory,
              defaultTransition: Transition.fadeIn,
              debugShowCheckedModeBanner: false,
              getPages: pages,
            );
          },
        );
      },
    );
  }
}
