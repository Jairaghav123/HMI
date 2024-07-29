
import 'package:flutter/material.dart';



const double screen1iconsize=130 ;
const double insertrayiconsize=110 ;
const double startAnalysisscreenfontsize=20 ;
const double datetimeiconsize=50 ;
const double datetimefontsize=20;
const double textbelowscreen=25 ;
const double iconbelowscreen=50 ;
////////for usb



//////////////////////
Map<String, String>? selectedAgenttoview;
 Color buttoncolor=Colors.blue.withOpacity(0.6) ;
 Color backgroundcolor=Colors.blueGrey;

TextStyle  textStyleBelowScreen ()
{

  return
     const TextStyle(fontSize: 30,color:Colors.white);

}

TextStyle  textStyleForAllText ()
{

  return
    const TextStyle(fontSize: 32,color:Colors.black);

}


  String filename= 'null'  ;





TextStyle  settingscreentext ()
{

  return
    const TextStyle(fontSize: 28,color:Colors.black);

}




TextStyle  datetimefont ()
{

  return
    const TextStyle(fontSize: 28,color:Colors.white);

}