import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/helper/button.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/helper/textfield.dart';
import 'package:nba_trade/views/auth/login_screen.dart';
import 'package:nba_trade/views/auth/widgets/app_validator.dart';
import 'package:nba_trade/views/auth/widgets/auth_header.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Form(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const AuthHeader(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.0),
                    child: CustomTextWidget(
                      text: 'Create your Account',
                      maxLines: 2,
                      fontSize: 14.0,
                      fontStyle: FontStyle.italic,
                      textColor: MyColorHelper.textSecondary,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: context.width * 0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextFormField(
                          //  controller: controller.name,
                          validator: (validator) {
                            return AppValidator.validateEmptyText(
                                "Name", validator);
                          },
                          hint: 'Name',
                          hintTextColor: MyColorHelper.primary.withOpacity(0.3),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: MyColorHelper.primary,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          //controller: controller.email,
                          validator: (validator) {
                            return AppValidator.validateEmail(validator);
                          },
                          hint: 'Email',
                          hintTextColor: MyColorHelper.primary.withOpacity(0.3),
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: MyColorHelper.primary,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          validator: (validator) {
                            return AppValidator.validatePassword(validator);
                          },
                          //  controller: controller.password,
                          hint: 'Password',
                          hintTextColor: MyColorHelper.primary.withOpacity(0.3),
                          prefixIcon: const Icon(
                            Icons.key,
                            color: MyColorHelper.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: context.height * 0.02),
                  CustomButton(
                    showBackgroundColor: true,
                    buttonText: 'Register',
                    onTap: () {
                      // if (_signUpFormKey.currentState!.validate()) {
                      //   controller.registerUser();
                      // }
                    },
                  ),
                  SizedBox(height: context.height * 0.01),
                  const CustomTextWidget(
                    text: 'Or Register with',
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black87,
                  ),
                  SizedBox(height: context.height * 0.01),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const LoginScreen(),
                          transition: Transition.rightToLeft);
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'Already have an Account? ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: MyColorHelper.textLightGrey,
                            fontSize: 12.0),
                        children: const [
                          TextSpan(
                            text: 'Login',
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
