import 'package:crafty_bey/app/app_colors.dart';
import 'package:crafty_bey/features/auth/data/models/verify_otp_params.dart';
import 'package:crafty_bey/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bey/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bey/features/auth/presentation/widgts/app_logo.dart';
import 'package:crafty_bey/features/common/presentation/widgets/center_progress_indicator.dart';
import 'package:crafty_bey/features/common/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../providers/verify_otp_provider.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});

  final String email;
  static const String routeName = '/verifyOtpScreen';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final VerifyOtpProvider _verifyOtpProvider = VerifyOtpProvider();

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return ChangeNotifierProvider(
      create: (_) => _verifyOtpProvider,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 8,
                  children: [
                    AppLogo(width: 80),
                    Text(
                      "Verify OTP",
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: .bold,
                      ),
                    ),
                    Text(
                      "A 4 Digit OTP has been sent to your email",
                      style: textTheme.bodyLarge,
                    ),
                    SizedBox(height: 16),
                    PinCodeTextField(
                      length: 4,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(12),
                        fieldHeight: 50,
                        fieldWidth: 60,
                        activeFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                      ),
                      controller: _otpTEController,
                      animationDuration: Duration(milliseconds: 300),
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        return true;
                      },
                      appContext: context,
                    ),
                    Consumer<VerifyOtpProvider>(
                      builder: (context, _, _) {
                        if (_verifyOtpProvider.isVarifyOtpInProgress) {
                          return CenterProgressIndicator();
                        }
                        return FilledButton(
                          onPressed: _onTapVerifyButton,
                          child: Text("Verify OTP"),
                        );
                      },
                    ),
                    SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: textTheme.bodyMedium,
                        text: 'Already have an account?  ',
                        children: [
                          TextSpan(
                            style: TextStyle(
                              color: AppColors.themeColor,
                              fontWeight: .bold,
                            ),

                            text: 'Sign In',
                            recognizer: TapGestureRecognizer()
                              ..onTap = _onTapSignInButton,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    Navigator.pushReplacementNamed(context, SignInScreen.routeName);
  }

  void _onTapVerifyButton() {
    if (_formKey.currentState!.validate()) {
      _verifyOtp();
    }
  }

  Future<void> _verifyOtp() async {
    if (!mounted) return;
    VerifyOtpParams params = VerifyOtpParams(
      email: widget.email,
      otp: _otpTEController.text,
    );

    final bool isSuccess = await _verifyOtpProvider.verifyOtp(params);



    if (isSuccess) {
      showSnackBarMessage(
        context,
        "OTP Verified Successfully",
        backgroundColor: Colors.green,
      );

      Navigator.pushNamedAndRemoveUntil(
        context,
        SignInScreen.routeName,
            (route) => false,
      );
    } else {
      showSnackBarMessage(
        context,
        _verifyOtpProvider.errorMessage ?? "Something went wrong",
        backgroundColor: Colors.red,
      );
    }

  }



}
