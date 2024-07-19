import 'package:flutter/material.dart';
import 'package:flutter_ics_homescreen/screensize.dart';

import 'Data/variables/variables.dart';
class ResultScreenWidget extends StatelessWidget {
  const ResultScreenWidget({
    super.key,
   required this.innertext, required this.percentagetext, required double screenWidth, required double screenHeight,
  });

  // final double screenwidth;
  // final double screenheight;
   final String innertext ;
  final String percentagetext ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: screenWidth*0.0156),//30
      child:


      Row(
        children: [
          Container(alignment:Alignment.center,color:Colors.blue ,width:screenWidth*0.25,height:screenHeight*0.05,child: Text(innertext,style:textStyleForAllText ()),),
           Text("          $percentagetext",style:textStyleForAllText ()),
        ],
      ),


    );
  }
}
