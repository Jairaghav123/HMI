import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_ics_homescreen/defectselectionscreen.dart';
import 'package:flutter_ics_homescreen/inserttrayscreen.dart';
import 'package:flutter_ics_homescreen/resultinjson.dart';
import 'package:flutter_ics_homescreen/resultscreen.dart';
import 'package:flutter_ics_homescreen/screen1.dart';
import 'package:flutter_ics_homescreen/screen2.dart';
import 'package:flutter_ics_homescreen/screen3.dart';
import 'package:flutter_ics_homescreen/screen4.dart';
import 'package:flutter_ics_homescreen/startAnalysisscreen.dart';
import 'package:flutter_ics_homescreen/topcamera_preview_screen.dart';
import 'package:flutter_ics_homescreen/tray1analysisscreen.dart';
import 'package:flutter_ics_homescreen/tray2alaysisscreen.dart';
import 'package:flutter_ics_homescreen/tray3analysisscreen.dart';
import 'package:flutter_ics_homescreen/viewdatalogscreen.dart';



import 'Data/savedata.dart';
import 'bootscreen.dart';
import 'bottomcamera_preview_screen.dart';
import 'datalogscreen.dart';

void main () async
{


  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return   MaterialApp(
      debugShowCheckedModeBanner:false,

      initialRoute: "/",
      routes: {
        "/" :  (context)=>const BootScreen(),
        "HomeScreen" :  (context)=>const Screen1(),
        "SettingsScreen" :  (context)=>const Screen2(),
        "Color and light settings-Top Screen" :  (context)=>const Screen3(),
        "Color and light settings-Bottom Screen" :  (context)=>const Screen4(),
        "Defect Selection Screen" :  (context)=>const defectselection(),
        "Top CAM preview Screen" :  (context)=>const TopCameraview(),
        "Bottom CAM preview Screen" :  (context)=>const BottomCameraview(),
        "Start Analysis Screen" :  (context)=>const StartAnalysis(),
        "Insert Tray pop up Screen" :  (context)=>const InsertTrayscreen(),
        "Tray 1 Analysis Screen" :  (context)=>const Tray1Analysis(),
        "Tray 2 Analysis Screen" :  (context)=>const Tray2Analysis(),
        "Tray 3 Analysis Screen" :  (context)=>const Tray3Analysis(),
        "Results Screen" :  (context)=>const ResultScreen(),
        "Data Log Screen" :  (context)=>const DataLogScreen(),
        "View Data Log  Screen" :  (context)=>const ViewDataLogScreen(),
        "testsaveddata" : (context)=>DataScreen(),
        "viewjsondata"  :(context)=> JsonDataWidget(),

      },


    );
  }
}
