import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ics_homescreen/Data/variables/variables.dart';
import 'package:flutter_ics_homescreen/screensize.dart';
import 'package:intl/intl.dart';


class Tray1Analysis extends StatefulWidget {
  const Tray1Analysis({super.key});

  @override
  State<Tray1Analysis> createState() => _Tray1AnalysisState();
}

class _Tray1AnalysisState extends State<Tray1Analysis> {
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
                          const Icon(Icons.calendar_month_rounded,color:Colors.white,size:datetimeiconsize,),
                          Text(DateFormat('EEEE dd MMM').format(DateTime.now()).toString(), style:datetimefont()),
                        ],
                      ),
                      Row(
                        children: [
                          Text( DateFormat('            HH:mm:ss').format(DateTime.now()).toString(), style:datetimefont()),
                        ],
                      ),
                    ],
                  ),

                ),
              ],
            ),
            const SizedBox(height:100),
            Container(
              height:screenHeight*.3,
              width: screenWidth*0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), // Adjust the value as needed
              ),
              child:  Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Container(width:screenWidth*0.8,height:screenHeight*0.07, decoration: BoxDecoration(
                    color:Colors.blue,
                    borderRadius: BorderRadius.circular(10), // Adjust the value as needed
                  ),),
                  const SizedBox(height:10,),
                   Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Text('0%',style:textStyleForAllText ()),
                      Text('100%',style: textStyleForAllText ()),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  //alignment: Alignment.center,
                  height:screenHeight*.1,
                  width: screenWidth*0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0), // Adjust the value as needed
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Action for top camera view button
                      },style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(buttoncolor),
                    ),
                      child: Text('Restart Tray 1',style:textStyleForAllText ()),
                    ),
                  ),
                ),
                const SizedBox(width:10,height:50,),

                Container(
                 // alignment: Alignment.center,
                  height:screenHeight*.1,
                  width: screenWidth*0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0), // Adjust the value as needed
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(


                      onPressed: () async {
                        // Action for top camera view button


                        var process = await Process.start('bash', ['asset/Deliverable_1_Prediction_Shell_Script/Yolov8_Inference_Shell.sh']);
                        // print(process.stdout);
                        // var process=await Process.start('python3',['assets/myfile.py']);
                        process.stdout.transform(SystemEncoding().decoder).forEach(print);

                        process.stderr.transform(SystemEncoding().decoder).forEach(print);

                        await process.exitCode;
                        Future.delayed(Duration(seconds: 5));
                        Navigator.pushNamed(context, "Tray 2 Analysis Screen" );
                      },style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(buttoncolor),
                    ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Insert Tray 2',style:textStyleForAllText ()),
                          Text('Next',style:textStyleForAllText ()),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width:10,),
                Container(
                  //alignment: Alignment.center,
                  height:screenHeight*.1,
                  width: screenWidth*0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0), // Adjust the value as needed
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Action for top camera view button

                        Navigator.pushNamed(context,"Insert Tray pop up Screen");
                      },style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(buttoncolor),
                    ),
                      child:  Text('Back ',style:textStyleForAllText ()),
                    ),
                  ),
                ),
                const SizedBox(width: 151,)

              ],
            ),
            const Spacer(),
             SizedBox(
              width: screenWidth*.8,
              height: screenHeight*0.1,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.analytics_outlined,color: Colors.white,size: iconbelowscreen,),
                  Text('Tray 1 Analysis in progress please wait ',style:textStyleBelowScreen(),),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}