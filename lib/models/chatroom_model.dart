import 'package:get/get.dart';
import 'package:nba_trade/models/user_model.dart';

enum MessageType { text, image, file }

enum MessageStatus { sent, delivered, read }

class PublicChatroomModel {
  final String communityName;
  final String image;
  final String subtitle;
  RxList<ChatMessageModel> chats = <ChatMessageModel>[].obs;

  PublicChatroomModel({
    required this.communityName,
    required this.image,
    required this.subtitle,
    required this.chats,
  });
}

class InboxMessageModel {
  final UserModel user;
  RxList<ChatMessageModel> chats = <ChatMessageModel>[].obs;
  // final List<ChatMessageModel> chats;

  InboxMessageModel({
    required this.user,
    required this.chats,
  });
}

class ChatMessageModel {
  final String messageId;
  final String message;
  final bool isSender;
  final UserModel user;
  final MessageType type;
  final DateTime messageTime;
  final MessageStatus status;

  ChatMessageModel({
    required this.messageId,
    required this.message,
    required this.isSender,
    required this.user,
    required this.type,
    required this.messageTime,
    required this.status,
  });
}
