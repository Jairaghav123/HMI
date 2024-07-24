import 'package:flutter/material.dart';
import 'package:flutter_ics_homescreen/screensize.dart';
import 'package:intl/intl.dart';
import 'Data/variables/variables.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundcolor,
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildHeader(),
            const Spacer(flex: 2),
            _buildButtons(),
            const SizedBox(height: 50),
            _buildBackButton(),
            const Spacer(),
            _buildFooter(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
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
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(
          icon: Icons.camera,
          text1: 'Top camera and',
          text2: 'Light settings',
          routeName: "Color and light settings-Top Screen",
        ),
        const SizedBox(width: 20),
        _buildButton(
          icon: Icons.camera_alt,
          text1: 'Bottom camera and',
          text2: 'Light settings',
          routeName: "Color and light settings-Bottom Screen",
        ),
        const SizedBox(width: 20),
        _buildButton(
          icon: Icons.report_problem_outlined,
          text1: 'Defect selection setting',
          text2: '',
          routeName: "Defect Selection Screen",
        ),
        const SizedBox(width: 20),
        _buildButton(
          icon: Icons.person,
          text1: 'Customer info',
          text2: '',
          routeName: "", // Empty route name for now
        ),
      ],
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String text1,
    required String text2,
    required String routeName,
  }) {
    return Container(
      height: screenHeight * 0.18,
      width: screenWidth * 0.18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
      ),
      child: ElevatedButton(
        onPressed: () {
          if (routeName.isNotEmpty) {
            Navigator.pushNamed(context, routeName);
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttoncolor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: Colors.white),
            Text(text1, style: settingscreentext()),
            Text(text2, style: settingscreentext()),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 1360),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: screenHeight * 0.1,
            width: screenWidth * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "HomeScreen");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(buttoncolor),
                ),
                child: Text('Back', style: textStyleForAllText()),
              ),
            ),
          ),
          const SizedBox(width: 120),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return SizedBox(
      width: screenWidth * 0.8,
      height: screenHeight * 0.06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.settings, size: 50, color: Colors.blue),
          Text(' Settings', style: textStyleBelowScreen()),
        ],
      ),
    );
  }
}
