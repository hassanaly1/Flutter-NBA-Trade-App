import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nba_trade/controllers/chatroom_controller.dart';
import 'package:nba_trade/models/chatroom_model.dart';
import 'package:nba_trade/models/user_model.dart';

class BottomTextField extends StatelessWidget {
  final dynamic model;
  BottomTextField({
    super.key,
    required this.model,
  });

  final ChatroomController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Symbols.control_point_duplicate, size: 30),
              onPressed: () {},
            ),
            Expanded(
              child: TextFormField(
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                // onChanged: controller.setTextValue,
                onChanged: (newValue) {
                  // Update the textEditingController's text value manually
                  controller.textEditingController.text = newValue;
                },
                controller: controller.textEditingController,
                maxLines: 1,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 10),
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black54),
                      borderRadius: BorderRadius.circular(20.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black54),
                      borderRadius: BorderRadius.circular(20.0)),
                  border: InputBorder.none,
                  hintText: 'Message',
                ),
              ),
            ),
            IconButton(
              disabledColor: Colors.black38,
              icon: const Icon(Icons.send_outlined, size: 20),
              onPressed:
                  // controller.textEditingController.text.isEmpty
                  //     ? null
                  //     :
                  () async {
                ChatMessageModel newMessage = ChatMessageModel(
                  messageId: '1',
                  message: controller.textEditingController.text.trim(),
                  isSender: true,
                  user: UserModel(
                    userId: '1',
                    userName: 'You',
                    userImage: 'assets/images/user-profile.jpg',
                  ),
                  type: MessageType.text,
                  messageTime: DateTime.now(),
                  status: MessageStatus.sent,
                );
                try {
                  await controller.sendMessage(model, newMessage);
                } catch (e) {
                  debugPrint('Error sending message: $e');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
