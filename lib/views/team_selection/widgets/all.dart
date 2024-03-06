import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:nba_trade/controllers/universal_controller.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/views/team_selection/widgets/player_card.dart';
import 'package:nba_trade/models/my_player_model.dart';
import 'package:nba_trade/helper/colors.dart';

class AllView extends StatelessWidget {
  final List<MyPlayerModel> players;
  final UniversalController controller = Get.find();

  AllView({super.key, required this.players});
  @override
  Widget build(BuildContext context) {
    // final UniversalController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5.0,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: const Color.fromARGB(255, 219, 219, 255),
          child: Obx(() {
            if (controller.isError.value) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SpinKitFadingCircle(color: MyColorHelper.primary),
                ),
              );
            }
            List<MyPlayerModel> visiblePlayers =
                players.take(controller.visibleItemCount.value).toList();

            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const CustomTextWidget(
                  text: '2024 Prospects',
                  textColor: MyColorHelper.primary,
                  textAlign: TextAlign.start,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  controller: controller.scrollController,
                  itemCount: visiblePlayers.length +
                      (controller.isLoading.value ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < visiblePlayers.length) {
                      return NBAPlayerCard(
                        playerModel: visiblePlayers[index],
                      );
                    } else if (controller.isLoading.value) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child:
                              SpinKitFadingCircle(color: MyColorHelper.primary),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
