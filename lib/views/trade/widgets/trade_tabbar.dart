import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/controllers/trade_controller.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/views/trade/trade.dart';

class TradeTabbar extends StatelessWidget {
  final TradeController controller;
  const TradeTabbar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: MyColorHelper.primaryBackground,
            border: Border.all(color: Colors.grey)),
        width: double.infinity,
        child: controller.selectedTeams.isNotEmpty
            ? Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Obx(
                        () => ButtonsTabBar(
                          height: 70,
                          backgroundColor: MyColorHelper.primary,
                          unselectedBackgroundColor: Colors.grey[600],
                          unselectedLabelStyle:
                              const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          tabs: [
                            for (var i = 0;
                                i < controller.selectedTeams.length;
                                i++)
                              buildTabbar(
                                  teamName:
                                      controller.selectedTeams[i].name ?? '',
                                  image: controller
                                          .selectedTeams[i].wikipediaLogoUrl ??
                                      ''),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox(
                child: Center(
                  child: CustomTextWidget(
                    text: 'No Teams Selected yet.',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
      ),
    );
  }
}
