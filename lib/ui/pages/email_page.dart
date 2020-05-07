import 'package:flutter/material.dart';
import 'package:gin/util/wave_clipper.dart';

/// Widget for grabbing the email of the on-boarding user.
class EmailPage extends StatefulWidget {

  /// Callback for changing page
  final ValueSetter<int> changePage;
  EmailPage(this.changePage);

  @override
  EmailPageState createState() => EmailPageState();
}

class EmailPageState extends State<EmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body:Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: 220,
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
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:16.0, right: 16, top: 32, bottom: 16),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade300,
                                          blurRadius: 8
                                      ),
                                      BoxShadow(
                                          color: Colors.grey.shade300,
                                          blurRadius: 8
                                      )
                                    ]
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(8)
                                      ),

                                      child: Center(
                                        child: TextField(
                                          textAlign: TextAlign.start,

                                          textAlignVertical: TextAlignVertical.center,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              prefixIcon: Icon(Icons.email),
                                              hintText: "Email",
                                              contentPadding: EdgeInsets.all(0)
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                              ),
                            )
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
                              widget.changePage(1);
                            },
                          ),
                        ),
                      )
                    ],
                  ),),
              )
            ],
          ),
          Positioned(
            top:64,
            left: 0,
            right: 0,
            child:
            Container(
              padding: EdgeInsets.all(16),
              height: 100,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: Text("1", style: TextStyle(
                          fontSize: 20,
                        ),),),
                      ),
                    ),
                    Expanded(child: Container(height: 2, color: Colors.black,)),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: Text("2", style: TextStyle(
                          fontSize: 20,
                        ),),),
                      ),
                    ),
                    Expanded(child: Container(height: 2, color: Colors.black,)),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: Text("3", style: TextStyle(
                          fontSize: 20,
                        ),),),
                      ),
                    ),
                    Expanded(child: Container(height: 2, color: Colors.black,)),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: Text("4", style: TextStyle(
                          fontSize: 20,
                        ),),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}


