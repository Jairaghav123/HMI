import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_ics_homescreen/Data/variables/variables.dart';
import 'package:flutter_ics_homescreen/resultscreenwidget.dart';
import 'package:flutter_ics_homescreen/screen1.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_ics_homescreen/screensize.dart';

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
      _dataList = agentData
          .map((data) => Map<String, String>.from(jsonDecode(data)))
          .toList();
    });
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
                    style: TextStyle(
                        fontSize: 40,
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
                              color: Colors.white, size: datetimeiconsize),
                          Text(
                            DateFormat('EEEE dd MMM').format(DateTime.now()),
                            style: datetimefont(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            DateFormat('HH:mm:ss').format(DateTime.now()),
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
            isDataAvailable
                ? buildDataAvailableContent()
                : buildNoDataContent(),
            const Spacer(),
            buildFooter(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildDataAvailableContent() {
    if (_dataList.isEmpty) {
      return buildNoDataContent();
    }
    final lastData = _dataList.last;

    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 30),
            buildDataContainer(lastData['name'] ?? "null", screenWidth * 0.30),
            const SizedBox(width: screenWidth * 0.05),
            buildDataContainer(
                lastData['AnalysisDate'] ?? "null", screenWidth * 0.30),
          ],
        ),
        const SizedBox(height: 40),
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
            buildActionButtons(),
          ],
        ),
      ],
    );
  }

  Widget buildNoDataContent() {
    return Column(
      children: [
        const SizedBox(height: screenHeight * 0.20),
        Container(
          alignment: Alignment.center,
          width: screenWidth,
          height: screenHeight * .1,
          child: Text(
            'No data available to display results.',
            style: textStyleForAllText(),
          ),
        ),
        const SizedBox(height: 160),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildButton("Back", "Tray 3 Analysis Screen"),
            buildButton("Home", "HomeScreen"),
          ],
        ),
      ],
    );
  }

  Widget buildDataContainer(String text, double width) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: screenHeight * .05,
      color: Colors.blue,
      child: Text(
        text,
        style: textStyleForAllText(),
      ),
    );
  }



  Widget buildActionButtons() {
    return Column(
      children: [
        buildActionButton("Save", saveAsPdf),
        buildActionButton("Discard", () {}),
        buildActionButton("Print", () {}),
        buildActionButton("Home", () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const Screen1()));
        }),
      ],
    );
  }

  Widget buildActionButton(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: screenHeight * .1,
        width: screenWidth * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(buttoncolor),
            ),
            child: Text(text, style: textStyleForAllText()),
          ),
        ),
      ),
    );
  }

  Widget buildButton(String text, String routeName) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        height: screenHeight * .1,
        width: screenWidth * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, routeName);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(buttoncolor),
            ),
            child: Text(text, style: textStyleForAllText()),
          ),
        ),
      ),
    );
  }

  Widget buildFooter() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: backgroundcolor),
      ),
      width: screenWidth * .8,
      height: screenHeight * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.analytics_outlined,
              color: Colors.white, size: iconbelowscreen),
          Text(
            'Analysis Completed ',
            style: textStyleBelowScreen(),
          ),
        ],
      ),
    );
  }

  void saveAsPdf() async {
    if (_dataList.isEmpty) return;

    final pdf = pw.Document();
    final lastData = _dataList.last;

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
            pw.Text("Agent Name :${lastData['name']}",
                style: const pw.TextStyle(fontSize: 10)),
            pw.Text("Analysis Date:${lastData['AnalysisDate']}",
                style: const pw.TextStyle(fontSize: 10)),
            pw.Text(" ", style: const pw.TextStyle(fontSize: 10)),
            pw.Table(
              border: pw.TableBorder.all(color: PdfColors.black, width: 1),
              children: [
                buildRow("MOISTURE", lastData['MC'] ?? "null"),
                buildRow("PEA BERRY", lastData['PB'] ?? "null"),
                buildRow("SIZE-AAA", lastData['AAA'] ?? "null"),
                buildRow("SIZE-AA", lastData['AA'] ?? "null"),
                buildRow("SIZE-A", lastData['A'] ?? "null"),
                buildRow("SIZE-B", lastData['B'] ?? "null"),
                buildRow("SIZE-C", lastData['C'] ?? "null"),
                buildRow("BLACK & BROWN", lastData['BB'] ?? "null"),
                buildRow("BLEACHES", lastData['BL'] ?? "null"),
                buildRow("BERRY BORES", lastData['BERRY'] ?? "null"),
                buildRow("BITS & BROKEN", lastData['BITS'] ?? "null"),
                buildRow("HUSK/Stone", lastData['HUSK/Stone'] ?? "null"),
              ],
            ),
          ],
        );
      },
    ));

    Directory appDocDirectory = Directory('/home/jai/Documents/local_flutter_apps/flutter_ics_homescreen');
    Directory directory =
        await Directory('${appDocDirectory.path}/pdfs').create(recursive: true);

    final file = File("${directory.path}/${lastData['name']}_Report.pdf");
    await file.writeAsBytes(await pdf.save());
  }
}



