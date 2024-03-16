import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/models/chatroom_model.dart';
import 'package:nba_trade/views/chatrooms/bottom_textfield.dart';
import 'package:nba_trade/views/chatrooms/messages_part.dart';

class PublicChatroomDetailScreen extends StatelessWidget {
  final PublicChatroomModel publicChatroomModel;
  const PublicChatroomDetailScreen({
    super.key,
    required this.publicChatroomModel,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: InkWell(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Symbols.arrow_back_ios),
          ),
          flexibleSpace: const Opacity(
            opacity: 0.7,
            child: Image(
              image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVAV7IeHdUHdLV7hCe7vyxBHg75-cSsT5uZQ&usqp=CAU'),
              fit: BoxFit.cover,
            ),
          ),
          backgroundColor: Colors.transparent,
          toolbarHeight: context.height * 0.15,
          title: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(color: MyColorHelper.white),
            child: CustomTextWidget(
              text: publicChatroomModel.communityName,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              textColor: Colors.black54,
            ),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: MyColorHelper.white),
          actions: const [Icon(Icons.more_vert)],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MessagesPart(model: publicChatroomModel),
            BottomTextField(model: publicChatroomModel)
          ],
        ),
      ),
    ));
  }
}
