import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/views/profile/reusable_profile_tabs.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileHeader(),
              SizedBox(height: context.height * 0.01),
              CustomTextWidget(
                text: 'u/James',
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
                textColor: MyColorHelper.textLightGrey,
              ),
              SizedBox(height: context.height * 0.01),
              const CustomTextWidget(
                text: 'James Anderson',
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: context.height * 0.01),
              CustomTextWidget(
                text: 'Wanting Jody Allen to Move Away from Sports',
                fontSize: 12.0,
                fontWeight: FontWeight.w300,
                textColor: MyColorHelper.textLightGrey,
              ),
              SizedBox(height: context.height * 0.01),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextWidget(
                    text: '167 Followers',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    textColor: MyColorHelper.textPrimary,
                  ),
                  CustomTextWidget(
                    text: '167 Following',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    textColor: MyColorHelper.textPrimary,
                  ),
                ],
              ),
              SizedBox(height: context.height * 0.02),
              const DividerContainer(text: 'General Settings'),
              SizedBox(height: context.height * 0.01),
              ReUsableProfileTabs(
                icon: CupertinoIcons.lock,
                text: 'Mode',
                suffixWidget: Switch(
                  value: true,
                  onChanged: (value) {},
                ),
                onTap: () {},
              ),
              ReUsableProfileTabs(
                icon: Icons.key,
                text: 'Change Password',
                onTap: () {},
              ),
              SizedBox(height: context.height * 0.01),
              const DividerContainer(text: 'Information'),
              SizedBox(height: context.height * 0.01),
              ReUsableProfileTabs(
                icon: Icons.account_box_outlined,
                text: 'About App',
                onTap: () {},
              ),
              ReUsableProfileTabs(
                icon: Icons.rule,
                text: 'Terms & Conditions',
                onTap: () {},
              ),
              ReUsableProfileTabs(
                icon: Icons.policy,
                text: 'Privacy Policy',
                onTap: () {},
              ),
              ReUsableProfileTabs(
                icon: CupertinoIcons.share,
                text: 'Share This App',
                onTap: () {},
              ),
              ReUsableProfileTabs(
                icon: Icons.logout,
                text: 'Logout',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DividerContainer extends StatelessWidget {
  final String text;
  const DividerContainer({
    super.key,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      width: double.infinity,
      color: const Color(0xffD9D9FF),
      child: CustomTextWidget(
        text: text,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.25,
      color: Colors.transparent,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 12.0),
            height: Get.height * 0.18,
            decoration: const BoxDecoration(
              color: MyColorHelper.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_outlined,
                          color: MyColorHelper.white,
                        ),
                      ),
                      const CustomTextWidget(
                        text: 'Profile',
                        textColor: MyColorHelper.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.edit,
                          color: MyColorHelper.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: context.height * 0.15,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/images/user2.jpg"))),
            ),
          ),
        ],
      ),
    );
  }
}
