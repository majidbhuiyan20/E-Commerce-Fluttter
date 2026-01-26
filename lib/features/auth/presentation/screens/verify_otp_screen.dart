import 'package:crafty_bey/app/app_colors.dart';
import 'package:crafty_bey/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bey/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bey/features/auth/presentation/widgts/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  static const String routeName = '/verifyOtpScreen';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 8,
              children: [
                AppLogo(width: 80),
                Text(
                  "Verify OTP",
                  style: textTheme.headlineMedium?.copyWith(fontWeight: .bold),
                ),
                Text("A 4 Digit OTP has been sent to your email", style: textTheme.bodyLarge),
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
                  animationDuration: Duration(milliseconds: 300),
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    return true;
                  }, appContext: context,
                ),
                FilledButton(
                  onPressed: _onTapVerifyButton,
                  child: Text("Verify OTP"),
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
                        recognizer: TapGestureRecognizer()..onTap = _onTapSignInButton,
                      ),
                    ],
                  ),
                ),
              ],
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
    Navigator.pushNamed(context, SignInScreen.routeName);
  }
}
