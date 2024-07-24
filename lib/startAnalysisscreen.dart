import 'dart:convert';
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ics_homescreen/analysisscreenwidgets.dart';
import 'package:flutter_ics_homescreen/screensize.dart';
import 'package:intl/intl.dart';
import 'Data/variables/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartAnalysis extends StatefulWidget {
  const StartAnalysis({Key? key}) : super(key: key);

  @override
  State<StartAnalysis> createState() => _StartAnalysisState();
}

class _StartAnalysisState extends State<StartAnalysis> {
  TextEditingController agentNameController = TextEditingController();
  TextEditingController agentAddressController = TextEditingController();
  TextEditingController lorryNumberController = TextEditingController();
  TextEditingController noofBagsController = TextEditingController();
  TextEditingController lotWeightController = TextEditingController();
  TextEditingController typeAndGradeController = TextEditingController();
  TextEditingController analysisSampleWeightController =
      TextEditingController();
  TextEditingController analysisSampleWeight2Controller =
      TextEditingController();
  TextEditingController lorrySampleWeightController = TextEditingController();
  TextEditingController moistureLevelController = TextEditingController();

  late TextEditingController? currentController; // Define currentController

  bool isKeyboardVisible = false;

  @override
  void dispose() {
    agentNameController.dispose();
    agentAddressController.dispose();
    lorryNumberController.dispose();
    noofBagsController.dispose();
    lotWeightController.dispose();
    typeAndGradeController.dispose();
    analysisSampleWeightController.dispose();
    analysisSampleWeight2Controller.dispose();
    lorrySampleWeightController.dispose();
    moistureLevelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                          const Icon(
                            Icons.calendar_month_rounded,
                            color: Colors.white,
                            size: datetimeiconsize,
                          ),
                          Text(
                              DateFormat('EEEE dd MMM')
                                  .format(DateTime.now())
                                  .toString(),
                              style: datetimefont()),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              DateFormat('            HH:mm:ss')
                                  .format(DateTime.now())
                                  .toString(),
                              style: datetimefont()),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    AnalysisScreenWidget(
                        screenwidth: screenWidth,
                        screenheight: screenHeight,
                        hinttext: 'Estate Name/ Agent Name',
                        textEditingController: agentNameController,
                        onTap: () {
                          _showKeyboard(agentNameController);
                        }),
                    const SizedBox(height: 20),
                    AnalysisScreenWidget(
                      screenwidth: screenWidth,
                      screenheight: screenHeight,
                      hinttext: 'Estate Address/ Agent Address',
                      textEditingController: agentAddressController,
                      onTap: () => _showKeyboard(agentAddressController),
                    ),
                    const SizedBox(height: 20),
                    AnalysisScreenWidget(
                      screenwidth: screenWidth,
                      screenheight: screenHeight,
                      hinttext: 'Lorry Number',
                      textEditingController: lorryNumberController,
                      onTap: () => _showKeyboard(lorryNumberController),
                    ),
                    const SizedBox(height: 20),
                    AnalysisScreenWidget(
                      screenwidth: screenWidth,
                      screenheight: screenHeight,
                      hinttext: 'No of Bags',
                      textEditingController: noofBagsController,
                      onTap: () => _showKeyboard(noofBagsController),
                    ),
                    const SizedBox(height: 20),
                    AnalysisScreenWidget(
                      screenwidth: screenWidth,
                      screenheight: screenHeight,
                      hinttext: 'Lot Weight',
                      textEditingController: lotWeightController,
                      onTap: () => _showKeyboard(lotWeightController),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                const SizedBox(width: screenWidth * 0.15),
                Column(
                  children: [
                    AnalysisScreenWidget(
                      screenwidth: screenWidth,
                      screenheight: screenHeight,
                      hinttext: 'Type and Grade',
                      textEditingController: typeAndGradeController,
                      onTap: () => _showKeyboard(typeAndGradeController),
                    ),
                    const SizedBox(height: 20),
                    AnalysisScreenWidget(
                      screenwidth: screenWidth,
                      screenheight: screenHeight,
                      hinttext: 'Analysis Sample weight',
                      textEditingController: analysisSampleWeightController,
                      onTap: () =>
                          _showKeyboard(analysisSampleWeightController),
                    ),
                    const SizedBox(height: 20),
                    AnalysisScreenWidget(
                      screenwidth: screenWidth,
                      screenheight: screenHeight,
                      hinttext: 'Analysis Sample weight',
                      textEditingController: analysisSampleWeight2Controller,
                      onTap: () =>
                          _showKeyboard(analysisSampleWeight2Controller),
                    ),
                    const SizedBox(height: 20),
                    AnalysisScreenWidget(
                      screenwidth: screenWidth,
                      screenheight: screenHeight,
                      hinttext: 'Lorry Sample weight',
                      textEditingController: lorrySampleWeightController,
                      onTap: () => _showKeyboard(lorrySampleWeightController),
                    ),
                    const SizedBox(height: 20),
                    AnalysisScreenWidget(
                      screenwidth: screenWidth,
                      screenheight: screenHeight,
                      hinttext: 'Moisture level',
                      textEditingController: moistureLevelController,
                      onTap: () => _showKeyboard(moistureLevelController),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: screenHeight * .1,
                  width: screenWidth * 0.15,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(0), // Adjust the value as needed
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        _saveData();
                        setState(() {});
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(buttoncolor),
                      ),
                      child: Text("Save", style: textStyleForAllText()),
                    ),
                  ),
                ),
                Container(
                  height: screenHeight * .1,
                  width: screenWidth * 0.15,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(0), // Adjust the value as needed
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, "Insert Tray pop up Screen");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(buttoncolor),
                      ),
                      child: Text("Next", style: textStyleForAllText()),
                    ),
                  ),
                ),
                Container(
                  height: screenHeight * .1,
                  width: screenWidth * 0.15,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(0), // Adjust the value as needed
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "HomeScreen");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(buttoncolor),
                      ),
                      child: Text("Back", style: textStyleForAllText()),
                    ),
                  ),
                )
              ],
            ),
            Container(
              alignment: Alignment.center,
              width: screenWidth * .8,
              height: screenHeight * 0.06,
              child: Text(
                'Agent and Material Data',
                style: textStyleBelowScreen(),
              ),
            ),
            const SizedBox(height: 20),
            if (isKeyboardVisible)
              Container(
                color: Colors.white,
                child: VirtualKeyboard(
                  height: screenHeight * 0.331,
                  width: screenWidth * 0.8,
                  textColor: Colors.black,
                  fontSize: 33,
                  type: VirtualKeyboardType.Alphanumeric,
                  onKeyPress: _onKeyPress,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showKeyboard(TextEditingController controller) {
    setState(() {
      isKeyboardVisible = true;
      currentController = controller;
    });
  }

  void _onKeyPress(VirtualKeyboardKey key) {
    if (currentController == null) return;

    setState(() {
      if (key.keyType == VirtualKeyboardKeyType.String) {
        currentController!.text += key.text!;
      } else if (key.keyType == VirtualKeyboardKeyType.Action) {
        switch (key.action) {
          case VirtualKeyboardKeyAction.Backspace:
            if (currentController!.text.isNotEmpty) {
              currentController!.text = currentController!.text
                  .substring(0, currentController!.text.length - 1);
            }
            break;
          case VirtualKeyboardKeyAction.Return:
            currentController!.text += '\n';
            break;
          case VirtualKeyboardKeyAction.Space:
            currentController!.text += ' ';
            break;
          default:
            break;
        }
      }
    });
  }

  void _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final agentData = prefs.getStringList('agents') ?? [];

    final newAgent = {
      'name': agentNameController.text,
      'address': agentAddressController.text,
      'lorryNumber': lorryNumberController.text,
      'noofBags': noofBagsController.text,
      'lotWeight': lotWeightController.text,
      'typeAndGrade': typeAndGradeController.text,
      'analysisSampleWeight': analysisSampleWeightController.text,
      'analysisSampleWeight2': analysisSampleWeight2Controller.text,
      'lorrySampleWeight': lorrySampleWeightController.text,
      'moistureLevel': moistureLevelController.text,
      'AnalysisDate': DateTime.now().toString(),
      'MC': "20 %",
      'PB': "34 %",
      'AAA': "21 %",
      'AA': "49 %",
      'A': "16 %",
      'B': "78 %",
      'C': "67 %",
      'BB': "12 %",
      'BL': "19 %",
      'BERRY': "67 %",
      'BITS': "56 %",
      'HUSK/Stone': "34 %",
    };

    agentData.add(json.encode(newAgent));
    await prefs.setStringList('agents', agentData);
  }
}
