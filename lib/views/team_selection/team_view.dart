import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/searchbar.dart';

import '../../controllers/team_selection_controller.dart';
import 'player_card.dart';

class Team extends StatelessWidget {
  final controller = Get.find<TeamSelectionController>();

  Team({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: DefaultTabController(
          length: 6,
          child: Container(
            decoration: const BoxDecoration(color: MyColorHelper.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: MyColorHelper.primaryBackground,
                        border: Border.all(color: Colors.black12),
                      ),
                      child: TabBar(
                        padding: EdgeInsets.zero,
                        isScrollable: false,
                        dividerColor: Colors.transparent,
                        tabAlignment: TabAlignment.fill,
                        unselectedLabelStyle: const TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                        labelStyle: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: MyColorHelper.primary,
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: controller.tabs.map((e) => Tab(text: e)).toList(),
                        labelColor: Colors.black,
                        onTap: (int i) => controller.loadPlayers(i),
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: MyColorHelper.primary,
                      ),
                    ),
                  ),
                ),
                CustomSearchBar(
                  onChanged: (String? str) {},
                  // onChanged: controller.searchPlayers,
                ),
                Expanded(
                  child: TabBarView(
                    children: controller.tabs
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 5.0,
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: MyColorHelper.primaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Obx(() => ListView.builder(
                                        controller: controller.scrollController,
                                        shrinkWrap: true,
                                        itemCount:
                                            controller.playersLength.value,
                                        itemBuilder: (context, index) {
                                          return NBAPlayerCard(
                                            playerModel: controller
                                                .filteredPlayers[index],
                                          );
                                        },
                                      )),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
