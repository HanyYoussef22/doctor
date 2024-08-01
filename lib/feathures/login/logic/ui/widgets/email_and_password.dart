import 'package:doc_app/core/helpers/app_regex.dart';
import 'package:doc_app/core/theming/style/styles.dart';
import 'package:doc_app/core/widgets/text_form_field.dart';
import 'package:doc_app/feathures/login/logic/cubit/login_cubit.dart';
import 'package:doc_app/feathures/login/logic/ui/widgets/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLenght = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordControl;
    setupPasswordControllerListenner();
    
  }

  void setupPasswordControllerListenner() {
    passwordController.addListener((){
      setState(() {
      hasLowerCase =AppRegex.hasLowerCase(passwordController.text);
      hasUpperCase=AppRegex.hasUpperCase(passwordController.text);
      hasSpecialCharacters=AppRegex.hasSpecialCharacter(passwordController.text);
      hasNumber=AppRegex.hasNumber(passwordController.text);
      hasMinLenght=AppRegex.hasMinLength(passwordController.text);
      });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            validator: emailValidate,
            controller: context.read<LoginCubit>().emailController,
            hintText: 'email',
          ),
          SizedBox(
            height: 15.h,
          ),
          AppTextFormField(
              validator: passValidate,
              controller: context.read<LoginCubit>().passwordControl,
              hintText: 'password',
              isObscureText: isObscureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                  isObscureText ? Icons.visibility_off : Icons.visibility,
                ),
              )),
          SizedBox(
            height: 15.h,
          ),
          Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text('Forget Password?', style: Styles.font13Buleregular)),
          SizedBox(
            height: 10.h,
          ),
          PasswordValidation(
            hasLowerCase: hasLowerCase,
            hasMinLenght: hasMinLenght,
            hasNumber: hasNumber,
            hasSpecialCharacters: hasSpecialCharacters,
            hasUpperCase: hasUpperCase,
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }

}

String? emailValidate(text) {
  if (text!.isEmpty || text.trim().isEmpty) {
    return 'Pleas Enter Your valid Email';
  }
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(text);
  if (!emailValid) {
    return 'Email not Valid';
  }
  return null;
}

String? passValidate(String? text) {
  if (text == null || text.trim().isEmpty) {
    return 'Password is required';
  }

  bool passValid = RegExp(
    r'^(?=.*[a-z])' // At least one lowercase letter
    r'(?=.*[A-Z])' // At least one uppercase letter
    r'(?=.*\d)' // At least one digit
    r'(?=.*[@$!%*?&])' // At least one special character
    ,
  ).hasMatch(text);

  /*if (!passValid) {
    return 'Password must meet criteria';
  }*/

  if (text.length < 8) {
    return 'Password must be at least 8 characters long';
  }

  return null;
}
