import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gin/util/math_util.dart';
import 'dart:io' show Platform;

import 'package:gin/util/shake_controller.dart';
/// Widget for setting the time and date for video call

class SchedulePage extends StatefulWidget {
  /// Callback for getting the current status of visited page to update the
  /// Progress flow indicator
  final ValueSetter<int> changePage;

  SchedulePage(this.changePage);

  @override
  SchedulePageState createState() => SchedulePageState();
}

class SchedulePageState extends State<SchedulePage>
    with TickerProviderStateMixin {
  AnimationController _breathingController;
  var _breathe = 0.0;
  var size;
  String selectedDate;
  String selectedTime;

  ShakeController _shakeController;
  Animation _animation;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _breathingController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _breathingController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _breathingController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _breathingController.forward();
      }
    });
    _breathingController.addListener(() {
      setState(() {
        _breathe = _breathingController.value;
         size = 40.0 - 10.0 * _breathe;
      });
    });
    _breathingController.forward();
    selectedDate = "";
    selectedTime = "";
    _shakeController = ShakeController(vsync: this);
    _animation = Tween<double>(begin: 50, end: 120).animate(_shakeController);
  }

  @override
  void dispose() {
    _breathingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        widget.changePage(2);
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
              widget.changePage(2);
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
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(16),
                              height: 100,
                              color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          color: Colors.green,
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
                                          color: Colors.green,
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
                              padding: const EdgeInsets.only(left:16.0, right: 16),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400.withOpacity(0.4),
                                  shape: BoxShape.circle
                                ),
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white
                                    ),
                                    height: size,
                                    width: size,
                                    child: Icon(Icons.calendar_today,size:size*0.5)
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16, top: 16),
                              child: Text(
                                "Schedule Video Call",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, left: 16.0, right: 16),
                              child: Text(
                                "Choose the date and time that you preffer, we will send a link via email to make a video call on the scheduled date and time",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                if(Platform.isIOS) {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext builder) {
                                        return Container(
                                            height: MediaQuery
                                                .of(context)
                                                .copyWith()
                                                .size
                                                .height / 3,
                                            child: CupertinoDatePicker(
                                              initialDateTime: DateTime.now(),
                                              onDateTimeChanged: (
                                                  DateTime newdate) {
                                                setState(() {
                                                  selectedDate = "${newdate.day}/${newdate.month}/${newdate.year}";
                                                });
                                              },
                                              use24hFormat: true,
                                              maximumDate: DateTime.now().add(
                                                  Duration(days: 30)),
                                              minuteInterval: 1,
                                              mode: CupertinoDatePickerMode
                                                  .date,
                                            ));
                                      });
                                }else{
                                  DateTime date = await showDatePicker(context: context, initialDate: DateTime.now().add(Duration(seconds: 1)), firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 30)));
                                  setState(() {
                                    selectedDate = "${date.day}/${date.month}/${date.year}";
                                  });
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 16, top: 64, bottom: 16),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0,
                                            right: 16,
                                            top: 8,
                                            bottom: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Date",
                                              style: TextStyle(
                                                  color: Colors.grey.shade600),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 4.0),
                                              child: Text(
                                                selectedDate.isNotEmpty?selectedDate:"- Choose Date -",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.keyboard_arrow_down),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                if(Platform.isIOS) {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext builder) {
                                        return Container(
                                            height: MediaQuery
                                                .of(context)
                                                .copyWith()
                                                .size
                                                .height / 3,
                                            child: CupertinoDatePicker(
                                              initialDateTime: DateTime.now(),
                                              onDateTimeChanged: (
                                                  DateTime newdate) {
                                                setState(() {
                                                  selectedTime = "${newdate.hour} : ${newdate.minute}";
                                                });
                                              },
                                              use24hFormat: true,
                                              maximumDate: DateTime.now().add(
                                                  Duration(days: 30)),
                                              minuteInterval: 1,
                                              mode: CupertinoDatePickerMode
                                                  .time,
                                            ));
                                      });
                                }else{
                                  TimeOfDay time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                                  setState(() {
                                    selectedTime = "${time.hour} : ${time.minute}";
                                  });
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 16, top: 8, bottom: 16),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0,
                                            right: 16,
                                            top: 8,
                                            bottom: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Time",
                                              style: TextStyle(
                                                  color: Colors.grey.shade600),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 4.0),
                                              child: Text(
                                                selectedTime.isNotEmpty?selectedTime:"- Choose Time -",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.keyboard_arrow_down),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedBuilder(animation: _shakeController,
                      builder: (BuildContext context, Widget child) {
                      return Transform(
                        transform: Matrix4.translation(shake(_animation.value)),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: InkWell(
                            onTap: () {
                              if(selectedTime.isNotEmpty && selectedDate.isNotEmpty){
                                widget.changePage(3);
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
                                    "Finish".toUpperCase(),
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
}
