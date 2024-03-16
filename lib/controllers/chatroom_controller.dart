import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:nba_trade/helper/toast.dart';
import 'package:nba_trade/models/chatroom_model.dart';
import 'package:nba_trade/models/user_model.dart';

class ChatroomController extends GetxController {
  List<PublicChatroomModel> chatrooms = <PublicChatroomModel>[].obs;
  List<InboxMessageModel> inboxMessages = <InboxMessageModel>[].obs;
  TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() async {
    chatrooms.assignAll(generateDummyChatrooms());
    inboxMessages.assignAll(generateDummyInboxMessages());
    super.onInit();
  }

  Future<void> sendMessage(
    dynamic model,
    ChatMessageModel chatMessageModel,
  ) async {
    if (textEditingController.text.isNotEmpty) {
      model.chats.insert(0, chatMessageModel);
      textEditingController.clear();
      FocusManager.instance.primaryFocus?.unfocus();
    } else {
      ToastMessage.showToastMessage(
          message: 'Please write a Message first.',
          backgroundColor: Colors.red);
    }
  }

  List<PublicChatroomModel> generateDummyChatrooms() {
    List<PublicChatroomModel> publicChatrooms = [];
    for (int i = 1; i <= 10; i++) {
      publicChatrooms.add(
        PublicChatroomModel(
          communityName: "Community $i",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK-aiZ6_qlwU1funGvExQ129NgPtv2Y80Pi2IDI4gRIZEYvunGh-yud9GsdwrRo7H0Kd0&usqp=CAU",
          subtitle: "Subtitle for Community $i",
          chats: generateDummyChats(),
        ),
      );
    }
    return publicChatrooms;
  }

  List<InboxMessageModel> generateDummyInboxMessages() {
    List<InboxMessageModel> inboxMessages = [];

    for (int i = 0; i <= 10; i++) {
      inboxMessages.add(
        InboxMessageModel(
          user: UserModel(
            userId: '1',
            userName: 'James Anderson',
            userImage:
                'https://media.gettyimages.com/id/1362328147/photo/confident-young-asian-man-looking-at-smartphone-while-working-on-laptop-computer-in-home.jpg?s=612x612&w=0&k=20&c=mNSeG8QAcTuwRlf1Y8jHrLcxaLE-kDov-RpiXLxuZho=',
          ),
          chats: generateDummyChats(),
        ),
      );
    }
    return inboxMessages;
  }

  RxList<ChatMessageModel> generateDummyChats() {
    RxList<ChatMessageModel> chats = <ChatMessageModel>[].obs;
    // Adding some dummy chat messages
    chats.add(
      ChatMessageModel(
        messageId: '1',
        message: "Hi there!",
        isSender: false,
        user: UserModel(userId: '1', userName: 'James Anderson', userImage: ''),
        type: MessageType.text,
        messageTime: DateTime.now(),
        status: MessageStatus.sent,
      ),
    );
    chats.add(
      ChatMessageModel(
        messageId: '2',
        message: "Hello! How are you?",
        isSender: true,
        user: UserModel(
          userId: '2',
          userName: 'You',
          userImage:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK-aiZ6_qlwU1funGvExQ129NgPtv2Y80Pi2IDI4gRIZEYvunGh-yud9GsdwrRo7H0Kd0&usqp=CAU',
        ),
        type: MessageType.text,
        messageTime: DateTime.now(),
        status: MessageStatus.sent,
      ),
    );
    return chats;
  }

  void scrollDown() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      );
    }
  }
}
