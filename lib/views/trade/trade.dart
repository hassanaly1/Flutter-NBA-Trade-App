import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nba_trade/controllers/universal_controller.dart';
import 'package:nba_trade/helper/appbar.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/dropdown.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/models/my_team_modal.dart';
import 'package:nba_trade/views/team_selection/widgets/player_card.dart';

class TradeScreen extends StatelessWidget {
  TradeScreen({super.key});

  final UniversalController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => DefaultTabController(
          length: controller.selectedTeams.length,
          child: Scaffold(
            backgroundColor: Colors.grey.shade300,
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
                        CustomDropdown(items: controller.teams),
                        // TradeTabbar(context: context)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: MyColorHelper.primaryBackground,
                                border: Border.all(color: Colors.grey)),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Obx(
                                      () => ButtonsTabBar(
                                        height: 70,
                                        backgroundColor: MyColorHelper.primary,
                                        unselectedBackgroundColor:
                                            Colors.grey[600],
                                        unselectedLabelStyle: const TextStyle(
                                            color: Colors.white),
                                        labelStyle: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        tabs: [
                                          for (var i = 0;
                                              i <
                                                  controller
                                                      .selectedTeams.length;
                                              i++)
                                            buildTabbar(
                                                teamName: controller
                                                        .selectedTeams[i]
                                                        .name ??
                                                    '',
                                                image: controller
                                                        .selectedTeams[i]
                                                        .wikipediaLogoUrl ??
                                                    'https://img.freepik.com/free-vector/bird-colorful-logo-gradient-vector_343694-1365.jpg?size=338&ext=jpg&ga=GA1.1.1314780943.1709596800&semt=ais'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    //  bottom: TradeTabbar(context: context),
                  ),
                ];
              },
              body: controller.selectedTeams.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Center(
                        child: CustomTextWidget(
                          text:
                              'Select Team from the above dropdown to trade the players.',
                          fontSize: 16.0,
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
                            i < controller.selectedTeams.length;
                            i++)
                          TradeTabbarView(
                            myTeamModel: controller.selectedTeams[i],
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

class TradeTabbarView extends StatelessWidget {
  final MyTeamModel myTeamModel;
  TradeTabbarView({
    super.key,
    e,
    required this.myTeamModel,
  });

  final UniversalController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: MyColorHelper.primaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.black12)),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: const BoxDecoration(
                        color: MyColorHelper.primary,
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.3),
                                spreadRadius: 2.0,
                                blurRadius: 10.0,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.network(
                                myTeamModel.wikipediaLogoUrl ?? '',
                                height: 50,
                              ),
                              const SizedBox(width: 8.0),
                              CustomTextWidget(
                                text: myTeamModel.name ?? 'Not Specified',
                                textColor: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          indent: 40.0,
                          endIndent: 40.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomRichText(
                                heading: myTeamModel.city ?? 'Not Specified',
                                value: 'City'),
                            CustomRichText(
                                heading:
                                    myTeamModel.conference ?? 'Not Specified',
                                value: 'Conference'),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomRichText(
                                heading:
                                    (myTeamModel.division ?? 'Not Specified'),
                                value: 'Division'),
                            CustomRichText(
                                heading: (myTeamModel.globalTeamID.toString() ??
                                    'Not Specified'),
                                value: 'Global Team ID'),
                            CustomRichText(
                                heading:
                                    myTeamModel.headCoach ?? 'Not Specified',
                                value: 'Head Coach'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ReorderableListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        for (int index = 0; index < 20; index += 1)
                          ReorderableDelayedDragStartListener(
                            key: ValueKey(controller.players[index]
                                .playerId), // Use a unique identifier
                            index: index,
                            child: NBAPlayerCard(
                              playerModel: controller.players[index],
                              showAddIcon: false,
                            ),
                          ),
                      ],
                      onReorder: (int oldIndex, int newIndex) {
                        final player = controller.players.removeAt(oldIndex);
                        controller.players.insert(
                            newIndex > oldIndex ? newIndex - 1 : newIndex,
                            player);
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class CustomRichText extends StatelessWidget {
  final String heading;
  final String value;
  const CustomRichText({
    super.key,
    required this.heading,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(
            text: '$value: ',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: heading,
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
