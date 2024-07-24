import 'package:flutter/material.dart';
import 'package:flutter_ics_homescreen/screen1.dart';
import 'package:flutter_ics_homescreen/screensize.dart';

import 'Data/variables/variables.dart';

class TopCameraview extends StatefulWidget {
  const TopCameraview({super.key});

  @override
  State<TopCameraview> createState() => _TopCameraviewState();
}

class _TopCameraviewState extends State<TopCameraview> {
  @override

  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        color:backgroundcolor,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: screenHeight*0.7,
              width: screenWidth*0.8,
              alignment: Alignment.center,
              decoration:const BoxDecoration(
                color:Colors.blue,
                borderRadius:BorderRadius.all(Radius.circular(30)),

              ),
              child:const Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt,color:Colors.white,size:150,),
                  Text("Top CAM image",style:TextStyle(color:Colors.white,fontSize:33,fontWeight:FontWeight.w500),),
                ],
              ),
            ),




            const Spacer(),

            Row(
              mainAxisAlignment:MainAxisAlignment.start,
              children: [
                const SizedBox(width:screenWidth*0.41),
                Container(
                 // alignment: Alignment.center,
                  height:screenHeight*.1,
                  width: screenWidth*0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0), // Adjust the value as needed
                  ),
                  child:   Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Action for top camera view button
                        //Navigator.pushNamed(context, "Start Analysis Screen");
                      },style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(buttoncolor),
                    ),
                      child: Text('Capture ',style: textStyleForAllText ()),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 320.0),
                  child: Container(height:screenHeight*.1,
                      width: screenWidth*0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0), // Adjust the value as needed
                      ),child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>const Screen1()));
                  }, style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(buttoncolor),
                        ),
                            child: Text("Back",style:textStyleForAllText())),
                      )),
                )
              ],
            ),
            const Spacer(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}




