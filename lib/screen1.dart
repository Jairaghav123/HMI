import 'package:flutter/material.dart';
import 'package:flutter_ics_homescreen/screensize.dart';
import 'package:intl/intl.dart';

import 'Data/variables/variables.dart';


class Screen1 extends StatelessWidget {
  const Screen1({super.key});

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
                      color: Colors.white,
                    ),
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
                            DateFormat('EEEE dd MMM').format(DateTime.now()).toString(),
                            style: datetimefont(), // Ensure non-null
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            DateFormat('            HH:mm:ss').format(DateTime.now()).toString(),
                            style: datetimefont(), // Ensure non-null
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                screen1button(
                  screenheight: screenHeight * 0.20,
                  screenwidth: screenWidth * 0.20,
                  myicon: Icons.analytics_outlined,
                  mytext: 'Start Analysis',
                  iconsize: screen1iconsize,
                  myobject: "Start Analysis Screen",
                ),
                SizedBox(width: screenWidth * 0.05),
                screen1button(
                  screenheight: screenHeight * 0.20,
                  screenwidth: screenWidth * 0.20,
                  myicon: Icons.camera_alt,
                  mytext: 'Camera 1 View',
                  iconsize: screen1iconsize,
                  myobject: "Top CAM preview Screen",
                ),
                SizedBox(width: screenWidth * 0.05),
                screen1button(
                  screenheight: screenHeight * 0.20,
                  screenwidth: screenWidth * 0.20,
                  myicon: Icons.camera_alt,
                  mytext: 'Camera 2 View',
                  iconsize: screen1iconsize,
                  myobject: "Bottom CAM preview Screen",
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                screen1button(
                  screenheight: screenHeight * 0.20,
                  screenwidth: screenWidth * 0.20,
                  myicon: Icons.dataset,
                  mytext: 'Data Log Screen',
                  iconsize: screen1iconsize,
                  myobject: "Data Log Screen",
                ),
                SizedBox(width: screenWidth * 0.05),
                screen1button(
                  screenheight: screenHeight * 0.20,
                  screenwidth: screenWidth * 0.20,
                  myicon: Icons.settings,
                  mytext: 'Settings',
                  iconsize: screen1iconsize,
                  myobject: "SettingsScreen",
                ),
              ],
            ),
            const SizedBox(height: 80),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: backgroundcolor),
              ),
              width: screenWidth * 0.8,
              height: screenHeight * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Progress info bar',
                    style: textStyleBelowScreen(), // Ensure non-null
                  ),
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

class screen1button extends StatelessWidget {
  const screen1button({
    super.key,
    required this.screenheight,
    required this.screenwidth,
    required this.myicon,
    required this.mytext,
    required this.iconsize,
    required this.myobject,
  });

  final double screenheight;
  final double screenwidth;
  final IconData myicon;
  final String mytext;
  final double iconsize;
  final String myobject;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenheight,
      width: screenwidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, myobject);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttoncolor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(myicon, size: iconsize, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              mytext,
              style: textStyleForAllText(), // Ensure non-null
            ),
          ],
        ),
      ),
    );
  }
}
