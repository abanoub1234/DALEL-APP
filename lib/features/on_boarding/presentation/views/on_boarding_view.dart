import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/functions/navigation.dart';
import '../widget/GetButtons.dart';
import '../widget/OnBoardingWidgetBody.dart';
import '../widget/custom_nav_bar.dart';
import 'functions/on_boarding.dart';

class OnBoardingView extends StatefulWidget {
  OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int currentpageindix=0;
  PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: 40,),
              CustomNavBar(ontap: (){
                onBoardingVisited();
                customNavigate(context,'/SignUpView');
              },),
              OnBoardingWidgetBody(controller: _controller ,onPageChanged: (indix){
                setState(() {

                  currentpageindix=indix;
                });

              }),
              SizedBox(height: 88),
              GetButtons(currentIndex: currentpageindix,controller:_controller ,)


    ])
        )));}
}
