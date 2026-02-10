import 'package:crafty_bey/app/app_colors.dart';
import 'package:crafty_bey/features/auth/data/models/sign_in_params.dart';
import 'package:crafty_bey/features/auth/presentation/providers/sign_in_provider.dart';
import 'package:crafty_bey/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bey/features/auth/presentation/widgts/app_logo.dart';
import 'package:crafty_bey/features/common/presentation/screens/main_nav_holder_screen.dart';
import 'package:crafty_bey/features/common/presentation/widgets/center_progress_indicator.dart';
import 'package:crafty_bey/features/common/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String routeName = '/SignInScreen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInProvider _signInProvider = SignInProvider();

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return ChangeNotifierProvider(
      create: (_)=> _signInProvider,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                autovalidateMode: .onUserInteraction,
                child: Column(
                  spacing: 8,
                  children: [
                    AppLogo(width: 80),
                    Text(
                      "Sign In",
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: .bold,
                      ),
                    ),
                    Text("Login to your account", style: textTheme.bodyLarge),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _emailTEController,
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
                      controller: _passwordTEController,
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
                        TextButton(
                          onPressed: _onTapForgotPassword,
                          child: Text("Forgot Password"),
                        ),
                      ],
                    ),
                    Consumer<SignInProvider>(
                      builder: (context, _, __) {
                        return Visibility(
                          visible: _signInProvider.isSignUpInProgress == false,
                          replacement: CenterProgressIndicator(),
                          child: FilledButton(
                            onPressed: _onTapSignInButton,
                            child: Text("Sign In"),
                          ),
                        );
                      }
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
                            recognizer: TapGestureRecognizer()
                              ..onTap = _onTapSignUpButton,
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

  void _onTapForgotPassword() {}
  void _onTapSignInButton() {
    if (_formKey.currentState!.validate()) {
      _signIn();
    }
  }

  Future<void> _signIn() async {
    final bool isSuccess = await _signInProvider.signIn(
      SignInParams(
        email: _emailTEController.text.trim(),
        password: _passwordTEController.text.trim(),
      ),
    );

    if(isSuccess){
      Navigator.pushNamedAndRemoveUntil(context, MainNavHolderScreen.routeName,(predicate) => false);
      showSnackBarMessage(context, "SignIn Successful", backgroundColor: Colors.green);
    }
    else{
      showSnackBarMessage(context, _signInProvider.errorMessage!, backgroundColor: Colors.red);
    }
  }
  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.routeName);
  }
}
