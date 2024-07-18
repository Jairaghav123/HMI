import 'package:flutter/material.dart';
import 'package:flutter_homescreen/screen1.dart';
import 'package:flutter_homescreen/screen3.dart';
import 'package:flutter_homescreen/screen4.dart';
import 'package:flutter_homescreen/screensize.dart';
import 'package:intl/intl.dart';

import 'Data/variables/variables.dart';
import 'defectselectionscreen.dart';


class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override

  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        color:Colors.blueGrey,
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
                    width: screenWidth*0.60 ,child: const Text("Knemetic solutions",style: TextStyle(fontSize:40,fontWeight:FontWeight.normal,color:Colors.white),)),Container(

                  width: screenWidth*0.15,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.calendar_month_rounded,color:Colors.white,size: datetimeiconsize,),
                          Text(DateFormat('EEEE dd MMM').format(DateTime.now()).toString(), style: datetimefont()),
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
            const Spacer(flex:2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex:1),
                Container(
                  height:screenHeight*.18,
                  width: screenWidth*0.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40), // Adjust the value as needed
                  ),
                  child: ElevatedButton(
                    onPressed: () {

                      Navigator.pushNamed(context, "Color and light settings-Top Screen",);
                      // Action for top camera view button
                    },
                    child:  Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.camera,size:80,),
                        Text('Top camera and',style: settingscreentext ()),
                        Text('Light settings',style: settingscreentext ()),
                      ],
                    ),
                  ),
                ),

                const Spacer(flex:1),
                Container(
                  height:screenHeight*.18,
                  width: screenWidth*0.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40), // Adjust the value as needed
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Action for top camera view button
                      Navigator.pushNamed(context,  "Color and light settings-Bottom Screen",);
                    },
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.camera_alt,size:80,),
                        Text('Bottom camera and ',style: settingscreentext ()),
                        Text('Light settings',style: settingscreentext ()),
                      ],
                    ),
                  ),
                ),
                const Spacer(flex:1),
                Container(
                  height:screenHeight*.18,
                  width: screenWidth*0.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40), // Adjust the value as needed
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Action for top camera view button
                      Navigator.pushNamed(context, "Defect Selection Screen");
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.report_problem_outlined,size:80,),
                        Text('Defect selection setting',style: settingscreentext ()),
                        const SizedBox(height: 28,)
                      ],
                    ),
                  ),
                ),
                const Spacer(flex:1),
                Container(
                  height:screenHeight*.18,
                  width: screenWidth*0.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40), // Adjust the value as needed
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Action for top camera view button
                     // Navigator.pushNamed(context, "Defect Selection Screen");
                    },
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.person,size:80,),
                        Text('Customer info',style: settingscreentext ()),
                        const SizedBox(height: 28,)
                      ],
                    ),
                  ),
                ),
                const Spacer(flex:1),
              ],
            ),


            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height:screenHeight*.1,
                  width: screenWidth*0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // Adjust the value as needed
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(

                      onPressed: () {
                        // Action for top camera view button
                        Navigator.pushNamed(context, "HomeScreen");
                      },
                      child:  Text('Back ',style: textStyleForAllText ()),
                    ),
                  ),
                ),
                const SizedBox(width: 120,)


              ],
            ),
            const Spacer(),
             SizedBox(
              width: screenWidth*.8,
              height: screenHeight*0.06,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.settings,size:50,color:Colors.blue,),
                  Text(' Settings ',style: textStyleBelowScreen ()),
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