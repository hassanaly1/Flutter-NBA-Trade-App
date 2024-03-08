import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nba_trade/models/my_player_model.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/views/trade/trade.dart';

class TradePlayerCard extends StatelessWidget {
  final MyPlayerModel playerModel;
  const TradePlayerCard({
    super.key,
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
                      Row(
                        children: [
                          CustomRichText(
                            heading: 'Team:',
                            value: '${playerModel.team}' ?? '',
                            useBlackColor: true,
                          ),
                          const SizedBox(width: 6.0),
                          CustomRichText(
                            heading: 'ID',
                            value: playerModel.teamId.toString() ?? '',
                            useBlackColor: true,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Icons and Button
              IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.shareFromSquare))
            ],
          ),
        ),
      ),
    );
  }
}
