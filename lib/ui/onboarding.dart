

import 'package:flutter/material.dart';
import 'package:gin/ui/pages/email_page.dart';

class OnBoarding extends StatefulWidget {


  @override
  OnBoardingState createState() => OnBoardingState();
}

class OnBoardingState extends State<OnBoarding> {

  Map<int, bool> visitedNodes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3f7beb),
        body: Stack(
          children: <Widget>[
            PageView.builder(itemBuilder: (BuildContext context, int index) {
              return EmailPage(visitedNodes,);
            },
              physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            ),
            Positioned(
              top:64,
              left: 0,
              right: 0,
              child: Container(
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
            )
          ],
        )
    );
  }
}
