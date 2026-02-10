import 'package:crafty_bey/app/set_up_network_caller.dart';
import 'package:crafty_bey/app/urls.dart';
import 'package:crafty_bey/core/services/network_caller.dart';
import 'package:crafty_bey/features/auth/data/models/sign_up_params.dart';
import 'package:crafty_bey/features/auth/data/models/verify_otp_params.dart';
import 'package:flutter/widgets.dart';

class VerifyOtpProvider extends ChangeNotifier {
  bool _isVerifyOtpInProgress = false;
  bool get isVarifyOtpInProgress => _isVerifyOtpInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  Future<bool> verifyOtp(VerifyOtpParams params) async {
    bool isSuccess = false;
    _isVerifyOtpInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      url: Urls.verifyOtp,
      body:params.toJson(),
    );
    if(response.isSuccess){
      isSuccess = true;
      _errorMessage = null;
    }
    else{
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }
    _isVerifyOtpInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
