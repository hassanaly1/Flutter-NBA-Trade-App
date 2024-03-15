import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/models/my_player_model.dart';
import 'package:nba_trade/models/my_team_model.dart';
import 'package:nba_trade/views/trade/trade.dart';

import '../../../controllers/trade_controller.dart';
import 'dropdown.dart';

class TradePlayerCard extends StatelessWidget {
  final MyPlayerModel playerModel;
  final MyTeamModel myTeamModel;
  const TradePlayerCard(
      {super.key, required this.playerModel, required this.myTeamModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Card(
        elevation: 5.0,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(12.0)),
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
                      // SvgPicture.network(
                      //   myTeamModel.wikipediaLogoUrl.toString(),
                      //   height: 20,
                      // ),
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
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.keyboard_arrow_up, color: Colors.black26),
                    IconButton(
                      onPressed: () {
                        TradeController cont = Get.find<TradeController>();
                        showDialog(
                            context: context,
                            builder: (builder) => AlertDialog(
                                  scrollable: true,
                                  title: const Text('To Team'),
                                  content: TeamsDropdown(
                                    teams: cont.selectedTeams
                                        .where((e) =>
                                            e.teamId != playerModel.teamId)
                                        .toList(),
                                    onChange: (value) {
                                      cont.onPlayerTeamChanged(
                                          playerModel, value);
                                      Get.back();
                                    },
                                  ),
                                ));
                      },
                      icon: const Icon(FontAwesomeIcons.shareFromSquare),
                    ),
                    const Icon(Icons.keyboard_arrow_down, color: Colors.black26)
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
