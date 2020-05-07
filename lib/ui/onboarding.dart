

import 'package:flutter/material.dart';
import 'package:gin/ui/pages/create_password.dart';
import 'package:gin/ui/pages/email_page.dart';

class OnBoarding extends StatefulWidget {


  @override
  OnBoardingState createState() => OnBoardingState();
}

class OnBoardingState extends State<OnBoarding> {

  PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = new PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xff3f7beb),
        body: Stack(
          children: <Widget>[
            PageView.builder(itemBuilder: (BuildContext context, int index) {
              if(index==0) {
                return EmailPage((newPage) {
                  pageController.animateToPage(newPage, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
                });
              }else{
                return CreatePasswordPage((newPage) {
                  pageController.animateToPage(newPage, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
                });
              }
            },
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            ),
          ],
        )
    );
  }
}
