import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nba_trade/controllers/compare_controller.dart';
import 'package:nba_trade/controllers/universal_controller.dart';
import 'package:nba_trade/helper/appbar.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/models/player_stats_model.dart';
import 'package:nba_trade/views/compare/compare_dropdown.dart';

class ComparePlayerScreen extends StatelessWidget {
  ComparePlayerScreen({super.key});

  final CompareController controller = Get.put(CompareController());
  final UniversalController universalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              stretch: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              forceMaterialTransparency: true,
              expandedHeight: context.height * 0.1,
              flexibleSpace: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  CustomAppBar(title: 'Compare NBA Players'),
                ],
              ),
            ),
          ];
        },
        body: Obx(
          () => ListView(
            children: [
              //Profile & Dropdown
              TopSection(
                controller: controller,
                universalController: universalController,
              ),
              //Link Container
              const LinkCard(),
              //Players Information
              const CompareHeading(heading: 'Information'),
              buildPlayerStatCard('Season',
                  (player) => player?.season?.toString() ?? '', controller),
              buildPlayerStatCard('Name',
                  (player) => player?.name?.toString() ?? '', controller),
              buildPlayerStatCard('Team',
                  (player) => player?.team?.toString() ?? '', controller),
              buildPlayerStatCard('Position',
                  (player) => player?.position?.toString() ?? '', controller),
              const CompareHeading(heading: 'Season Statistics'),
              buildPlayerStatCard('Games',
                  (player) => player?.games?.toString() ?? '', controller),
              buildPlayerStatCard(
                  'Fantasy Points',
                  (player) => player?.fantasyPoints?.toString() ?? '',
                  controller),
              buildPlayerStatCard('Minutes',
                  (player) => player?.minutes?.toString() ?? '', controller),
              buildPlayerStatCard(
                  'Field Goals Made',
                  (player) => player?.fieldGoalsMade?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'Field Goals Attempted',
                  (player) => player?.fieldGoalsAttempted?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'Field Goals Percentage',
                  (player) => player?.fieldGoalsPercentage?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'Effective Field Goals Percentage',
                  (player) =>
                      player?.effectiveFieldGoalsPercentage?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'Free Throws Made',
                  (player) => player?.freeThrowsMade?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'Free Throws Attempted',
                  (player) => player?.freeThrowsAttempted?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'Free Throws Percentage',
                  (player) => player?.freeThrowsPercentage?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'Offensive Rebounds',
                  (player) => player?.offensiveRebounds?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'Defensive Rebounds',
                  (player) => player?.defensiveRebounds?.toString() ?? '',
                  controller),
              buildPlayerStatCard('Total Rebounds',
                  (player) => player?.rebounds.toString() ?? '', controller),
              buildPlayerStatCard(
                  'Offensive Rebounds Percentage',
                  (player) =>
                      player?.offensiveReboundsPercentage?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'Defensive Rebounds Percentage',
                  (player) =>
                      player?.defensiveReboundsPercentage?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'Total Rebounds Percentage',
                  (player) => player?.totalReboundsPercentage?.toString() ?? '',
                  controller),
              buildPlayerStatCard('Assists',
                  (player) => player?.assists?.toString() ?? '', controller),
              buildPlayerStatCard('Steals',
                  (player) => player?.steals?.toString() ?? '', controller),
              buildPlayerStatCard(
                  'Blocked Shots',
                  (player) => player?.blockedShots?.toString() ?? '',
                  controller),
              buildPlayerStatCard('Turnovers',
                  (player) => player?.turnovers?.toString() ?? '', controller),
              buildPlayerStatCard(
                  'Personal Fouls',
                  (player) => player?.personalFouls?.toString() ?? '',
                  controller),
              buildPlayerStatCard('Points',
                  (player) => player?.points?.toString() ?? '', controller),
              buildPlayerStatCard(
                  'True Shooting Attempts',
                  (player) => player?.trueShootingAttempts?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'True Shooting Percentage',
                  (player) => player?.trueShootingPercentage?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'Player Efficiency Rating',
                  (player) => player?.playerEfficiencyRating?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'Assists Percentage',
                  (player) => player?.assistsPercentage?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'Steals Percentage',
                  (player) => player?.stealsPercentage?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'Blocks Percentage',
                  (player) => player?.blocksPercentage?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'Turnovers Percentage',
                  (player) => player?.turnOversPercentage?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'Usage Rate Percentage',
                  (player) => player?.usageRatePercentage?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'Fantasy Points FanDuel',
                  (player) => player?.fantasyPointsFanDuel?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'Fantasy Points DraftKings',
                  (player) => player?.fantasyPointsDraftKings?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'Fantasy Points Yahoo',
                  (player) => player?.fantasyPointsYahoo?.toString() ?? '',
                  controller),
              buildPlayerStatCard('Plus-Minus',
                  (player) => player?.plusMinus?.toString() ?? '', controller),
              buildPlayerStatCard(
                  'Double Doubles',
                  (player) => player?.doubleDoubles?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'Triple Doubles',
                  (player) => player?.tripleDoubles?.toString() ?? '',
                  controller),
              buildPlayerStatCard(
                  'Fantasy Points FantasyDraft',
                  (player) =>
                      player?.fantasyPointsFantasyDraft?.toString() ?? '',
                  controller),
            ],
          ),
        ),
      ),
    ));
  }
}

