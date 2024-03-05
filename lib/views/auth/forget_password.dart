import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/helper/button.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/helper/textfield.dart';
import 'package:nba_trade/views/auth/widgets/app_validator.dart';
import 'package:nba_trade/views/auth/widgets/auth_header.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final ForgetPasswordController controller =
    //     Get.put(ForgetPasswordController());
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const AuthHeader(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextWidget(text: '🔒'),
                    SizedBox(width: 5.0),
                    CustomTextWidget(
                      text: 'Forgot Your Password?',
                      maxLines: 2,
                      fontSize: 16.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      textColor: MyColorHelper.textSecondary,
                    ),
                  ],
                ),
                SizedBox(height: context.height * 0.03),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.width * 0.1),
                  child: const CustomTextWidget(
                    text:
                        'Please enter your registered email address, and we\'ll send you a link to reset your password.',
                    maxLines: 3,
                    fontSize: 14.0,
                    textAlign: TextAlign.center,
                    fontStyle: FontStyle.italic,
                    textColor: MyColorHelper.textSecondary,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: context.width * 0.1),
                  child: Form(
                    //   key: controller.forgetPasswordFormKey,
                    child: CustomTextFormField(
                      validator: AppValidator.validateEmail,
                      //   controller: controller.emailController,
                      hint: 'Email',
                      hintTextColor: MyColorHelper.primary.withOpacity(0.3),
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: MyColorHelper.primary,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.height * 0.03),
                CustomButton(
                  showBackgroundColor: true,
                  buttonText: 'Reset',
                  onTap: () {
                    // if (controller.forgetPasswordFormKey.currentState!
                    //     .validate()) {
                    //   controller.sendPasswordResetEmail();
                    // }
                  },
                ),
                SizedBox(height: context.height * 0.015),
                CustomButton(
                  showBackgroundColor: false,
                  buttonText: 'Resend Email',
                  onTap: () {
                    // if (controller.forgetPasswordFormKey.currentState!
                    //     .validate()) {
                    //   controller.resendPasswordResetEmail(
                    //       controller.emailController.text.trim());
                    // }
                  },
                ),
                SizedBox(height: context.height * 0.07),
                const CustomTextWidget(
                  text:
                      'Need further assistance? \nContact [Support Email/Phone]. \nGet back into the NBA trade action! 🚀🏀',
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  fontStyle: FontStyle.italic,
                  fontSize: 14.0,
                  textColor: Colors.black54,
                ),
                SizedBox(height: context.height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
