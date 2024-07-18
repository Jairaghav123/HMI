import 'package:flutter/material.dart';

import 'Data/variables/variables.dart';

class slider_screen3 extends StatefulWidget {
  final double slidervalue;
  const slider_screen3({
    super.key, required this.slidervalue,
  });

  @override
  State<slider_screen3> createState() => _slider_screen3State();
}

class _slider_screen3State extends State<slider_screen3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(width:MediaQuery.of(context).size.width*0.18 ,
            child: Slider(value: widget.slidervalue/1024, onChanged: (double){


            })),
        Container(
          width:MediaQuery.of(context).size.width*0.18 ,
          alignment:Alignment.center,
          child: Text(widget.slidervalue.toString(),style:textStyleForAllText ()),
        ),
      ],
    );
  }
}









class slider_brightness extends StatefulWidget {
  late final double slidervalue;
   slider_brightness({
    super.key, required this.slidervalue,
  });

  @override
  State<slider_brightness> createState() => _slider_brightnessState();
}

class _slider_brightnessState extends State<slider_brightness> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(width:MediaQuery.of(context).size.width*0.18 ,
            child: Slider(value: widget.slidervalue/100, onChanged: (value){

              setState(() {
                widget.slidervalue=value ;
              });


            })),
        Container(
          width:MediaQuery.of(context).size.width*0.18 ,
          alignment:Alignment.center,
          child: Text(widget.slidervalue.toString(),style:textStyleForAllText ()),
        ),
      ],
    );
  }
}