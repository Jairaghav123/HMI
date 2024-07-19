






import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ics_homescreen/Data/variables/variables.dart';
import 'package:flutter_ics_homescreen/resultscreenwidget.dart';
import 'package:flutter_ics_homescreen/screen1.dart';
import 'package:flutter_ics_homescreen/screensize.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';


class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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
      _dataList =
          agentData.map((data) => Map<String, String>.from(jsonDecode(data)))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDataAvailable = _dataList.isNotEmpty;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
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
                    child: Image.asset('asset/mylogo.png')),
                // Replace 'assets/logo.png' with your logo
                Container(
                  alignment: Alignment.center,
                  width: screenWidth * 0.60,
                  child: const Text(
                    "Knemetic solutions",
                    style: TextStyle(fontSize: 40,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ),
                SizedBox(

                  width: screenWidth * 0.15,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.calendar_month_rounded,
                              color: Colors.white,size:datetimeiconsize,),
                          Text(
                            DateFormat('EEEE dd MMM')
                                .format(DateTime.now())
                                .toString(),
                            style: datetimefont(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            DateFormat('            HH:mm:ss').format(
                                DateTime.now()).toString(),
                            style: datetimefont(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            if (isDataAvailable)
              Row(
                children: [
                  const SizedBox(width: 30),
                  Container(
                    alignment: Alignment.center,
                    width: screenWidth * 0.30,
                    height: screenHeight * .05,
                    color: Colors.blue,
                    child: Text(
                      _dataList[_dataList.length - 1]['name'] ?? "null",
                      style: textStyleForAllText(),
                    ),
                  ),
                  const SizedBox(width: screenWidth * 0.05),
                  Container(
                    alignment: Alignment.center,
                    width: screenWidth * 0.30,
                    height: screenHeight * .05,
                    color: Colors.blue,
                    child: Text(
                      _dataList[_dataList.length - 1]['AnalysisDate'] ?? "null",
                      style: textStyleForAllText(),
                    ),
                  ),
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
            const SizedBox(height: 40),
            if (isDataAvailable)
              Row(
                children: [
                  Column(
                    children: [
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "MOISTURE",
                          percentagetext: _dataList[_dataList.length -
                              1]['MC'] ?? "null"),
                      const SizedBox(height: 10),
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "PEA BERRY",
                          percentagetext: _dataList[_dataList.length -
                              1]['PB'] ?? "null"),
                      const SizedBox(height: 10),
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "SIZE-AAA",
                          percentagetext: _dataList[_dataList.length -
                              1]['AAA'] ?? "null"),
                      const SizedBox(height: 10),
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "SIZE-AA",
                          percentagetext: _dataList[_dataList.length -
                              1]['AA'] ?? "null"),
                      const SizedBox(height: 10),
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "SIZE-A",
                          percentagetext: _dataList[_dataList.length -
                              1]['A'] ?? "null"),
                      const SizedBox(height: 10),
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "SIZE-B",
                          percentagetext: _dataList[_dataList.length -
                              1]['B'] ?? "null"),
                      const SizedBox(height: 10),
                    ],
                  ),
                  const SizedBox(width: screenWidth * 0.10),
                  Column(
                    children: [
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "SIZE-C",
                          percentagetext: _dataList[_dataList.length -
                              1]['C'] ?? "null"),
                      const SizedBox(height: 10),
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "BLACK & BROWN",
                          percentagetext: _dataList[_dataList.length -
                              1]['BB'] ?? "null"),
                      const SizedBox(height: 10),
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "BLEACHES",
                          percentagetext: _dataList[_dataList.length -
                              1]['BL'] ?? "null"),
                      const SizedBox(height: 10),
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "BERRY BORES",
                          percentagetext: _dataList[_dataList.length -
                              1]['BERRY'] ?? "null"),
                      const SizedBox(height: 10),
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "BITS & BROKEN",
                          percentagetext: _dataList[_dataList.length -
                              1]['BITS'] ?? "null"),
                      const SizedBox(height: 10),
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "HUSK/Stone",
                          percentagetext: _dataList[_dataList.length -
                              1]['HUSK/Stone'] ?? "null"),
                      const SizedBox(height: 10),
                    ],
                  ),
                  const SizedBox(width: 50),
                  Column(
                    children: [
                      Container(
                        // height: screenHeight * .06,
                        // width: screenWidth * 0.10,

                        height:screenHeight*.1,
                        width: screenWidth*0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              20), // Adjust the value as needed
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Action for save button

                              saveAsPdf();
                              setState(() {

                              });
                            },
                            child: Text('Save', style: textStyleForAllText()),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        // height: screenHeight * .06,
                        // width: screenWidth * 0.10,
                        height:screenHeight*.1,
                        width: screenWidth*0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              20), // Adjust the value as needed
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Action for discard button
                            },
                            child: Text('Discard', style: textStyleForAllText()),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        // height: screenHeight * .06,
                        // width: screenWidth * 0.10,
                        height:screenHeight*.1,
                        width: screenWidth*0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              20), // Adjust the value as needed
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
                        // height: screenHeight * .06,
                        // width: screenWidth * 0.10,
                        height:screenHeight*.1,
                        width: screenWidth*0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              20), // Adjust the value as needed
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Action for home button
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (
                                      BuildContext context) => const Screen1()));
                            },
                            child: Text('Home', style: textStyleForAllText()),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
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
            Container(
              //color:Colors.wh,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey)),
              width: screenWidth * .8,
              height: screenHeight * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.analytics_outlined, color: Colors.white,
                      size: iconbelowscreen),
                  Text(
                    'Analysis Completed ',
                    style: textStyleBelowScreen(),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void saveAsPdf() async {
    final pdf = pw.Document();

    pw.TableRow buildRow(String label, String value) {
      return pw.TableRow(
        children: [
          pw.Container(
            decoration: pw.BoxDecoration(
              color: PdfColors.cyan,
              border: pw.Border.all(color: PdfColors.black, width: 1),
            ),
            padding: const pw.EdgeInsets.all(4),
            child: pw.Text(label, textAlign: pw.TextAlign.left),
          ),
          pw.Container(
            decoration: pw.BoxDecoration(
              color: PdfColors.cyan,
              border: pw.Border.all(color: PdfColors.black, width: 1),
            ),
            padding: const pw.EdgeInsets.all(4),
            child: pw.Text(value, textAlign: pw.TextAlign.left),
          ),
        ],
      );
    }

    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          children: [
            pw.Text("Agent Name :${_dataList[_dataList.length - 1]['name']}", style: const pw.TextStyle(fontSize: 10)),
            pw.Text("Agent Address:${_dataList[_dataList.length - 1]['address']}", style: const pw.TextStyle(fontSize: 10)),
            pw.Text("Lorry Number:${_dataList[_dataList.length - 1]['lorryNumber']}", style: const pw.TextStyle(fontSize: 10)),
            pw.Text("Number of Bags:${_dataList[_dataList.length - 1]['noofBags']}", style: const pw.TextStyle(fontSize: 10)),
            pw.Text("Lot Weight:${_dataList[_dataList.length - 1]['lotWeight']}", style: const pw.TextStyle(fontSize: 10)),
            pw.Text("Type and Grade:${_dataList[_dataList.length - 1]['typeAndGrade']}", style: const pw.TextStyle(fontSize: 10)),
            pw.Text("Analysis Sample Weight:${_dataList[_dataList.length - 1]['analysisSampleWeight']}", style: const pw.TextStyle(fontSize: 10)),
            pw.Text("Analysis Sample Weight 2:${_dataList[_dataList.length - 1]['analysisSampleWeight2']}", style: const pw.TextStyle(fontSize: 10)),
            pw.Text("Lorry Sample Weight:${_dataList[_dataList.length - 1]['lorrySampleWeight']}", style: const pw.TextStyle(fontSize: 10)),
            pw.Text("Moisture Level:${_dataList[_dataList.length - 1]['moistureLevel']}", style: const pw.TextStyle(fontSize: 10)),
            pw.Text("Analysis Date:${_dataList[_dataList.length - 1]['AnalysisDate']}", style: const pw.TextStyle(fontSize: 10)),
            pw.SizedBox(height: 20),
            pw.Table(
              border: pw.TableBorder.all(color: PdfColors.black, width: 1),
              children: [
                buildRow("MC", "${_dataList[_dataList.length - 1]['MC']}"),
                buildRow("PB", "${_dataList[_dataList.length - 1]['PB']}"),
                buildRow("AAA", "${_dataList[_dataList.length - 1]['AAA']}"),
                buildRow("AA", "${_dataList[_dataList.length - 1]['AA']}"),
                buildRow("A", "${_dataList[_dataList.length - 1]['A']}"),
                buildRow("B", "${_dataList[_dataList.length - 1]['B']}"),
                buildRow("C", "${_dataList[_dataList.length - 1]['C']}"),
                buildRow("BB", "${_dataList[_dataList.length - 1]['BB']}"),
                buildRow("BL", "${_dataList[_dataList.length - 1]['BL']}"),
                buildRow("BERRY", "${_dataList[_dataList.length - 1]['BERRY']}"),
                buildRow("BITS", "${_dataList[_dataList.length - 1]['BITS']}"),
                buildRow("HUSK/Stone", "${_dataList[_dataList.length - 1]['HUSK/Stone']}"),
              ],
            ),
          ],
        );
      },
    ));

    final myfile = File("myfile.pdf");
    await myfile.writeAsBytes(await pdf.save());
  }

}





