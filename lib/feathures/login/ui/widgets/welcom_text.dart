import 'package:doc_app/core/theming/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomText extends StatelessWidget {
  const WelcomText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text('Welcome Back ',style: Styles.font24BlueW700,),
         SizedBox(
          height: 8.h,
         ),
         const Text('We\'re excited to have you back, can\'t wait to \nsee what you\'ve been up to since you last \nlogged in.'),
         
      ],
    );
  }
}