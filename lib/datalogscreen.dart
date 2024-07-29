

































import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_ics_homescreen/screen1.dart';

import 'package:flutter_ics_homescreen/screensize.dart';
import 'package:flutter_ics_homescreen/viewdatalogscreen.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Data/variables/variables.dart';
import 'package:pdf/widgets.dart' as pw;
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
  String detectedusbdevice = 'No device detected';
  String filecopystatus='None';

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
        color: backgroundcolor,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: screenWidth * 0.15,
                  color: Colors.white,
                  child: Image.asset('asset/mylogo.png'),
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
                          const Icon(Icons.calendar_month_rounded, color: Colors.white, size: datetimeiconsize),
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
                                  onDoubleTap: () {
                                    setState(() {
                                      selectedAgenttoview = null;
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
                        height: screenHeight * .1,
                        width: screenWidth * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
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
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(buttoncolor),
                            ),
                            child: Text('View', style: textStyleForAllText()),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: screenHeight * .1,
                        width: screenWidth * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {});
                              _dialogBuilder(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(buttoncolor),
                            ),
                            child: Text('Print', style: textStyleForAllText()),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: screenHeight * .1,
                        width: screenWidth * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Action for email button
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(buttoncolor),
                            ),
                            child: Text('Email', style: textStyleForAllText()),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: screenHeight * .1,
                        width: screenWidth * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              deletePdf();
                              _deleteSelectedAgent();


                              setState(() {});
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(buttoncolor),
                            ),
                            child: Text('Delete', style: textStyleForAllText()),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: screenHeight * .1,
                        width: screenWidth * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
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
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(buttoncolor),
                            ),
                            child: Text('Home', style: textStyleForAllText()),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                  const SizedBox(width: 40)
                ],
              )
            else
              const SizedBox(height: 10, width: 10),
            const Spacer(),
            Container(
              decoration: BoxDecoration(border: Border.all(color: backgroundcolor)),
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

  Future<void> _dialogBuilder(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              backgroundColor: Colors.brown.shade50,
              title: const Text('copy file to USB '),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [


                    ElevatedButton(
                      onPressed: () async {
                        var usbdetection = await Process.run('lsblk', ['/dev/sda']);
                        setState(() {
                          detectedusbdevice = usbdetection.stdout.toString();
                        });
                      },
                      child: const Text('Check USB'),
                    ),


                    ElevatedButton(
                      onPressed: () async {
                        try{
                          var copytousb= await Process.run('cp',['/home/jai/Documents/local_flutter_apps/flutter_ics_homescreen/pdfs/${selectedAgenttoview?['name']}_Report.pdf' , '/media/jai/boot/mycopiedfiles']);

                        if(copytousb.exitCode==0)
                        {
                          print('file copied successfully');
                          setState(() {
                            filecopystatus = 'file copied successfully in USB';
                          });
                        }
                        else {
                          print('problem detected ${copytousb.stderr}');
                          setState(() {
                            filecopystatus = 'No such file or Directory';
                          });
                        }


                        }

                        catch(e){

                          print('err $e');
                        }



                       // Navigator.pop(context);
                      },
                      child:  const Text('Copy File'),
                    ),
                  ],
                ),
              ],
              content: Container(
                height: screenHeight * 0.20,
                width: screenWidth * 0.20,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.usb,color:Colors.blue,size:50,),
                        Text(detectedusbdevice),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Column(
                      children: [

                        Text(filecopystatus),
                        const Icon(Icons.file_copy_outlined,color:Colors.blue,size:50)
                      ],
                    )

                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }



  void deletePdf() async {
    // Check if the data list is empty, and if so, return early.
    if (_dataList.isEmpty) return;

    // Retrieve the name of the agent to view from the selectedAgenttoview map.
    final lastData = selectedAgenttoview?['name'];

    // If the agent's name is null or empty, return early.
    if (lastData == null || lastData.isEmpty) return;

    // Define the directory path where the PDFs are stored.
    final Directory appDocDirectory = Directory('/home/jai/Documents/local_flutter_apps/flutter_ics_homescreen');
    final Directory directory = Directory('${appDocDirectory.path}/pdfs');

    // Define the file path for the PDF to be deleted.
    final File file = File("${directory.path}/${lastData}_Report.pdf");

    // Check if the file exists before attempting to delete it.
    if (await file.exists()) {
      await file.delete();
    } else {
      print("File not found: ${file.path}");
    }
  }

}



