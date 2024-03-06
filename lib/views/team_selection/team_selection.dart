import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/controllers/universal_controller.dart';
import 'package:nba_trade/helper/appbar.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/views/team_selection/draftboard_view.dart';
import 'package:nba_trade/views/team_selection/team_view.dart';

class TeamSelection extends StatelessWidget {
  const TeamSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final UniversalController controller = Get.find();
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.grey.shade300,
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  forceMaterialTransparency: true,
                  flexibleSpace: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const CustomAppBar(title: 'NBA Team Selection'),
                      SizedBox(height: context.height * 0.03),
                      //Tabbar
                    ],
                  ),
                  bottom: TeamSelectionTabbar(context: context),
                ),
              ];
            },
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Team(players: controller.players),
                Draftboard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TeamSelectionTabbar extends StatelessWidget
    implements PreferredSizeWidget {
  final BuildContext context;
  const TeamSelectionTabbar({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
      ),
      child: ButtonsTabBar(
        physics: const NeverScrollableScrollPhysics(),
        backgroundColor: MyColorHelper.primary,
        unselectedBackgroundColor: Colors.grey[600],
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        labelStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        tabs: [
          buildTab(title: 'Your Teams', context: context),
          buildTab(title: 'Your Draft Board', context: context),
        ],
      ),
    );
  }

  Tab buildTab({required BuildContext context, required String title}) {
    return Tab(
      child: SizedBox(
        width: context.width * 0.35,
        child: CustomTextWidget(
          text: title,
          fontSize: 14.0,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w500,
          textColor: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * 0.1);
}
