import 'package:doc_app/core/helpers/spacing.dart';
import 'package:doc_app/core/theming/style/styles.dart';
import 'package:doc_app/core/widgets/text_button.dart';
import 'package:doc_app/core/widgets/text_form_field.dart';
import 'package:doc_app/feathures/login/ui/widgets/already_have_account.dart';
import 'package:doc_app/feathures/login/ui/widgets/condition_text.dart';
import 'package:doc_app/feathures/login/ui/widgets/password_And_Email.dart';
import 'package:doc_app/feathures/login/ui/widgets/welcom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const WelcomText(),
                verticalSpace(36.h),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const AppTextFormField(
                          hintText: 'email',
                        ),
                      SizedBox(
                        height: 15.h,
                      ),
                        AppTextFormField(
                            hintText: 'password',
                            isObscureText: isObscureText,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isObscureText = !isObscureText;
                                });
                              },
                              child: Icon(
                                isObscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            )),
                          SizedBox(
                            height: 25.h,
                          ),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text('Forget Password?',style: Styles.font13Buleregular))
                      ],
                    ))
            ,
              AppTextButton(buttonText: 'Login', textStyle:Styles.font16semiBold, onPressed: () {  } ,),
              SizedBox(height: 25.h,),
                const ConditionText(),
                SizedBox(height: 50.h,),
                const AlredyHaveAccount()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
