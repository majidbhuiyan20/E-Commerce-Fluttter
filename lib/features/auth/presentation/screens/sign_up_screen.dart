import 'package:crafty_bey/app/app_colors.dart';
import 'package:crafty_bey/features/auth/presentation/widgts/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String routeName = '/SignupScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  "Sign Up",
                  style: textTheme.headlineMedium?.copyWith(fontWeight: .bold),
                ),
                Text("Get started your details", style: textTheme.bodyLarge),
                SizedBox(height: 16),
                TextFormField(
                  textInputAction: .next,
                  decoration: InputDecoration(hintText: "First Name"),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Your First Name";
                    }
                    return null;
                  },
                ),

                TextFormField(
                  textInputAction: .next,
                  decoration: InputDecoration(hintText: "Last name"),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Your Last Name";
                    }
                    return null;
                  },
                ),
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
                  textInputAction: .next,
                  decoration: InputDecoration(hintText: "Password"),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Your Password";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  textInputAction: .next,
                  keyboardType: .phone,
                  decoration: InputDecoration(hintText: "Phone"),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Your Phone";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "City"),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Your City";
                    }
                    return null;
                  },
                ),

                FilledButton(
                  onPressed: _onTapSignUpButton,
                  child: Text("Sign Up"),
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
                        recognizer: TapGestureRecognizer()..onTap = () {},
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

  void _onTapSignUpButton() {}
  void _onTapSignInButton() {}
}
