import 'package:vexanaprovider/model/login_response_model.dart';
import 'package:vexana/vexana.dart';

import '../model/login_model.dart';

abstract class ILoginService {
  ILoginService(this.networkManager);
  final INetworkManager networkManager;
  Future<IResponseModel<LoginResponseModel?>?> login(LoginModel model);
}
