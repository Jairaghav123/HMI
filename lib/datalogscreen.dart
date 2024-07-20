import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ics_homescreen/resultscreenwidget.dart';
import 'package:flutter_ics_homescreen/screen1.dart';
import 'package:flutter_ics_homescreen/screen2.dart';
import 'package:flutter_ics_homescreen/screensize.dart';
import 'package:flutter_ics_homescreen/viewdatalogscreen.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'Data/variables/variables.dart';
import 'datalogscreenwidget.dart';

class DataLogScreen extends StatefulWidget {
  const DataLogScreen({super.key});

  @override
  State<DataLogScreen> createState() => _DataLogScreenState();
}

class _DataLogScreenState extends State<DataLogScreen> {
  Color? _selectedColor;
  double _value = 40.0;
  List<Map<String, String>> _dataList = [];

  @override
  void initState() {
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


  void _deleteSelectedAgent() async {
    if (selectedAgenttoview != null) {
      setState(() {
        _dataList.remove(selectedAgenttoview);
        selectedAgenttoview = null;
      });

      // Update SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> updatedData = _dataList.map((data) => jsonEncode(data)).toList();
      await prefs.setStringList('agents', updatedData);
    }
  }


  @override
  Widget build(BuildContext context) {


    bool isDataAvailable = _dataList.isNotEmpty;

    return Scaffold(
      body: Container(

        color: Colors.blueGrey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: screenWidth * 0.15,
                  color: Colors.white,
                  child: Image.asset('asset/mylogo.png'), // Replace 'assets/logo.png' with your logo
                ),
                Container(
                  alignment: Alignment.center,
                  width: screenWidth * 0.60,
                  child: const Text(
                    "Knemetic solutions",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal, color: Colors.white),
                  ),
                ),
                SizedBox(

                  width: screenWidth * 0.15,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.calendar_month_rounded, color: Colors.white,size: datetimeiconsize,),
                          Text(
                            DateFormat('EEEE dd MMM').format(DateTime.now()),
                            style: datetimefont(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            DateFormat('            HH:mm:ss').format(DateTime.now()),
                            style: datetimefont(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            if (isDataAvailable)
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: screenHeight * 0.45,
                      child: ListView.builder(
                        itemCount: _dataList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    selectedAgenttoview = _dataList[index];
                                    setState(() {
                                      _selectedColor = Colors.red;
                                    });
                                  },


                                  onDoubleTap: (){
                                    setState(() {
                                      selectedAgenttoview = null;
                                      ;
                                    });
                                  },
                                  child: DataLogScreenWidget(
                                    screenwidth: screenWidth,
                                    screenheight: screenHeight,
                                    innertext: _dataList[index]['name'] ?? "null",
                                    selectedcolor: _dataList[index] == selectedAgenttoview ? Colors.greenAccent : Colors.blue,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: DataLogScreenWidget(
                                    screenwidth: screenWidth,
                                    screenheight: screenHeight,
                                    innertext: _dataList[index]['AnalysisDate'] ?? "null",
                                    selectedcolor: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: screenWidth * 0.02),
                  const SizedBox(width: 20),
                  const SizedBox(width: 250),
                  Column(
                    children: [
                      Container(
                        height:screenHeight*.1,
                        width: screenWidth*0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (BuildContext context) => const ViewDataLogScreen()),
                              );
                            },
                            child: Text('View', style: textStyleForAllText()),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height:screenHeight*.1,
                        width: screenWidth*0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Action for print button
                            },
                            child: Text('Print', style: textStyleForAllText()),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height:screenHeight*.1,
                        width: screenWidth*0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Action for email button

                            },
                            child: Text('Email', style: textStyleForAllText()),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height:screenHeight*.1,
                        width: screenWidth*0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (BuildContext context) => const Screen2()),
                              // );

                              _deleteSelectedAgent() ;
                              setState(() {

                              });

                            },
                            child: Text('Delete', style: textStyleForAllText()),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height:screenHeight*.1,
                        width: screenWidth*0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (BuildContext context) => const Screen1()),
                              );
                            },
                            child: Text('Home', style: textStyleForAllText()),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                  const SizedBox(width: 40,)
                ],
              )
            else
              const SizedBox(height: 10, width: 10),
            const Spacer(),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey)),
              width: screenWidth * .8,
              height: screenHeight * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.analytics_outlined, color: Colors.white, size: 50),
                  Text('Stored Analysis Data', style: textStyleBelowScreen()),
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
















