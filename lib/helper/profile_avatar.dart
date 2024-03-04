import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const InkWell(
      //onTap: () => Get.to(ProfileScreen()),
      child: CircleAvatar(backgroundColor: Colors.red),
    );
  }
}
