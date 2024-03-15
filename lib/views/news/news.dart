import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/helper/appbar.dart';
import 'package:nba_trade/helper/text.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(title: 'News'),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const CustomNewsWidget();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomNewsWidget extends StatelessWidget {
  const CustomNewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: context.height * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://cdn.nba.com/manage/2024/03/nikola-jokic-posts-up-porzingis-1536x864.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: context.height * 0.2,
            child: const ListTile(
              title: CustomTextWidget(
                text:
                    'Power Rankings, Week 21: Nuggets jump past Celtics for No. 1 spot',
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: '1 hour ago',
                    fontSize: 12.0,
                    textColor: Colors.grey,
                  ),
                  CustomTextWidget(
                    text:
                        'We’ve raced past the three-quarter mark of the 2023-24 season, and there are only five weeks left.Two teams — the San Antonio Spurs and Washington Wizards — have officially been eliminated from playoff contention, but there’s so much more to be determined over the next 35 days and final 269 games.The Boston Celtics remain head-and-shoulders above everybody else in the combined standings, but look a little more vulnerable after two losses last week. One of those came to the defending champs, who took over the No. 1 spot in the Power Rankings after four straight weeks with the Celtics on top.',
                    maxLines: 5,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
