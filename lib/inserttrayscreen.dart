import 'package:flutter/material.dart';
import 'package:flutter_ics_homescreen/Data/variables/variables.dart';
import 'package:flutter_ics_homescreen/screensize.dart';
import 'package:flutter_ics_homescreen/startAnalysisscreen.dart';
import 'package:flutter_ics_homescreen/tray1analysisscreen.dart';
import 'package:intl/intl.dart';


class InsertTrayscreen extends StatefulWidget {
  const InsertTrayscreen({super.key});

  @override
  State<InsertTrayscreen> createState() => _InsertTrayscreenState();
}

class _InsertTrayscreenState extends State<InsertTrayscreen> {
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
                    width: screenWidth*0.60 ,child: const Text("Knemetic solutions",style: TextStyle(fontSize:40,fontWeight:FontWeight.normal,color:Colors.white),)),
                SizedBox(

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
            const Spacer(flex: 2,),
            Container(
              height:screenHeight*.165,
              width: screenWidth*0.30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), // Adjust the value as needed
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Action for top camera view button
                },
                child:  Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.input_sharp,size:insertrayiconsize,),
                    const SizedBox(height: 10),
                    Text('Insert Tray to begin',style: textStyleForAllText ()),
                  ],
                ),
              ),
            ),
            const Spacer(),
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
                        Navigator.pushNamed(context, "Start Analysis Screen");
                      },
                      child: Text('Back ',style: textStyleForAllText ()),
                    ),
                  ),
                ),
                const SizedBox(width:10,),
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
                        Navigator.pushNamed(context, "Tray 1 Analysis Screen");
                      },
                      child: Text('Next ',style: textStyleForAllText ()),
                    ),
                  ),
                ),


              ],
            ),
            const Spacer(),
            SizedBox(


              width: screenWidth*.8,
              height: screenHeight*0.1,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.analytics_outlined,color: Colors.white,size: 50,),
                  Text('Insert filled Tray to start analysis .... ',style:textStyleBelowScreen ()),
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