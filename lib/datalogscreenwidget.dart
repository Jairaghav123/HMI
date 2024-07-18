import 'package:flutter/material.dart';

import 'Data/variables/variables.dart';
class DataLogScreenWidget extends StatelessWidget {
  const DataLogScreenWidget({
    super.key,
    required this.screenwidth,
    required this.screenheight, required this.innertext, required this.selectedcolor,
  });

  final double screenwidth;
  final double screenheight;
  final String innertext ;
  final Color selectedcolor ;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child:


      Row(
        children: [
          Container(alignment:Alignment.center,color:selectedcolor ,width:screenwidth*0.25,height:screenheight*0.05,child: Text(innertext,style: textStyleForAllText ()),),

        ],
      ),


    );
  }
}
