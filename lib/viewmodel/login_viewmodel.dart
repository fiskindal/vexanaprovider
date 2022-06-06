import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';
import 'package:vexanaprovider/model/login_model.dart';
import 'package:vexanaprovider/service/ilogin_service.dart';

import '../service/login_service.dart';

class LoginViewModel extends ChangeNotifier {
  final ILoginService _loginService = LoginService(
    NetworkManager(
      isEnableLogger: true,
      options: BaseOptions(
        baseUrl: 'https://reqres.in/api',
      ),
    ),
  );
  Future<bool?> login(String email, String password) async {
    notifyListeners();
    final response = await _loginService.login(
      LoginModel(email: email, password: password),
    );
    notifyListeners();
    return response?.data?.token != null;
  }
}
