import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nba_trade/helper/appbar.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/views/compare/compare.dart';
import 'package:nba_trade/views/dashboard/dashboard.dart';
import 'package:nba_trade/views/trade/trade.dart';

class PlayerProfileScreen extends StatelessWidget {
  const PlayerProfileScreen({super.key});

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
                    children: [
                      Container(
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 40,
                                    ),
                                    CustomTextWidget(
                                      text: 'KYLE LOWRY',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      textColor: MyColorHelper.white,
                                    ),
                                    CustomTextWidget(
                                      text:
                                          'Charlotte Hornets •#1 • Point Guard',
                                      fontSize: 14.0,
                                      textColor: MyColorHelper.white,
                                    )
                                  ],
                                ),
                                const Icon(
                                  Symbols.arrow_back_ios,
                                  color: Colors.transparent,
                                ),
                              ],
                            ),
                            const CustomRichText(
                                heading: 'HT/WT', value: "6' 0\", 196 lbs"),
                            const CustomRichText(
                                heading: 'DOB', value: '3/25/1986 (37)'),
                            const CustomRichText(
                                heading: 'COLLEGE', value: 'Villanova'),
                            const CustomRichText(
                                heading: 'STATUS', value: 'Acive')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: Column(
              children: [
                CustomTabbar(
                  context: context,
                  tabs: const [
                    Tab(
                      text: 'BIO',
                      icon: Icon(Symbols.person_book),
                    ),
                    Tab(
                      text: 'Earnings',
                      icon: Icon(Symbols.box),
                    ),
                    Tab(
                      text: 'Stats',
                      icon: Icon(CupertinoIcons.star_circle_fill),
                    ),
                    Tab(
                      text: 'Contract',
                      icon: Icon(Symbols.subheader_rounded),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Container(
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            const CompareHeading(heading: 'General Information'),
                            GridView.builder(
                              shrinkWrap: true,
                              itemCount: 8,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: 0.5),
                              itemBuilder: (context, index) {
                                return const CustomInfo(
                                    title: 'Name',
                                    subtitle: 'Kyle Terrell Lowry');
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.red,
                      ),
                      Container(
                        color: Colors.red,
                      ),
                      Container(
                        color: Colors.red,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
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
      title: CustomTextWidget(
        text: title,
        fontSize: 14.0,
      ),
      subtitle: CustomTextWidget(
        text: subtitle,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
