import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/controllers/team_selection_controller.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/models/my_player_model.dart';
import 'package:nba_trade/views/trade/trade.dart';

class NBAPlayerCard extends StatelessWidget {
  final MyPlayerModel playerModel;
  final TeamSelectionController controller = Get.find();

  final bool showAddIcon;
  NBAPlayerCard({
    super.key,
    this.showAddIcon = true,
    required this.playerModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Card(
        elevation: 5.0,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  playerModel.photoUrl.toString(),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextWidget(
                        text:
                            '${playerModel.firstName ?? ""} ${playerModel.lastName ?? ""}',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomTextWidget(
                        text:
                            '${playerModel.depthChartPosition ?? ""} ${playerModel.height ?? ""}\' ${playerModel.weight ?? ""}" ${playerModel.experience ?? ""} ',
                        textColor: Colors.grey,
                      ),
                      Row(
                        children: [
                          CustomRichText(
                            heading: 'Team:',
                            value: '${playerModel.team}',
                            useBlackColor: true,
                          ),
                          const SizedBox(width: 6.0),
                          CustomRichText(
                            heading: 'ID',
                            value: playerModel.teamId.toString(),
                            useBlackColor: true,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Icons and Button
              showAddIcon
                  ? Obx(
                      () => IconButton(
                        onPressed: () =>
                            controller.addOrRemovePlayer(playerModel),
                        icon: Icon(
                          size: 30.0,
                          controller.draftPlayers.contains(playerModel)
                              ? Icons.check_circle
                              : CupertinoIcons.plus_circle_fill,
                          color: MyColorHelper.primary,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.keyboard_arrow_up,
                              color: MyColorHelper.primary),
                          IconButton(
                              onPressed: () =>
                                  controller.addOrRemovePlayer(playerModel),
                              icon: const Icon(
                                Icons.cancel,
                                color: Colors.red,
                              )),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: MyColorHelper.black,
                          )
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
