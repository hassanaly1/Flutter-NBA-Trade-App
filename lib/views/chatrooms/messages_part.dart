import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/controllers/chatroom_controller.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';

class MessagesPart extends StatelessWidget {
  MessagesPart({
    super.key,
    required this.model,
  });
  final dynamic model;
  final ChatroomController chatroomController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          reverse: true,
          physics: const AlwaysScrollableScrollPhysics(),
          controller: chatroomController.scrollController,
          itemCount: model.chats.length,
          itemBuilder: (BuildContext context, int index) {
            final message = model.chats[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: message.isSender
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  if (!message.isSender)
                    const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/user2.jpg'),
                        radius: 20),
                  ChatCard(message: message),
                  if (message.isSender)
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/user-profile.jpg'),
                      radius: 20,
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  final dynamic message;
  const ChatCard({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: MyColorHelper.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12.0),
              topRight: const Radius.circular(12.0),
              bottomLeft:
                  message.isSender ? const Radius.circular(12.0) : Radius.zero,
              bottomRight:
                  message.isSender ? Radius.zero : const Radius.circular(16.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 15.0,
                spreadRadius: 5.0,
              ),
              const BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: message.isSender
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: message.user.userName,
                      fontSize: 10,
                      textColor: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomTextWidget(
                      text: message.message,
                      fontSize: 14,
                      textColor: Colors.black,
                      maxLines: 10,
                    ),
                  ],
                ),
                Wrap(
                  children: [
                    CustomTextWidget(
                      text:
                          '${message.messageTime.hour.toString()} : ${message.messageTime.minute.toString()}',
                      fontSize: 10,
                      textColor: Colors.black,
                    ),
                    const SizedBox(width: 6.0),
                    Visibility(
                      visible: message.isSender,
                      child: const Icon(
                        Icons.done,
                        size: 15.0,
                        color: MyColorHelper.primary,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
