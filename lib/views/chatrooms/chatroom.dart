import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/helper/appbar.dart';
import 'package:nba_trade/views/chatrooms/chatroom_tabbar.dart';

class ChatroomScreen extends StatelessWidget {
  const ChatroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.grey.shade300,
          body: InkWell(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.transparent,
                      forceMaterialTransparency: true,
                      expandedHeight: context.height * 0.35,
                      flexibleSpace: ListView(
                        children: [
                          const CustomAppBar(title: 'Chatrooms'),
                          Card(
                            elevation: 5.0,
                            child: Container(
                              height: 100,
                              color: Colors.white,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return CustomStoryWidget(
                                      title: 'User${index + 1}',
                                      imageUrl: index % 2 == 0
                                          ? 'assets/images/user2.jpg'
                                          : 'assets/images/user-profile.jpg');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      bottom: ChatroomTabbar(context: context),
                    ),
                  ];
                },
                body: Container(
                  color: Colors.red,
                )),
          ),
        ),
      ),
    );
  }
}

class CustomStoryWidget extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CustomStoryWidget(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      margin: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
