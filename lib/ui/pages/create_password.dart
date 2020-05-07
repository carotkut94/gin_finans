import 'package:flutter/material.dart';
import 'package:gin/util/shake_controller.dart';
import 'package:gin/util/math_util.dart';
/// Widget for setting the password of the on-boarding user, with constraint
/// validation
class CreatePasswordPage extends StatefulWidget {
  /// Callback for getting the current status of visited page to update the
  /// Progress flow indicator
  final ValueSetter<int> changePage;

  CreatePasswordPage(this.changePage);

  @override
  CreatePasswordPageState createState() => CreatePasswordPageState();
}

class CreatePasswordPageState extends State<CreatePasswordPage> with SingleTickerProviderStateMixin {
  bool hidePassword;
  List complexityLevels;
  ShakeController _shakeController;
  TextEditingController passwordEditingController;
  Animation _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hidePassword = true;
    complexityLevels = [false, false, false, false];
    _shakeController = ShakeController(vsync: this);
    _animation = Tween<double>(begin: 50, end: 120).animate(_shakeController);
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        widget.changePage(0);
        return new Future<bool>.value(false);
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xff3f7beb),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff3f7beb),
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              widget.changePage(0);
            },
          ),
          titleSpacing: 0,
          title: Text("Create Account"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Color(0xff3f7beb),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
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
                                        color: Colors.green,
                                        border: Border.all(
                                            color: Colors.black, width: 2)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Center(
                                        child: Text(
                                          "1",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    height: 2,
                                    color: Colors.black,
                                  )),
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.black, width: 2)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Center(
                                        child: Text(
                                          "2",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    height: 2,
                                    color: Colors.black,
                                  )),
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.black, width: 2)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Center(
                                        child: Text(
                                          "3",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    height: 2,
                                    color: Colors.black,
                                  )),
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.black, width: 2)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Center(
                                        child: Text(
                                          "4",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, left: 16.0, right: 16),
                            child: Text(
                              "Create Password",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 16.0, right: 16),
                            child: Text(
                              "Password will be used to login to account",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, right: 16, top: 32, bottom: 16),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: TextField(
                                    obscureText: hidePassword,
                                    controller: passwordEditingController,
                                    textAlign: TextAlign.start,
                                    onChanged: (data){
                                      validatePassword(data);
                                    },
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        suffixIcon: hidePassword
                                            ? InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    hidePassword = !hidePassword;
                                                  });
                                                },
                                                child: Icon(Icons.lock))
                                            : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    hidePassword = !hidePassword;
                                                  });
                                                },
                                                child: Icon(Icons.lock_open)),
                                        hintText: "Create Password",
                                        contentPadding: EdgeInsets.all(0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, right: 16, bottom: 16),
                            child: Row(
                              children: <Widget>[
                                Text(
                                    "Complexity ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14),
                                ),
                                Expanded(
                                  child: Text(
                                    complexityLevels.where((f)=>f).toList().length==4?
                                    "Very Strong": complexityLevels.where((f)=>f).toList().length==3?"Strong": complexityLevels.where((f)=>f).toList().length==2?"Weak":"Very Weak",
                                    style: TextStyle(
                                        color:complexityLevels.where((f)=>f).toList().length==4?Colors.green:complexityLevels.where((f)=>f).toList().length==3?Colors.yellow:Colors.red,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 32.0, right: 32, bottom: 16, top: 32),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    complexityLevels[0]==true? Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 48,
                                    ) :Text("a", style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32
                                    ),),
                                    Text("Lowercase", style: TextStyle(
                                      color: Colors.white
                                    ),)
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    complexityLevels[1]==true? Icon(
                                      Icons.check_circle,
                                      size: 48,
                                      color: Colors.green,
                                    ) :Text("A", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32
                                    ),),
                                    Text("Uppercase", style: TextStyle(
                                        color: Colors.white
                                    ),)
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    complexityLevels[2]==true? Icon(
                                      Icons.check_circle,
                                      size: 48,
                                      color: Colors.green,
                                    ) :Text("123", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32
                                    ),),Text("Numbers", style: TextStyle(
                                        color: Colors.white
                                    ),)
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    complexityLevels[3]==true? Icon(
                                      Icons.check_circle,
                                      size: 48,
                                      color: Colors.green,
                                    ) :Text("9+", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32
                                    ),),
                                    Text("Digit", style: TextStyle(
                                        color: Colors.white
                                    ),)
                                  ],
                                ),
                              ],
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
                            padding: EdgeInsets.all(16),
                            child: InkWell(
                              onTap: () {
                                if(complexityLevels.where((f)=>f).toList().length==4) {
                                  widget.changePage(2);
                                }else{
                                  _shakeController.shake();
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xff699eee)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      "Next".toUpperCase(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void validatePassword(String password)
  {
    bool hasUppercase  = false;
    bool hasDigits = false;
    bool hasLowercase = false;
    var character='';
    var i=0;

    if (password.isNotEmpty) {
      while (i < password.length){
        character = password.substring(i,i+1);
        if (isDigit(character , 0)){
          hasDigits=true;
        }else{

          if (character == character.toUpperCase()) {
            hasUppercase=true;
          }
          if (character == character.toLowerCase()){
            hasLowercase=true;
          }
        }
        i++;
      }
    }
    setState(() {
      if(hasLowercase){
        complexityLevels[0] = true;
      } else{
        complexityLevels[0] = false;
      }

      if(hasUppercase){
        complexityLevels[1] = true;
      } else{
        complexityLevels[1] = false;
      }

      if(hasDigits){
        complexityLevels[2] = true;
      } else{
        complexityLevels[2] = false;
      }

      if(password.length>9){
        complexityLevels[3] = true;
      } else{
        complexityLevels[3] = false;
      }
    });
  }

  bool isDigit(String s, int idx) =>
      "0".compareTo(s[idx]) <= 0 && "9".compareTo(s[idx]) >= 0;
}



