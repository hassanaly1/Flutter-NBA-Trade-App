import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/views/compare/compare.dart';
import 'package:nba_trade/views/trade/trade.dart';

class PlayerProfileScreen extends StatelessWidget {
  PlayerProfileScreen({super.key});

  final List<Map<String, String>> generalInfo = [
    {"title": "Name", "subtitle": "Kyle Terrell Lowry"},
    {"title": "Position", "subtitle": "Point Guard"},
    {"title": "Shooting Hand", "subtitle": "Right"},
    {"title": "Age", "subtitle": "37 years old"},
    {"title": "NBA Debut", "subtitle": "November 01, 2006"},
    {"title": "College", "subtitle": "Villanova"},
    {"title": "City", "subtitle": "Villanova"},
    {"title": "Country", "subtitle": "Pennsylvania"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: MyColorHelper.primaryBackground,
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  stretch: true,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  forceMaterialTransparency: true,
                  expandedHeight: context.height * 0.4,
                  flexibleSpace: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      TopProfileContainer(),
                    ],
                  ),
                ),
              ];
            },
            body: Container(
              color: Colors.transparent,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const CompareHeading(heading: 'General Information'),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: generalInfo.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 3),
                    itemBuilder: (context, index) {
                      final info = generalInfo[index];
                      return CustomInfo(
                          title: info["title"] ?? "",
                          subtitle: info["subtitle"] ?? "");
                    },
                  ),
                  const CompareHeading(heading: 'Contract'),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: generalInfo.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 3),
                    itemBuilder: (context, index) {
                      final info = generalInfo[index];
                      return CustomInfo(
                          title: info["title"] ?? "",
                          subtitle: info["subtitle"] ?? "");
                    },
                  ),
                  const CompareHeading(heading: 'Team History'),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: generalInfo.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 3),
                    itemBuilder: (context, index) {
                      final info = generalInfo[index];
                      return CustomInfo(
                          title: info["title"] ?? "",
                          subtitle: info["subtitle"] ?? "");
                    },
                  ),
                  const CompareHeading(heading: 'Awards'),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: generalInfo.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 3),
                    itemBuilder: (context, index) {
                      final info = generalInfo[index];
                      return CustomInfo(
                          title: info["title"] ?? "",
                          subtitle: info["subtitle"] ?? "");
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopProfileContainer extends StatelessWidget {
  const TopProfileContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      height: context.height * 0.4,
      decoration: const BoxDecoration(
        color: MyColorHelper.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(85, 0, 0, 0),
            blurRadius: 5.0,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Symbols.arrow_back_ios,
              color: MyColorHelper.white,
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/player1.png'),
              ),
              CustomTextWidget(
                text: 'KYLE LOWRY',
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                textColor: MyColorHelper.white,
              ),
              CustomTextWidget(
                text: 'Charlotte Hornets •#1 • Point Guard',
                fontSize: 14.0,
                textColor: MyColorHelper.white,
              ),
              CustomRichText(heading: 'HT/WT', value: "6' 0\", 196 lbs"),
              CustomRichText(heading: 'DOB', value: '3/25/1986 (37)'),
              CustomRichText(heading: 'COLLEGE', value: 'Villanova'),
              CustomRichText(heading: 'STATUS', value: 'Acive')
            ],
          ),
          const Icon(
            Symbols.arrow_back_ios,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }
}

class CustomInfo extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomInfo({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CustomTextWidget(text: title, fontSize: 14.0),
      subtitle: CustomTextWidget(
          text: subtitle, fontSize: 14.0, fontWeight: FontWeight.w600),
    );
  }
}
