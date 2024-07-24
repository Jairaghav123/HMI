import 'package:flutter/material.dart';
import 'package:flutter_ics_homescreen/Data/variables/variables.dart';
import 'package:flutter_ics_homescreen/screensize.dart';
import 'package:intl/intl.dart';

import 'defectselectionscreenwidget.dart';


class Defectselection extends StatefulWidget {
  const Defectselection({super.key});

  @override
  State<Defectselection> createState() => _DefectselectionState();
}

class _DefectselectionState extends State<Defectselection> {
  @override

  Widget build(BuildContext context) {


    return Scaffold(

      body: Container(
        color:backgroundcolor,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: screenWidth*0.15,
                    color:Colors.white,
                    child: Image.asset('asset/mylogo.png')), // Replace 'assets/logo.png' with your logo
                //const SizedBox(width:250),
                Container(
                    alignment: Alignment.center,
                    width: screenWidth*0.60 ,child: const Text("Knemetic solutions",style: TextStyle(fontSize:40,fontWeight:FontWeight.normal,color:Colors.white),)),
                SizedBox(

                  width: screenWidth*0.15,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.calendar_month_rounded,color:Colors.white,size: datetimeiconsize,),
                          Text(DateFormat('EEEE dd MMM').format(DateTime.now()).toString(), style:datetimefont()),
                        ],
                      ),
                      Row(
                        children: [
                          Text( DateFormat('            HH:mm:ss').format(DateTime.now()).toString(), style: datetimefont()),
                        ],
                      ),
                    ],
                  ),

                ),
              ],
            ),



            const Spacer(),
             Row(
               mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
               children: [

                 //SizedBox(width: 100,),
                 Column(

                   children: [
                     defectselectioncolumn(screenwidth: screenWidth, screenheight: screenHeight, innertext: 'MC', firstvalue: true,),
                     const SizedBox(height: 20,),
                     defectselectioncolumn(screenwidth: screenWidth, screenheight: screenHeight, innertext: 'PB',firstvalue: true,),
                     const SizedBox(height: 20,),
                     defectselectioncolumn(screenwidth: screenWidth, screenheight: screenHeight, innertext: 'AAA',firstvalue: true,),
                     const SizedBox(height: 20,),
                     defectselectioncolumn(screenwidth: screenWidth, screenheight: screenHeight, innertext: 'AA',firstvalue: true,),
                     const SizedBox(height: 20,),
                     defectselectioncolumn(screenwidth: screenWidth, screenheight: screenHeight, innertext: 'A',firstvalue: true,),
                     const SizedBox(height: 20,),
                     defectselectioncolumn(screenwidth: screenWidth, screenheight: screenHeight, innertext: 'B',firstvalue: true,),
                   ],
                 ),

                 // const SizedBox(width:screenWidth*0.33,),
                 Column(
                   children: [
                     defectselectioncolumn(screenwidth: screenWidth, screenheight: screenHeight, innertext: 'C',firstvalue: true,),
                     const SizedBox(height: 20,),
                     defectselectioncolumn(screenwidth: screenWidth, screenheight: screenHeight, innertext: 'BB',firstvalue: true,),
                     const SizedBox(height: 20,),
                     defectselectioncolumn(screenwidth: screenWidth, screenheight: screenHeight, innertext: 'BL',firstvalue: true,),
                     const SizedBox(height: 20,),
                     defectselectioncolumn(screenwidth: screenWidth, screenheight: screenHeight, innertext: 'BERRY',firstvalue: true,),
                     const SizedBox(height: 20,),
                     defectselectioncolumn(screenwidth: screenWidth, screenheight: screenHeight, innertext: 'BITS',firstvalue: true,),
                     const SizedBox(height: 20,),
                     defectselectioncolumn(screenwidth: screenWidth, screenheight: screenHeight, innertext: 'HUSK/Stone',firstvalue: true,),
                   ],
                 )
               ],
             ),
             const SizedBox(height:20),
            Row(
              mainAxisAlignment:MainAxisAlignment.end,
              children: [

                Container(height:screenHeight*.1,
                    width: screenWidth*0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0), // Adjust the value as needed
                    ),child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(onPressed: (){

                  Navigator.pushNamed(context, "SettingsScreen");

                },style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(buttoncolor),
                      ), child: Text("Back",style: textStyleForAllText ()),),
                    ))
              ],
            ),
            const Spacer(),
             Row(
              children: [
                const SizedBox(width:screenWidth*0.10,height: screenHeight*0.10,),
                SizedBox(
                  width: screenWidth*.8,
                  height: screenHeight*0.06,
                  child:  Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.settings,size:50,color:Colors.blue,),
                      Text(' Settings ',style: textStyleBelowScreen ()),
                    ],
                  ),
                ),



              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}




