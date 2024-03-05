import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nba_trade/controllers/universal_controller.dart';
import 'package:nba_trade/helper/appbar.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/views/dashboard/widgets/module_card.dart';
import 'package:nba_trade/views/team_selection/team_selection.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  List<Map<String, dynamic>> gridItemsData = [
    {
      "text": "Team Selection",
      "icon": Symbols.diversity_2,
      "onTap": () => Get.to(() => const TeamSelection())
    },
    {"text": "Trade", "icon": Symbols.send_time_extension, "onTap": () {}},
    {"text": "NBA Contacts", "icon": Symbols.diversity_3, "onTap": () {}},
    {"text": "Approval", "icon": Symbols.order_approve, "onTap": () {}},
    {"text": "Compare Players", "icon": Symbols.compare_arrows, "onTap": () {}},
    {"text": "News", "icon": Symbols.brand_awareness, "onTap": () {}},
    {"text": "Spaces", "icon": Symbols.public, "onTap": () {}},
    {"text": "Chatrooms", "icon": Symbols.inbox, "onTap": () {}},
  ];

  @override
  Widget build(BuildContext context) {
    UniversalController controller = Get.put(UniversalController());

    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Obx(
          () => Scaffold(
            backgroundColor: controller.isError.value
                ? MyColorHelper.primary
                : MyColorHelper.white,
            body: Obx(
              () {
                if (controller.isError.value) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/app-logo.png',
                          height: context.height * 0.1,
                        ),
                        SizedBox(height: context.height * 0.02),
                        const SpinKitDoubleBounce(color: MyColorHelper.white),
                      ],
                    ),
                  );
                }
                return NestedScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          backgroundColor: Colors.transparent,
                          forceMaterialTransparency: true,
                          expandedHeight: 200.0,
                          flexibleSpace: FlexibleSpaceBar(
                            collapseMode: CollapseMode.pin,
                            background: RefreshIndicator(
                              onRefresh: controller.refreshData,
                              child: ListView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  //TopPart
                                  dashboardHeader(context),
                                  // CenterPart
                                  ModulesCard(gridItemsData: gridItemsData),
                                ],
                              ),
                            ),
                          ),
                          bottom: CustomTabbar(context: context),
                        ),
                      ];
                    },
                    body: TabBarView(
                      children: [
                        Container(
                          color: MyColorHelper.primaryBackground,
                          child: ListView.builder(
                            //shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.yellowAccent,
                                  child: Image.asset(
                                      'assets/images/newsplayers1.jpg'),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          color: MyColorHelper.primaryBackground,
                        ),
                        Container(
                          color: MyColorHelper.primaryBackground,
                        ),
                        Container(
                          color: MyColorHelper.primaryBackground,
                        ),
                      ],
                    ));
              },
            ),
          ),
        ),
      ),
    );
  }

//-- Top Part of Screen Widgets.
  dashboardHeader(BuildContext context) {
    return Container(
      height: Get.height * 0.2,
      color: Colors.transparent,
      child: const CustomAppBar(
        title: 'NBA Trade Machine',
        showSearchBar: true,
      ),
    );
  }
}

class CustomTabbar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;

  const CustomTabbar({
    super.key,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: MyColorHelper.primaryBackground,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
          child: ButtonsTabBar(
            contentPadding: EdgeInsets.symmetric(
                vertical: 4.0, horizontal: context.width * 0.03),
            decoration: BoxDecoration(
              color: MyColorHelper.primary,
              borderRadius: BorderRadius.circular(18.0),
            ),
            unselectedDecoration: BoxDecoration(
              color: MyColorHelper.white,
              borderRadius: BorderRadius.circular(18.0),
            ),
            labelStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
              fontSize: 10.0,
            ),
            unselectedLabelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontFamily: 'Roboto',
            ),
            tabs: const [
              Tab(
                text: 'My feeds',
                icon: Icon(Symbols.feed),
              ),
              Tab(
                text: 'Trending',
                icon: Icon(Symbols.trending_up),
              ),
              Tab(
                text: 'New',
                icon: Icon(Symbols.autorenew),
              ),
              Tab(
                text: 'Top',
                icon: Icon(Symbols.subheader_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * 0.5);
}
