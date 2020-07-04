import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/1.2,
      height: 45,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(7)
      ),
      child: Row(children: [
        SizedBox(width: 10,),
        Icon(FontAwesomeIcons.mapMarkerAlt,size: 18,),
        SizedBox(width: 10,),
        FutureBuilder<String>(builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return Text("Location");
        },),
        SizedBox(width: 10,),
      ],),
    );
  }
}
