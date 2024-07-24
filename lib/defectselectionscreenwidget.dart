import 'package:flutter/material.dart';

import 'Data/variables/variables.dart';

class defectselectioncolumn extends StatefulWidget {
  defectselectioncolumn({
    super.key,
    required this.screenwidth,
    required this.screenheight,
    required this.innertext,
    required this.firstvalue,
  });

  final double screenwidth;
  final double screenheight;
  final String innertext;
  late bool firstvalue;

  @override
  State<defectselectioncolumn> createState() => _defectselectioncolumnState();
}

class _defectselectioncolumnState extends State<defectselectioncolumn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.blue,
            width: widget.screenwidth * 0.030,
            height: widget.screenheight *
                0.05 //width:widget.screenwidth*0.025,height:widget.screenheight*0.05
            ,
            child: Transform.scale(
              scale: 2.0,
              child: Checkbox(
                hoverColor: Colors.white,
                value: widget.firstvalue,
                onChanged: (bool? value) {
                  setState(() {
                    widget.firstvalue = value!;
                  });
                },
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: widget.screenwidth * 0.20,
            height: widget.screenheight * 0.05,
            child: Text(widget.innertext, style: textStyleForAllText()),
          ),
        ],
      ),
    );
  }
}
