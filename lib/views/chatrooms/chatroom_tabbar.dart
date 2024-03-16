import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';

class ChatroomTabbar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  const ChatroomTabbar({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: const BoxDecoration(
          color: MyColorHelper.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          )),
      child: Center(
        child: ButtonsTabBar(
          physics: const NeverScrollableScrollPhysics(),
          backgroundColor: const Color(0xffA8A8FF),
          unselectedBackgroundColor: Colors.grey.shade300,
          tabs: [
            _buildTab(context: context, title: 'Public Chatrooms'),
            _buildTab(context: context, title: 'Inbox')
          ],
        ),
      ),
    );
  }

  Tab _buildTab({required BuildContext context, required String title}) {
    return Tab(
      child: SizedBox(
        width: context.width * 0.4,
        child: CustomTextWidget(
          text: title,
          fontSize: 16.0,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w500,
          textColor: Colors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * 0.1);
}
