import 'package:doc_app/core/theming/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidation extends StatelessWidget {

  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLenght;

  const PasswordValidation({super.key, required this.hasLowerCase, required this.hasUpperCase, required this.hasSpecialCharacters, required this.hasNumber, required this.hasMinLenght});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        buildValiditionRow(' At least 1 lowercase letter',hasLowerCase),
        SizedBox(height:2.h ,),
        buildValiditionRow(' At least 1 upper case letter',hasUpperCase),
        SizedBox(height:2.h ,),
        buildValiditionRow(' At least 1 special characters ',hasSpecialCharacters),
        SizedBox(height:2.h ,),
        buildValiditionRow(' At least 1 number ',hasNumber),
        SizedBox(height:2.h ,),
        buildValiditionRow(' At least 8 character long ',hasMinLenght),
        SizedBox(height:2.h ,),
      ],
    );
  }

 Widget buildValiditionRow(String text,bool hasValidated)
  {
   return Row(
      children: [
        CircleAvatar(
          radius: 3,
          backgroundColor: hasValidated?Colors.green:Colors.red,
        ),
        Text(text,style: Styles.font13DarkBuleregular.copyWith(
        /*  decoration: hasValidated ? TextDecoration.lineThrough :null,
          decorationThickness: 2,*/
          color: hasValidated ? Colors.green:Colors.red,
        ),)
      ],
    );


  }



}



