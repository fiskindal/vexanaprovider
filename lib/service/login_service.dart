import 'package:vexanaprovider/model/login_model.dart';
import 'package:vexanaprovider/model/login_response_model.dart';
import 'package:vexanaprovider/service/ilogin_service.dart';
import 'package:vexana/vexana.dart';

class LoginService extends ILoginService {
  LoginService(super.networkManager);
  @override
  Future<IResponseModel<LoginResponseModel?>?> login(LoginModel model) async {
    final response =
        await networkManager.send<LoginResponseModel, LoginResponseModel>(
      '/login',
      parseModel: LoginResponseModel(),
      method: RequestType.POST,
      data: {'email': model.email, 'password': model.password},
    );
    if (response.data is LoginResponseModel) {
      return response;
    } else {
      return null;
    }
  }
}
