import 'package:doc_app/core/helpers/extensions.dart';
import 'package:doc_app/core/helpers/spacing.dart';
import 'package:doc_app/core/routing/roters.dart';
import 'package:doc_app/core/theming/style/styles.dart';
import 'package:doc_app/core/widgets/custom_button.dart';
import 'package:doc_app/feathures/onbording/ui/widgets/doc_image_text.dart';
import 'package:doc_app/feathures/onbording/ui/widgets/doc_logo_and_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboarderScreen extends StatelessWidget {
  const OnboarderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const DocLogoAndName(),
                verticalSpace(30.h),
                const DocImageAndBgText(),
                Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Column(
                      children: [
                        Text(
                          'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                          style: Styles.font12GryW700,
                          textAlign: TextAlign.center,
                        ),
                        verticalSpace(32.h),
                        CustomButton(
                            onTap: () {
                              context.pushNamed(Routers.loginScreen);
                            },
                            text: 'Get Start')
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
