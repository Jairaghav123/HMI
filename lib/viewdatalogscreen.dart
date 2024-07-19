import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ics_homescreen/Data/app_data.dart';
import 'package:flutter_ics_homescreen/Data/variables/variables.dart';
import 'package:flutter_ics_homescreen/resultscreenwidget.dart';
import 'package:flutter_ics_homescreen/screen1.dart';
import 'package:flutter_ics_homescreen/screensize.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ViewDataLogScreen extends StatefulWidget {
  const ViewDataLogScreen({super.key});




  @override
  State<ViewDataLogScreen> createState() => _ViewDataLogScreenState();
}

class _ViewDataLogScreenState extends State<ViewDataLogScreen> {
  List<Map<String, String>> _dataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();

  }

  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> agentData = prefs.getStringList('agents') ?? [];

    setState(() {
      _dataList = agentData.map((data) => Map<String, String>.from(jsonDecode(data))).toList();
    });
  }

  Widget build(BuildContext context) {
    bool isDataAvailable = _dataList.isNotEmpty;
    return Scaffold(

      body: Container(
        height: screenHeight,
        width: screenWidth,
        color:Colors.blueGrey,
        child: Column(
          children: [
            const SizedBox(height: screenHeight*0.0185),  //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: screenWidth*0.15,
                    color:Colors.white,
                    child: Image.asset('asset/mylogo.png')), // Replace 'assets/logo.png' with your logo
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
            const SizedBox(height: screenHeight*0.0462),//50
            if (isDataAvailable)
            Row(

              children: [
                const SizedBox(width:30,),
                Container(alignment:Alignment.center,
                  width:screenWidth*0.30,height:screenHeight*.05,color:Colors.blue,child: Text( selectedAgenttoview?['name'] ?? "null",style:textStyleForAllText ()),
                ),
                const SizedBox(width:screenWidth*0.05,),
                Container(alignment:Alignment.center,
                  width:screenWidth*0.30,height:screenHeight*.05,color:Colors.blue,child: Text(selectedAgenttoview?['AnalysisDate'] ?? "null",style: textStyleForAllText ()),
                )
              ],
            )

           else
           Container(
           alignment: Alignment.center,
           width: screenWidth,
           height: screenHeight * .05,
           color: Colors.blue,
             child: Text(
                 'No data available',
            style: textStyleForAllText(),
                                     ),
                ),
            const SizedBox(height:screenHeight*0.037,), //40
            if (isDataAvailable)
            Row(
              children: [
                  Column(children: [
                  ResultScreenWidget(screenWidth: screenWidth, screenHeight: screenHeight, innertext: "MOISTURE", percentagetext: selectedAgenttoview?['MC'] ?? "null"),
                  const SizedBox(height: screenHeight*0.00925),
                  ResultScreenWidget(screenWidth: screenWidth, screenHeight: screenHeight, innertext: "PEA BERRY", percentagetext: selectedAgenttoview?['PB'] ?? "null"),
                  const SizedBox(height: screenHeight*0.00925),
                  ResultScreenWidget(screenWidth: screenWidth, screenHeight: screenHeight, innertext: "SIZE-AAA", percentagetext: selectedAgenttoview?['AAA'] ?? "null"),
                  const SizedBox(height: screenHeight*0.00925),
                  ResultScreenWidget(screenWidth: screenWidth, screenHeight: screenHeight, innertext: "SIZE-AA", percentagetext: selectedAgenttoview?['AA'] ?? "null"),
                  const SizedBox(height: screenHeight*0.00925),
                  ResultScreenWidget(screenWidth: screenWidth, screenHeight: screenHeight, innertext: "SIZE-A", percentagetext: selectedAgenttoview?['A'] ?? "null"),
                  const SizedBox(height: screenHeight*0.00925),
                  ResultScreenWidget(screenWidth: screenWidth, screenHeight: screenHeight, innertext: "SIZE-B", percentagetext: selectedAgenttoview?['B'] ?? "null"),
                  const SizedBox(height: screenHeight*0.00925),

                ],),


                const SizedBox(width:screenWidth*0.12,),
                 Column(children: [
                  ResultScreenWidget(screenWidth: screenWidth, screenHeight: screenHeight, innertext: "SIZE-C", percentagetext: selectedAgenttoview?['C'] ?? "null"),
                  const SizedBox(height: screenHeight*0.00925),
                  ResultScreenWidget(screenWidth: screenWidth, screenHeight: screenHeight, innertext: "BLACK BROWN", percentagetext:selectedAgenttoview?['BB'] ?? "null"),
                  const SizedBox(height: screenHeight*0.00925),
                  ResultScreenWidget(screenWidth: screenWidth, screenHeight: screenHeight, innertext: "BLEACHES", percentagetext: selectedAgenttoview?['BL'] ?? "null"),
                  const SizedBox(height: screenHeight*0.00925),
                  ResultScreenWidget(screenWidth: screenWidth, screenHeight: screenHeight, innertext: "BERRY BORES", percentagetext: selectedAgenttoview?['BERRY'] ?? "null"),
                  const SizedBox(height: screenHeight*0.00925),
                  ResultScreenWidget(screenWidth: screenWidth, screenHeight: screenHeight, innertext: "BITS & BROKEN", percentagetext: selectedAgenttoview?['BITS'] ?? "null"),
                  const SizedBox(height: screenHeight*0.00925),
                  ResultScreenWidget(screenWidth: screenWidth, screenHeight: screenHeight, innertext: "HUSK/STONE", percentagetext:selectedAgenttoview?['HUSK/Stone'] ?? "null"),
                  const SizedBox(height: screenHeight*0.00925,),



                ],),


                const SizedBox(width:50),

                Column(children: [
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
                        },
                        child: Text('Save',style:textStyleForAllText ()),
                      ),
                    ),
                  ),


                  const SizedBox(height: screenHeight*0.037),




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
                        },
                        child:  Text('Print ',style:textStyleForAllText ()
                            ),
                      ),
                    ),
                  ),



                  const SizedBox(height: screenHeight*0.037,),//
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
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>const Screen1()));
                        },
                        child:  Text('Home ',style:textStyleForAllText ()
                            ),
                      ),
                    ),
                  ),


                  const SizedBox(height: screenHeight*0.0185,), //20

                ],),
              ],
            )

            else
            Container(
            alignment: Alignment.center,
            width: screenWidth,
            height: screenHeight * .1,
            child: Text(
            'No data available to display results.',
            style: textStyleForAllText(),
             ),
             ),
            const Spacer(),
            SizedBox(

              width: screenWidth*.8,
              height: screenHeight*0.1,
              child:    Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.dataset,color: Colors.white,size:iconbelowscreen),
                  Text('Stored data ',style:textStyleBelowScreen ()),
                ],
              ),
            ),
            const SizedBox(height: screenHeight*0.0185), //20
          ],
        ),
      ),
    );
  }


}