import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/helper/button.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/social_icon.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/helper/textfield.dart';
import 'package:nba_trade/views/auth/forget_password.dart';
import 'package:nba_trade/views/auth/register_screen.dart';
import 'package:nba_trade/views/auth/widgets/app_validator.dart';
import 'package:nba_trade/views/auth/widgets/auth_header.dart';
import 'package:nba_trade/views/dashboard/dashboard.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  // final AuthController controller;

  static final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  const AuthHeader(),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 22.0, vertical: 4.0),
                    child: CustomTextWidget(
                      text: 'Log in to your account.',
                      maxLines: 2,
                      fontStyle: FontStyle.italic,
                      fontSize: 14.0,
                      textColor: MyColorHelper.textSecondary,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: context.width * 0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomTextFormField(
                          //controller: controller.email,
                          validator: (validator) {
                            return AppValidator.validateEmail(validator);
                          },
                          hint: 'Email',
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: MyColorHelper.primary,
                          ),
                          hintTextColor: MyColorHelper.primary.withOpacity(0.3),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          validator: (validator) {
                            return AppValidator.validateEmptyText(
                                'Password', validator);
                          },
                          // controller: controller.password,
                          hint: 'Password',
                          hintTextColor: MyColorHelper.primary.withOpacity(0.3),
                          prefixIcon: const Icon(
                            Icons.key,
                            color: MyColorHelper.primary,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => const ForgetPasswordScreen(),
                                transition: Transition.rightToLeft);
                          },
                          child: const CustomTextWidget(
                            text: 'Forget Password?',
                            maxLines: 1,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            textColor: MyColorHelper.primary,
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomButton(
                    showBackgroundColor: true,
                    buttonText: 'Login',
                    onTap: () {
                      Get.to(() => DashboardScreen());
                      // if (_loginFormKey.currentState!.validate()) {
                      //   controller.loginUser();
                      // }
                    },
                  ),
                  SizedBox(height: context.height * 0.02),
                  const CustomTextWidget(
                    text: 'Or Login with',
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black87,
                  ),
                  SizedBox(height: context.height * 0.02),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomSocialIcon(
                            onTap: () {
                              //  controller.loginWithGoogle();
                            },
                            imagePath: 'assets/images/google-icon.png'),
                        CustomSocialIcon(
                            onTap: () {
                              // controller.loginWithFacebook();
                            },
                            imagePath: 'assets/images/facebook-icon.png'),
                      ],
                    ),
                  ),
                  SizedBox(height: context.height * 0.01),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const RegisterScreen(),
                          transition: Transition.rightToLeft);
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'Don\'t have an Account? ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: MyColorHelper.textLightGrey,
                            fontSize: 12.0),
                        children: const [
                          TextSpan(
                            text: 'Register',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: MyColorHelper.textPrimary,
                                fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
