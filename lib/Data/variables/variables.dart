
import 'package:flutter/material.dart';

// TextEditingController agentNameController=TextEditingController();
// final  TextEditingController agentAddressController=TextEditingController();
// final  TextEditingController lorryNumberController=TextEditingController();
// final  TextEditingController noofBagsController=TextEditingController();
// final  TextEditingController lotWeightController=TextEditingController();
// final  TextEditingController typeAndGradeController=TextEditingController();
// final  TextEditingController analysisSampleWeightController=TextEditingController();
// final  TextEditingController analysisSampleWeight2Controller=TextEditingController();
// final  TextEditingController lorrySampleWeightController=TextEditingController();
// final  TextEditingController moistureLevelController=TextEditingController();
// final  TextEditingController fileNameController=TextEditingController();
// TextEditingController? currentController;

const double screen1iconsize=130 ;
const double insertrayiconsize=110 ;
const double startAnalysisscreenfontsize=20 ;
const double datetimeiconsize=50 ;
const double datetimefontsize=20;
const double textbelowscreen=25 ;
const double iconbelowscreen=50 ;
Map<String, String>? selectedAgenttoview;


TextStyle  textStyleBelowScreen ()
{

  return
     const TextStyle(fontSize: 30,color:Colors.white);

}

TextStyle  textStyleForAllText ()
{

  return
    const TextStyle(fontSize: 33,color:Colors.black);

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