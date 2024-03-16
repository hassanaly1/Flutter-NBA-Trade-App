import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/helper/appbar.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';

class SpaceScreen extends StatelessWidget {
  const SpaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(title: 'Spaces'),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const CustomSpaceCard();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomSpaceCard extends StatelessWidget {
  const CustomSpaceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
      child: Card(
        color: Colors.grey.shade200,
        elevation: 2.0,
        child: Container(
          height: context.height * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: const DecorationImage(
                image: AssetImage(
                  "assets/images/newsplayers2.png",
                ),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                color: Colors.transparent,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(CupertinoIcons.share, color: Colors.transparent),
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/newsplayers1.jpg'),
                        radius: 50,
                      ),
                      Icon(CupertinoIcons.share, color: Colors.white),
                    ],
                  ),
                ),
              )),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CustomTextWidget(
                      text: 'Trade Community',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                    const CustomTextWidget(
                      text: 's/trade_community',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      textColor: Colors.black54,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const CustomTextWidget(
                            text: 's/general',
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            textColor: Colors.black54,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: MyColorHelper.primary.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(
                                8.0), // Button border radius
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 16.0),
                              child: CustomTextWidget(
                                text: 'Joined',
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                textColor: MyColorHelper.white,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const CustomTextWidget(
                            text: '167k Members',
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            textColor: Colors.black54,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
