import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Final page after submission

class AllDonePage extends StatefulWidget {

  @override
  AllDonePageState createState() => AllDonePageState();
}

class AllDonePageState extends State<AllDonePage> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xff3f7beb),
      extendBody: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.check_circle, color: Colors.green, size: 80,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("All Done, You Will Hear From Us", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22
                ),),
              )
            ]),
      )
      );
  }
}
