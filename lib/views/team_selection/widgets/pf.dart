import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:nba_trade/controllers/universal_controller.dart';
import 'package:nba_trade/models/my_player_model.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/views/team_selection/widgets/player_card.dart';

class PFView extends StatelessWidget {
  final List<MyPlayerModel> players;
  final UniversalController controller = Get.find();
  PFView({super.key, required this.players});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5.0,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: const Color.fromARGB(255, 219, 219, 255),
          child: Obx(
            () {
              if (controller.isError.value) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SpinKitFadingCircle(color: MyColorHelper.primary),
                  ),
                );
              }
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
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: players.length,
                    itemBuilder: (context, index) {
                      return NBAPlayerCard(
                        playerModel: players[index],
                      );
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
