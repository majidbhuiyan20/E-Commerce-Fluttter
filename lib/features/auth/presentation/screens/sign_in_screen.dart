import 'package:crafty_bey/app/app_colors.dart';
import 'package:crafty_bey/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bey/features/auth/presentation/widgts/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String routeName = '/SignInScreen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                  "Sign In",
                  style: textTheme.headlineMedium?.copyWith(fontWeight: .bold),
                ),
                Text("Login to your account", style: textTheme.bodyLarge),
                SizedBox(height: 16),
                TextFormField(
                  textInputAction: .next,
                  keyboardType: .emailAddress,
                  decoration: InputDecoration(hintText: "Email"),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Your Email";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  textInputAction: .next,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(hintText: "Password"),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Your Password";
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: .end,
                  children: [
                    TextButton(onPressed: _onTapForgotPassword, child: Text("Forgot Password"))
                  ],
                ),
                FilledButton(
                  onPressed: _onTapSignInButton,
                  child: Text("Sign In"),
                ),
                SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: textTheme.bodyMedium,
                    text: 'Don\'t have an account?  ',
                    children: [
                      TextSpan(
                        style: TextStyle(
                          color: AppColors.themeColor,
                          fontWeight: .bold,
                        ),

                        text: 'Sign up',
                        recognizer: TapGestureRecognizer()..onTap = _onTapSignUpButton,
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

  void _onTapForgotPassword(){

  }
  void _onTapSignInButton() {

  }
  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.routeName);
  }
}
