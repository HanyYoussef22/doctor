import 'package:doc_app/feathures/login/logic/cubit/login_state.dart';
import 'package:doc_app/feathures/login/data/login_request_body.dart';
import 'package:doc_app/feathures/login/data/repo/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());


  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordControl = TextEditingController();

  void login() async {
    emit(const LoginState.loading());

    final response = await _loginRepo.login(LoginRequestBody(email: emailController.text,password: passwordControl.text));

    response.when(success: (loginResponce) {
      emit(LoginState.success(loginResponce));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
