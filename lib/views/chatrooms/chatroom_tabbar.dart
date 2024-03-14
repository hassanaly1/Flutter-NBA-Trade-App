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
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: MyColorHelper.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: ButtonsTabBar(
        backgroundColor: MyColorHelper.primary,
        unselectedBackgroundColor: Colors.transparent,
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        labelStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        tabs: [
          buildTab(title: 'Public Chatrooms', context: context),
          buildTab(title: 'Inbox', context: context),
        ],
      ),
    );
  }

  Tab buildTab({required BuildContext context, required String title}) {
    return Tab(
      child: SizedBox(
        width: context.width * 0.5,
        child: CustomTextWidget(
          text: title,
          fontSize: 14.0,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * 0.1);
}
