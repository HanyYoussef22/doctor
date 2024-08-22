import 'package:doc_app/core/helpers/spacing.dart';
import 'package:doc_app/core/theming/style/styles.dart';
import 'package:doc_app/core/widgets/text_button.dart';
import 'package:doc_app/feathures/login/logic/cubit/login_cubit.dart';
import 'package:doc_app/feathures/login/data/login_request_body.dart';
import 'package:doc_app/feathures/login/ui/widgets/already_have_account.dart';
import 'package:doc_app/feathures/login/ui/widgets/condition_text.dart';
import 'package:doc_app/feathures/login/ui/widgets/email_and_password.dart';
import 'package:doc_app/feathures/login/ui/widgets/login_bloc_listener.dart';
import 'package:doc_app/feathures/login/ui/widgets/welcom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                const EmailAndPassword(),
                AppTextButton(
                  buttonText: 'Login',
                  textStyle: Styles.font16semiBold,
                  onPressed: () {
                    valiadateThenDoLogin();
                  },
                ),
                SizedBox(
                  height: 25.h,
                ),
                const ConditionText(),
                SizedBox(
                  height: 50.h,
                ),
                const AlredyHaveAccount(),
                 const LoginBlocListener()
              ],
            ),
          ),
        ),
      ),
    );
  }

  valiadateThenDoLogin() {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().login();
    }
  }
}
