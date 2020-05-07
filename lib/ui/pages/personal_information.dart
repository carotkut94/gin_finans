import 'package:flutter/material.dart';
import 'package:gin/util/math_util.dart';
import 'package:gin/util/shake_controller.dart';

/// Widget for getting expense and income related data, with constraint
/// validation
class PersonalInformationPage extends StatefulWidget {
  /// Callback for getting the current status of visited page to update the
  /// Progress flow indicator
  final ValueSetter<int> changePage;

  PersonalInformationPage(this.changePage);

  @override
  PersonalInformationPageState createState() => PersonalInformationPageState();
}


class PersonalInformationPageState extends State<PersonalInformationPage> with SingleTickerProviderStateMixin {

  String activationAmount;
  String incomeAmount;
  String expenseAmount;

  List<String> activationOptions;
  List<String> incomeOptions;
  List<String> expenseOptions;

  ShakeController _shakeController;
  Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    activationOptions = ["Rs. 5000","Rs. 10000","Rs. 15000","Rs. 25000","Rs. 35000", "Rs. 50000"];
    incomeOptions = ["Rs. 1000","Rs. 10000","Rs. 15000","Rs. 20000","Rs. 25000", "Rs. 50000", "Rs. 100000"];
    expenseOptions = ["Rs. 5000","Rs. 10000","Rs. 15000","Rs. 25000","Rs. 35000", "Rs. 50000"];
    incomeAmount = "";
    activationAmount = "";
    expenseAmount = "";
    _shakeController = ShakeController(vsync: this);
    _animation = Tween<double>(begin: 50, end: 120).animate(_shakeController);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        widget.changePage(1);
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
              widget.changePage(1);
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
                              "Personal Information",
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
                              "Please fill in the information below and your goal for digital saving",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              openActivationAmount(0);
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
                                    Expanded(child: Padding(
                                      padding: const EdgeInsets.only(left:16.0, right: 16, top: 8, bottom: 8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Goal for activation", style: TextStyle(
                                            color: Colors.grey.shade600
                                          ),),
                                          Padding(
                                            padding: const EdgeInsets.only(top:4.0),
                                            child: Text(activationAmount.isNotEmpty?activationAmount: "- Choose Option -", style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold
                                            ),),
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
                            onTap: (){
                              openActivationAmount(1);
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
                                    Expanded(child: Padding(
                                      padding: const EdgeInsets.only(left:16.0, right: 16, top: 8, bottom: 8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Monthly income", style: TextStyle(
                                              color: Colors.grey.shade600
                                          ),),
                                          Padding(
                                            padding: const EdgeInsets.only(top:4.0),
                                            child: Text(incomeAmount.isNotEmpty?incomeAmount: "- Choose Option -", style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold
                                            ),),
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
                            onTap: (){
                              openActivationAmount(2);
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
                                    Expanded(child: Padding(
                                      padding: const EdgeInsets.only(left:16.0, right: 16, top: 8, bottom: 8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Monthly expense", style: TextStyle(
                                              color: Colors.grey.shade600
                                          ),),
                                          Padding(
                                            padding: const EdgeInsets.only(top:4.0),
                                            child: Text(expenseAmount.isNotEmpty?expenseAmount: "- Choose Option -", style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold
                                            ),),
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
                    AnimatedBuilder(
                      animation: _shakeController,
                      builder: (BuildContext context, Widget child) {
                        return Transform(
                          transform: Matrix4.translation(shake(_animation.value)),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: InkWell(
                              onTap: () {
                                if(activationAmount.isNotEmpty && expenseAmount.isNotEmpty && incomeAmount.isNotEmpty){
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

  void openActivationAmount(int type){
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        builder: (context) {
          return DraggableScrollableSheet(
            maxChildSize: 0.7,
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Color(0xff3f7beb),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)
                  )
                ),
                height: 100,
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: type==0?activationOptions.length:type==1?incomeOptions.length:expenseOptions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        switch(type){
                          case 0:
                            setState(() {
                              activationAmount = activationOptions[index];
                            });
                            break;
                          case 1:
                            setState(() {
                              incomeAmount = incomeOptions[index];
                            });
                            break;
                          case 2:
                            setState(() {
                              expenseAmount = expenseOptions[index];
                            });
                            break;
                        }
                        Navigator.pop(context);
                      },
                      child: ListTile(title: Text(
                        type==0?activationOptions[index]:type==1?incomeOptions[index]:expenseOptions[index], style: TextStyle(
                        color: Colors.white
                      ),), ),
                    );
                  },
                ),
              );
            },
          );
        }
    );
  }
}



