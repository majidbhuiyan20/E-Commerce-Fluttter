import 'package:crafty_bey/app/set_up_network_caller.dart';
import 'package:crafty_bey/app/urls.dart';
import 'package:crafty_bey/core/services/network_caller.dart';
import 'package:crafty_bey/features/auth/data/models/sign_up_params.dart';
import 'package:flutter/widgets.dart';

class SignUpProvider extends ChangeNotifier {
  bool _isSignUpInProgress = false;
  bool get isSignUpInProgress => _isSignUpInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  Future<bool> signUp(SignUpParams params) async {
    bool isSuccess = false;
    _isSignUpInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      url: Urls.signUpUrl,
      body: params.toJson(),
    );
    if(response.isSuccess){
      isSuccess = true;
      _errorMessage = null;
    }
    else{
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }
    _isSignUpInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
