import 'dart:async';

import 'package:first_app/pages/login/user.dart';
import 'package:first_app/utils/api_result.dart';
import 'package:first_app/utils/simple_bloc.dart';

import 'login_api.dart';

class LoginBloc extends SimpleBloc<bool> {
  //login method
  Future<ApiResponse<User>> login(String login, String password) async {
    add(true);
    ApiResponse response = await LoginApi.login(login, password);
    add(false);

    return response;
  }
}
