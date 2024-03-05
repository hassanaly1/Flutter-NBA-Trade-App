import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/helper/button.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/views/auth/login_screen.dart';
import 'package:nba_trade/views/auth/register_screen.dart';
import 'package:nba_trade/views/auth/widgets/auth_header.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  // AuthController controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const AuthHeader(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.width * 0.18, vertical: 8.0),
                child: const CustomTextWidget(
                  text:
                      'Welcome to the ultimate destination for NBA trade enthusiasts!',
                  maxLines: 3,
                  fontSize: 14.0,
                  textAlign: TextAlign.center,
                  textColor: MyColorHelper.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: context.height * 0.05),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 8.0),
                child: CustomTextWidget(
                  text: 'Ready to start?',
                  maxLines: 2,
                  fontSize: 16.0,
                  textColor: MyColorHelper.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0),
                child: CustomTextWidget(
                  text:
                      'Log in or sign up to unlock the full potential of NBA Trade Machine.',
                  maxLines: 2,
                  fontSize: 14.0,
                  textAlign: TextAlign.center,
                  textColor: MyColorHelper.textSecondary,
                ),
              ),
              SizedBox(height: context.height * 0.07),
              CustomButton(
                showBackgroundColor: true,
                buttonText: 'Login',
                onTap: () => Get.to(() => const LoginScreen(),
                    transition: Transition.rightToLeft),
              ),
              SizedBox(height: context.height * 0.02),
              CustomButton(
                showBackgroundColor: false,
                buttonText: 'Register',
                onTap: () => Get.to(const RegisterScreen(),
                    transition: Transition.rightToLeft),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
