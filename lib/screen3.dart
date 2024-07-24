import 'package:flutter/material.dart';
import 'package:flutter_ics_homescreen/Data/variables/variables.dart';
import 'package:flutter_ics_homescreen/screensize.dart';
import 'package:flutter_ics_homescreen/sliderscreen3.dart';
import 'package:intl/intl.dart';

import 'color_seeting_button_widget.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
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
                    child: Image.asset(
                        'asset/mylogo.png')), // Replace 'assets/logo.png' with your logo
                Container(
                    alignment: Alignment.center,
                    width: screenWidth * 0.60,
                    child: const Text("Knemetic solutions",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.normal,
                            color: Colors.white))),
                SizedBox(
                  width: screenWidth * 0.15,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.calendar_month_rounded,
                              color: Colors.white, size: datetimeiconsize),
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
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                color_setting_button(
                  screenheight: screenHeight,
                  screenwidth: screenWidth,
                  myText: 'Mono Color settings',
                  myicon: Icons.settings,
                  iconcolors: Colors.white,
                  myText2: '',
                ),
                color_setting_button(
                  screenheight: screenHeight,
                  screenwidth: screenWidth,
                  myText: 'RGB Color-Green',
                  myicon: Icons.settings,
                  iconcolors: Colors.green,
                  myText2: 'Settings',
                ),
                color_setting_button(
                  screenheight: screenHeight,
                  screenwidth: screenWidth,
                  myText: 'RGB Color-Brown',
                  myicon: Icons.settings,
                  iconcolors: Colors.brown,
                  myText2: 'Settings',
                ),
                color_setting_button(
                  screenheight: screenHeight,
                  screenwidth: screenWidth,
                  myText: 'RGB Color-???',
                  myicon: Icons.settings,
                  iconcolors: Colors.black,
                  myText2: 'Settings',
                ),
                Container(
                  height: screenHeight * .19,
                  width: screenWidth * 0.19,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(0), // Adjust the value as needed
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Action for top camera view button
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(buttoncolor),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "asset/cinemabg.png",
                          height: 80,
                          width: 80,
                        ),
                        const SizedBox(height: 10),
                        Text("Top Light settings",
                            style: textStyleForAllText()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const slider_screen3(slidervalue: 89),
                const slider_screen3(slidervalue: 234),
                const slider_screen3(slidervalue: 512),
                const slider_screen3(slidervalue: 442),
                slider_brightness(slidervalue: 99),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const SizedBox(width: screenWidth * 0.23),
                SizedBox(
                  width: screenWidth * .5,
                  height: screenHeight * 0.06,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.settings, size: 50, color: Colors.blue),
                      const SizedBox(height: 10),
                      Text(
                        'Adjust Top Camera and Top lighting parameters',
                        style: textStyleBelowScreen(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 165),
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
                        Navigator.pushNamed(context, "SettingsScreen");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(buttoncolor),
                      ),
                      child: Text("Back", style: textStyleForAllText()),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
