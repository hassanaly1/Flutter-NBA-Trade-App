import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:nba_trade/controllers/chatroom_controller.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/models/chatroom_model.dart';
import 'package:nba_trade/views/chatrooms/inbox_detail.dart';

class InboxView extends StatelessWidget {
  final ChatroomController controller;
  const InboxView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.inboxMessages.length,
        itemBuilder: (context, index) {
          return OpenContainer(
            openColor: Colors.transparent,
            closedColor: Colors.transparent,
            transitionDuration: const Duration(milliseconds: 800),
            closedBuilder: (context, action) {
              return CustomInboxWidget(
                  onTap: action, inboxMessage: controller.inboxMessages[index]);
            },
            openBuilder: (context, action) {
              return InboxDetailScreen(
                  inboxMessage: controller.inboxMessages[index]);
            },
            openElevation: 0,
            closedElevation: 0,
            closedShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          );
        });
  }
}

class CustomInboxWidget extends StatelessWidget {
  final InboxMessageModel inboxMessage;
  final VoidCallback onTap;
  const CustomInboxWidget({
    super.key,
    required this.onTap,
    required this.inboxMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
      child: Card(
        elevation: 2.0,
        child: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
              color: MyColorHelper.white,
              borderRadius: BorderRadius.circular(12.0)),
          child: ListTile(
            onTap: onTap,
            leading: CircleAvatar(
                backgroundImage: NetworkImage(inboxMessage.user.userImage),
                radius: 25),
            title: CustomTextWidget(
                text: inboxMessage.user.userName,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start),
            subtitle: CustomTextWidget(
                text: inboxMessage.chats.last.message.toString(),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
                textColor: MyColorHelper.textSecondary),
          ),
        ),
      ),
    );
  }
}
