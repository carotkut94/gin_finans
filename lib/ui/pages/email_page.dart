import 'package:flutter/material.dart';
import 'package:gin/util/math_util.dart';
import 'package:gin/util/shake_controller.dart';
import 'package:gin/util/wave_clipper.dart';

/// Widget for grabbing the email of the on-boarding user.
class EmailPage extends StatefulWidget {

  /// Callback for changing page
  final ValueSetter<int> changePage;
  EmailPage(this.changePage);

  @override
  EmailPageState createState() => EmailPageState();
}

class EmailPageState extends State<EmailPage> with SingleTickerProviderStateMixin {

  ShakeController _shakeController;
  TextEditingController emailEditingController;
  Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailEditingController = TextEditingController();
    _shakeController = ShakeController(vsync: this);
    _animation = Tween<double>(begin: 50, end: 120).animate(_shakeController);
  }

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
                                          controller: emailEditingController,
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
                      AnimatedBuilder(
                        animation: _shakeController,
                        builder: (BuildContext context, Widget child) {
                          return Transform(
                            transform: Matrix4.translation(shake(_animation.value)),
                            child: Padding(
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
                                    if(emailEditingController.text.isNotEmpty && isEmail(emailEditingController.text))
                                      widget.changePage(1);
                                    else
                                      _shakeController.shake();
                                  },
                                ),
                              ),
                            ),
                          );
                      },
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

  /// Utility function for checking if the given mail is valid
  /// regular expression taken from
  /// https://stackoverflow.com/questions/16800540/validate-email-address-in-dart

  bool isEmail(String em) {
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }
}


