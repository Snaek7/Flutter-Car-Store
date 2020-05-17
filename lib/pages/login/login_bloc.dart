import 'dart:async';

import 'package:first_app/pages/login/user.dart';
import 'package:first_app/utils/api_result.dart';

import 'login_api.dart';

class LoginBloc {
  final _streamController = StreamController<bool>();

  get stream => _streamController.stream;

  //login method
  Future<ApiResponse<User>> login(String login, String password) async {
    _streamController.add(true);
    ApiResponse response = await LoginApi.login(login, password);
    _streamController.add(false);

    return response;
  }

  dispose() {
    _streamController.close();
  }
}
