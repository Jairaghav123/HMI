import 'package:flutter/material.dart';
import 'Data/variables/variables.dart';

class AnalysisScreenWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final double screenwidth;
  final double screenheight;
  final String hinttext;
  final VoidCallback onTap;

  const AnalysisScreenWidget({
    Key? key,
    required this.screenwidth,
    required this.screenheight,
    required this.textEditingController,
    required this.hinttext,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: screenwidth * 0.30,
        height: screenheight * 0.05,
        child: TextField(
          controller: textEditingController,
          keyboardType: TextInputType.text,
          textAlign: TextAlign.center,
          style: textStyleForAllText(),
          decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: textStyleForAllText(),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
