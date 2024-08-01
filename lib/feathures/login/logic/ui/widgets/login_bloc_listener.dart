import 'package:doc_app/core/helpers/extensions.dart';
import 'package:doc_app/core/routing/roters.dart';
import 'package:doc_app/core/theming/style/colors.dart';
import 'package:doc_app/core/theming/style/styles.dart';
import 'package:doc_app/feathures/login/logic/cubit/login_cubit.dart';
import 'package:doc_app/feathures/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(context: context, builder: (context) =>
                Center(
                  child: CircularProgressIndicator(
                    color: ColorsManger.primaryColor,
                  ),

                ));
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routers.homeScreen);

          },
          error: (error) {
            context.pop();
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
 void setupErrorState(BuildContext context,String error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(
            Icons.error,
            color: Colors.red,
            size: 32,
          ),
          content: Text('Error: $error',style: Styles.font14DarkBulemedium,),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text('Got it',style: Styles.font14BlueSemiBold,),
            ),
          ],
        );
      },
    );
  }
