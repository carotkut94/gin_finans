import 'package:flutter/material.dart';
import 'package:gin/util/wave_clipper.dart';

class EmailPage extends StatefulWidget {
  final Map<int, bool> visitedNode;
  final ValueSetter<Map<int,bool>> callback;
  EmailPage(this.visitedNode, this.callback);

  @override
  EmailPageState createState() => EmailPageState();
}

class EmailPageState extends State<EmailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTapDown: (details){
            print(details.localPosition);
          },
          child:Column(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: 180,
                  color: Color(0xff3f7beb),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top:32.0,left:16.0, right: 16),
                              child: Text("Welcome to", style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:16.0, right: 16, top: 8),
                              child: RichText(
                                  text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text:"GIN", style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28
                                        )),
                                        TextSpan(text:" Finans", style: TextStyle(
                                            color: Color(0xff3f7beb),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28
                                        ))
                                      ]
                                  )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:32.0,left:16.0, right: 16),
                              child: Text("Welcome to the bank of future.\nManage and track you accounts on\nthe go.", style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: double.infinity,
                          child: RaisedButton(
                            color: Color(0xff3f7beb),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "Next".toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                            onPressed: (){

                            },
                          ),
                        ),
                      )
                    ],
                  ),),
              )
            ],
          )
        ),
      ),
    );
  }
}