Widget buildPlayerStatCard(
    String label,
    String? Function(PlayerStatsModel?) getValue,
    CompareController controller) {
  return CustomStatsCard(
    text: label,
    value1: getValue(controller.selectedPlayer1.value)?.toString() ??
        'Not Specified',
    value2: getValue(controller.selectedPlayer2.value)?.toString() ??
        'Not Specified',
  );
}

class TopSection extends StatelessWidget {
  const TopSection({
    super.key,
    required this.controller,
    required this.universalController,
  });

  final CompareController controller;
  final UniversalController universalController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.35,
      color: MyColorHelper.primaryBackground,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.blue,
                    Colors.red,
                  ],
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: context.height * 0.2,
                      color: Colors.transparent,
                      child: Image.network(
                          'https://cdn.nba.com/headshots/nba/latest/1040x760/203939.png'),
                    ),
                    CompareDropdown(
                      players: universalController.playersStatistics,
                      onChanged: (value) {
                        controller.selectedPlayer1.value = value;
                        debugPrint(controller.selectedPlayer1 as String?);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.blue,
                    Colors.red,
                  ],
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: context.height * 0.2,
                      color: Colors.transparent,
                      child: Image.network(
                          'https://cdn.nba.com/headshots/nba/latest/1040x760/203939.png'),
                    ),
                    CompareDropdown(
                      players: universalController.playersStatistics,
                      onChanged: (value) {
                        controller.selectedPlayer2.value = value;
                        debugPrint(controller.selectedPlayer2 as String?);
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class ProfileAndDropdownWidget extends StatelessWidget {
//   const ProfileAndDropdownWidget({
//     super.key,
//     required this.universalController,
//     required this.controller,
//   });
//
//   final UniversalController universalController;
//   final CompareController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.all(4.0),
//         child: Container(
//           decoration: const BoxDecoration(
//               gradient: LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             colors: [
//               Colors.blue,
//               Colors.red,
//             ],
//           )),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 height: context.height * 0.2,
//                 color: Colors.transparent,
//                 child: Image.network(
//                     'https://cdn.nba.com/headshots/nba/latest/1040x760/203939.png'),
//               ),
//               CompareDropdown(
//                 players: universalController.players,
//                 onChanged: (value) {},
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class LinkCard extends StatelessWidget {
  const LinkCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: context.height * 0.1,
      color: MyColorHelper.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.xTwitter),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      child: CustomTextWidget(
                          text: 'https://fanspo.com/nba_trade'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(FontAwesomeIcons.copy),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.squareShareNodes),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomStatsCard extends StatelessWidget {
  final String text;
  final String value1;
  final String value2;
  const CustomStatsCard({
    super.key,
    required this.text,
    required this.value1,
    required this.value2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Container(
        height: context.height * 0.08,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                flex: 2,
                child: CustomTextWidget(
                  text: value1,
                  textAlign: TextAlign.center,
                )),
            Expanded(
              flex: 3,
              child: Container(
                height: context.height * 0.08,
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: MyColorHelper.primaryBackground,
                  border: Border.all(color: Colors.black26),
                ),
                child: Center(
                  child: CustomTextWidget(
                    text: text,
                    maxLines: 2,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: CustomTextWidget(
                  text: value2,
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }
}

class CompareHeading extends StatelessWidget {
  final String heading;
  const CompareHeading({
    super.key,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 16.0, bottom: 8.0, left: 8.0, right: 8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: MyColorHelper.primary,
            borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
          child: CustomTextWidget(
            text: heading,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
            textColor: MyColorHelper.white,
          ),
        ),
      ),
    );
  }
}
