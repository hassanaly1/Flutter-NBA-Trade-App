import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/views/profile/user_profile.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Get.to(() => const ProfileScreen()),
        child: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/user2.jpg'),
        ));
  }
}
