import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nba_trade/controllers/trade_controller.dart';
import 'package:nba_trade/controllers/universal_controller.dart';
import 'package:nba_trade/helper/appbar.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/views/trade/widgets/dropdown.dart';
import 'package:nba_trade/views/trade/widgets/trade_tabbar.dart';
import 'package:nba_trade/views/trade/widgets/trade_tabbar_view.dart';

import '../../helper/post.dart';
import '../../helper/toast.dart';

class TradeScreen extends StatelessWidget {
  TradeScreen({super.key});

  final UniversalController controller = Get.find<UniversalController>();
  final TradeController tradeController = Get.put(TradeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => DefaultTabController(
          length: tradeController.selectedTeams.length,
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
                    expandedHeight: context.height * 0.35,
                    flexibleSpace: ListView(
                      children: [
                        const CustomAppBar(title: 'Trade Machine'),
                        Row(
                          children: [
                            Expanded(
                              child: TeamsDropdown(
                                teams: controller.teams,
                                onChange: (value) {
                                  if (!tradeController.selectedTeams
                                      .contains(value)) {
                                    tradeController.selectedTeams
                                        .addNonNull(value!);
                                    tradeController.selectedTeamsPlayers
                                        .addNonNull(controller.players
                                            .where((player) =>
                                                player.teamId == value.teamId)
                                            .toList()
                                            .obs);
                                  } else {
                                    ToastMessage.showToastMessage(
                                        message:
                                            '${value?.name} is already selected.',
                                        backgroundColor: Colors.red);
                                  }
                                },
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => showDialog(
                                  context: context,
                                  builder: (builder) => MyPostDialog(
                                        onPost: (List<dynamic> title,
                                            List<dynamic> description) {
                                          tradeController.onPost(
                                              title, description);
                                        },
                                      )),
                              child: const Text('Post'),
                            ),
                            const SizedBox(width: 8.0),
                          ],
                        ),
                        TradeTabbar(controller: tradeController),
                      ],
                    ),
                  ),
                ];
              },
              body: tradeController.selectedTeams.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Center(
                        child: CustomTextWidget(
                          text:
                              'Select Team from the above dropdown to trade the players.',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          maxLines: 4,
                          textColor: Colors.black38,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        for (var i = 0;
                            i < tradeController.selectedTeams.length;
                            i++)
                          TradeTabBarView(
                            myTeamModel: tradeController.selectedTeams[i],
                            myPlayersList:
                                tradeController.selectedTeamsPlayers[i],
                          )
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

buildTabbar({required String teamName, required String image}) {
  return Tab(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.network(image, height: 50),
        const SizedBox(width: 5.0),
        CustomTextWidget(
          text: teamName,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          textColor: Colors.white,
        ),
        const SizedBox(width: 5.0),
      ],
    ),
  );
}

class CustomRichText extends StatelessWidget {
  final String heading;
  final String value;
  final bool useBlackColor;
  const CustomRichText({
    super.key,
    required this.heading,
    required this.value,
    this.useBlackColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(
            text: '$heading: ',
            style: TextStyle(
              color: useBlackColor ? Colors.black54 : Colors.white70,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: useBlackColor ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
