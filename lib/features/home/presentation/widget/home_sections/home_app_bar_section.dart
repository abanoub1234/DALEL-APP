import 'package:flutter/material.dart';

import '../home_app_bar_widget.dart';

class HomeAppBarSection extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [
        SizedBox(height: 28,),
        CustomHomeViewAppBar(),
        SizedBox(height: 32,),
      ],
    );
  }

}