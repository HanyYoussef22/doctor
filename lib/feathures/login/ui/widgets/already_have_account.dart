import 'package:doc_app/core/theming/style/styles.dart';
import 'package:flutter/material.dart';

class AlredyHaveAccount extends StatelessWidget {
  const AlredyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(  text: 'Already have an account yet? ',
        //By logging, you agree to our    PrivacyPolicy.
        style: Styles.font13Gryregular,),
          TextSpan(text: ' Sign Up ', style: Styles.font13Buleregular),
        
        ],
      ),
    );
  }
}