import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/controllers/universal_controller.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/searchbar.dart';
import 'package:nba_trade/models/my_player_model.dart';
import 'package:nba_trade/views/team_selection/widgets/all.dart';
import 'package:nba_trade/views/team_selection/widgets/c.dart';
import 'package:nba_trade/views/team_selection/widgets/pf.dart';
import 'package:nba_trade/views/team_selection/widgets/pg.dart';
import 'package:nba_trade/views/team_selection/widgets/sf.dart';
import 'package:nba_trade/views/team_selection/widgets/sg.dart';

class Team extends StatelessWidget {
  final List<MyPlayerModel> players;
  final UniversalController controller = Get.find();

  Team({super.key, required this.players});
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
                      child: const TabBar(
                        padding: EdgeInsets.zero,
                        isScrollable: false,
                        dividerColor: Colors.transparent,
                        tabAlignment: TabAlignment.fill,
                        unselectedLabelStyle: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                        labelStyle: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: MyColorHelper.primary,
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: [
                          Tab(text: 'ALL'),
                          Tab(text: 'PG'),
                          Tab(text: 'SG'),
                          Tab(text: 'PF'),
                          Tab(text: 'SF'),
                          Tab(text: 'C'),
                        ],
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: MyColorHelper.primary,
                      ),
                    ),
                  ),
                ),
                CustomSearchBar(
                  onChanged: controller.filterPlayers,
                ),
                Obx(
                  () => Expanded(
                    child: TabBarView(
                      children: [
                        AllView(players: controller.filteredPlayers),
                        PGView(
                          players: filterPlayersByPosition(
                            controller.filteredPlayers,
                            'PG',
                          ),
                        ),
                        SGView(
                          players: filterPlayersByPosition(
                            controller.filteredPlayers,
                            'SG',
                          ),
                        ),
                        PFView(
                          players: filterPlayersByPosition(
                            controller.filteredPlayers,
                            'PF',
                          ),
                        ),
                        SFView(
                          players: filterPlayersByPosition(
                            controller.filteredPlayers,
                            'SF',
                          ),
                        ),
                        CView(
                          players: filterPlayersByPosition(
                            controller.filteredPlayers,
                            'C',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<MyPlayerModel> filterPlayersByPosition(
    List<MyPlayerModel> players,
    String position,
  ) {
    return players
        .where((player) => player.depthChartPosition == position)
        .toList();
  }
}
