import 'package:crafty_bey/app/set_up_network_caller.dart';
import 'package:crafty_bey/app/urls.dart';
import 'package:crafty_bey/core/services/network_caller.dart';
import 'package:crafty_bey/features/auth/data/models/sign_up_params.dart';
import 'package:crafty_bey/features/auth/data/models/user_model.dart';
import 'package:crafty_bey/features/auth/presentation/providers/auth_controller.dart';
import 'package:flutter/widgets.dart';

import '../../data/models/sign_in_params.dart';

class SignInProvider extends ChangeNotifier {
  bool _isSignInInProgress = false;
  bool get isSignUpInProgress => _isSignInInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  Future<bool> signIn(SignInParams params) async {
    bool isSuccess = false;
    _isSignInInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      url: Urls.signInUrl,
      body: params.toJson(),
    );
    if(response.isSuccess){
      UserModel model = UserModel.fromJson(response.responseData['data']['user']);
      String accessToken = response.responseData['data']['token'];
      await AuthController.saveUserData(accessToken, model);
      isSuccess = true;
      _errorMessage = null;
    }
    else{
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }
    _isSignInInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
