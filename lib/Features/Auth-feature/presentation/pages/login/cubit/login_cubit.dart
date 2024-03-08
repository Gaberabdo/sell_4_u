
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../../core/constant.dart';
import '../../../../../../core/helper/cache/cache_helper.dart';
import '../../../../../../core/helper/dio-helper.dart';

import '../../../../manger/model/user_model.dart';
import 'login_states.dart';



class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }

  UserModel ?userModel;




}
