import 'package:flutter/material.dart';
import 'package:nba_trade/helper/appbar.dart';
import 'package:nba_trade/models/chatroom_model.dart';
import 'package:nba_trade/views/chatrooms/bottom_textfield.dart';
import 'package:nba_trade/views/chatrooms/messages_part.dart';

class InboxDetailScreen extends StatelessWidget {
  final InboxMessageModel inboxMessage;
  const InboxDetailScreen({super.key, required this.inboxMessage});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InkWell(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: Column(
            children: [
              CustomAppBar(title: inboxMessage.user.userName),
              MessagesPart(model: inboxMessage),
              BottomTextField(model: inboxMessage)
            ],
          ),
        ),
      ),
    );
  }
}
