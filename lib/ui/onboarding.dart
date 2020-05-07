

import 'package:flutter/material.dart';
import 'package:gin/ui/pages/email_page.dart';

class OnBoarding extends StatefulWidget {

  @override
  OnBoardingState createState() => OnBoardingState();
}

class OnBoardingState extends State<OnBoarding> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              PageView.builder(itemBuilder: (BuildContext context, int index) {
                return EmailPage();
              },
              itemCount: 4,
              ),
              Positioned(
                top:0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(16),
                  height: 100,
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(child: Text("1", style: TextStyle(
                                fontSize: 24,
                                height: 1
                            ),),),
                          ),
                        ),
                        Expanded(child: Container(height: 2, color: Colors.black,)),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(child: Text("2", style: TextStyle(
                                fontSize: 24,
                                height: 1
                            ),),),
                          ),
                        ),
                        Expanded(child: Container(height: 2, color: Colors.black,)),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(child: Text("3", style: TextStyle(
                                fontSize: 24,
                                height: 1
                            ),),),
                          ),
                        ),
                        Expanded(child: Container(height: 2, color: Colors.black,)),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(child: Text("4", style: TextStyle(
                                fontSize: 24,
                              height: 1
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
      ),
    );
  }
}
