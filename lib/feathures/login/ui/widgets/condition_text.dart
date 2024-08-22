import 'package:doc_app/core/theming/style/styles.dart';
import 'package:flutter/material.dart';

class ConditionText extends StatelessWidget {
  const ConditionText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(  text: 'By logging, you agree to our',
        //By logging, you agree to our    PrivacyPolicy.
        style: Styles.font13Gryregular,),
          TextSpan(text: ' Terms & Conditions', style: Styles.font13DarkBulemedium),
          TextSpan(text: ' and',style: Styles.font13Gryregular,),
          TextSpan(text: ' PrivacyPolicy', style: Styles.font13DarkBulemedium),
        ],
      ),
    );
  }
}
