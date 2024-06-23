import 'package:doc_app/core/theming/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svgs/doclogo.svg'),
        SizedBox(
          width: 10.w,
        ),
        Text(
          'Docdoc',
          style: Styles.font24BlackW700,
        )
      ],
    );
  }
}
