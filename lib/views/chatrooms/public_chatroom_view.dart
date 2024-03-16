import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:nba_trade/controllers/chatroom_controller.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/models/chatroom_model.dart';
import 'package:nba_trade/views/chatrooms/public_chatroom_detail.dart';

class PublicChatrooms extends StatelessWidget {
  final ChatroomController controller;
  const PublicChatrooms({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.chatrooms.length,
        itemBuilder: (context, index) {
          return OpenContainer(
            openColor: Colors.transparent,
            closedColor: Colors.transparent,
            transitionDuration: const Duration(milliseconds: 800),
            closedBuilder: (context, action) {
              return CustomPublicChatroomWidget(
                onTap: action,
                publicChatroomModel: controller.chatrooms[index],
              );
            },
            openBuilder: (context, action) {
              return PublicChatroomDetailScreen(
                publicChatroomModel: controller.chatrooms[index],
              );
            },
            openElevation: 0,
            closedElevation: 0,
            closedShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          );
        });
  }
}

class CustomPublicChatroomWidget extends StatelessWidget {
  final PublicChatroomModel publicChatroomModel;
  final VoidCallback onTap;
  const CustomPublicChatroomWidget({
    super.key,
    required this.onTap,
    required this.publicChatroomModel,
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
            // onTap: () => Get.to(() => const PublicChatroomDetailScreen()),
            leading: CircleAvatar(
                backgroundImage: NetworkImage(publicChatroomModel.image),
                radius: 25),
            title: CustomTextWidget(
                text: publicChatroomModel.communityName,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start),
            subtitle: CustomTextWidget(
                text: publicChatroomModel.subtitle,
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
