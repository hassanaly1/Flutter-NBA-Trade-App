import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nba_trade/controllers/universal_controller.dart';
import 'package:nba_trade/helper/appbar.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/views/compare/compare.dart';
import 'package:nba_trade/views/contracts/contracts.dart';
import 'package:nba_trade/views/dashboard/widgets/module_card.dart';
import 'package:nba_trade/views/post/post_detail.dart';
import 'package:nba_trade/views/team_selection/team_selection.dart';
import 'package:nba_trade/views/trade/trade.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final List<Map<String, dynamic>> gridItemsData = [
    {
      "text": "Team Selection",
      "icon": Symbols.diversity_2,
      "onTap": () => Get.to(() => const TeamSelection())
    },
    {
      "text": "Trade",
      "icon": Symbols.send_time_extension,
      "onTap": () => Get.to(() => TradeScreen())
    },
    {
      "text": "NBA Contacts",
      "icon": Symbols.diversity_3,
      "onTap": () => Get.to(() => const ContractScreen())
    },
    // {"text": "Approval", "icon": Symbols.order_approve, "onTap": () {}},
    {
      "text": "Compare",
      "icon": Symbols.compare_arrows,
      "onTap": () => Get.to(() => ComparePlayerScreen())
    },
    {"text": "News", "icon": Symbols.brand_awareness, "onTap": () {}},
    {"text": "Spaces", "icon": Symbols.public, "onTap": () {}},
    {"text": "Chatrooms", "icon": Symbols.inbox, "onTap": () {}},
  ];

  @override
  Widget build(BuildContext context) {
    UniversalController controller = Get.put(UniversalController());

    return Obx(
      () => SafeArea(
          child: (controller.isError.value && !controller.isApiDataCalled.value)
              ? Scaffold(
                  backgroundColor: MyColorHelper.primary,
                  body: Padding(
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
                  ),
                )
              : DefaultTabController(
                  length: 4,
                  child: Scaffold(
                      backgroundColor: MyColorHelper.white,
                      body: NestedScrollView(
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
                                  background: ListView(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: [
                                      //TopPart
                                      dashboardHeader(context),
                                      // CenterPart
                                      ModulesCard(gridItemsData: gridItemsData),
                                    ],
                                  ),
                                ),
                                bottom: CustomTabbar(
                                  context: context,
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
                            ];
                          },
                          body: TabBarView(
                            children: [
                              Container(
                                color: MyColorHelper.secondaryBackground
                                    .withOpacity(0.5),
                                child: ListView.builder(
                                  //shrinkWrap: true,
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return const PostWidget();
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
                          ))),
                )),
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

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => PostDetailScreen()),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4.0),
                height: 40,
                color: MyColorHelper.white,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user2.jpg'),
                    ),
                    CustomTextWidget(
                      text: 's/Space',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                    CustomTextWidget(
                      text: 'Posted by: James Anderson',
                      fontSize: 12.0,
                    ),
                    CustomTextWidget(
                      text: '3 days ago',
                      fontSize: 10.0,
                      textColor: Colors.black38,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 160,
                child: Row(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: 4,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          if (index < 3) {
                            return Container(
                              color: [
                                Colors.blueAccent.withOpacity(0.25),
                                Colors.greenAccent.withOpacity(0.25),
                                Colors.orangeAccent.withOpacity(0.25),
                              ][index],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/player${index + 1}.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              color: Colors.redAccent.withOpacity(0.25),
                              child: const Center(
                                child: Text(
                                  '+1',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: MyColorHelper.primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                              text: 'Title',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomTextWidget(
                              text:
                                  'This would be a MASSIVE upgrade over Wiggins 29% from 3 and Moody 36%. Does anyone REALLY want to face the Warriors in the playoffs with a healthy Steph and Dray shooting more 3s than anyone on 38-40% as a team? Hell no! That\'s why this trade is worth the FRP. They will live and die by the 3 but they get hot they can torch anyone. Twolves... Nuggets... Lakers... So watch out Celtics... Curry could do something historical this year.',
                              fontSize: 12.0,
                              maxLines: 6,
                              fontWeight: FontWeight.w300,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                color: MyColorHelper.white,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InteractionWidget(
                      text: '45',
                      icon: Symbols.favorite,
                    ),
                    InteractionWidget(
                      text: '45',
                      icon: Symbols.mode_comment,
                    ),
                    Icon(Symbols.share),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InteractionWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  const InteractionWidget({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: Icon(icon)),
        CustomTextWidget(text: text),
      ],
    );
  }
}

class CustomTabbar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final List<Widget> tabs;

  const CustomTabbar({super.key, required this.context, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: MyColorHelper.secondaryBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
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
            tabs: tabs,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * 0.5);
}
