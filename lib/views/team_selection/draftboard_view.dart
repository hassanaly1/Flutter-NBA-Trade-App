import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/controllers/universal_controller.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/profile_avatar.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/views/team_selection/widgets/player_card.dart';

class Draftboard extends StatelessWidget {
  Draftboard({super.key});

  final UniversalController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: MyColorHelper.primaryBackground,
              borderRadius: BorderRadius.circular(12.0)),
          child: Card(
            elevation: 5.0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 219, 219, 255),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Obx(
                () => Container(
                    color: Colors.transparent,
                    child: controller.draftPlayers.isNotEmpty
                        ? ReorderableListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              for (int index = 0;
                                  index < controller.draftPlayers.length;
                                  index += 1)
                                ReorderableDelayedDragStartListener(
                                  key: ValueKey(controller.draftPlayers[index]
                                      .playerId), // Use a unique identifier
                                  index: index,
                                  child: NBAPlayerCard(
                                    playerModel: controller.draftPlayers[index],
                                    showAddIcon: false,
                                  ),
                                ),
                            ],
                            onReorder: (int oldIndex, int newIndex) {
                              final player =
                                  controller.draftPlayers.removeAt(oldIndex);
                              controller.draftPlayers.insert(
                                  newIndex > oldIndex ? newIndex - 1 : newIndex,
                                  player);
                            },
                          )

                        // ? ReorderableListView.builder(
                        //     shrinkWrap: true,
                        //     physics:
                        //         const NeverScrollableScrollPhysics(),
                        //     itemCount: controller.draftPlayers.length,
                        //     itemBuilder: (context, index) {
                        //       final player =
                        //           controller.draftPlayers[index];
                        //       return ReorderableDelayedDragStartListener(
                        //         key: ValueKey(player),
                        //         index: index,
                        //         child: NBAPlayerCard(
                        //           playerModel: player,
                        //           showAddIcon: false,
                        //         ),
                        //       );
                        //     },
                        //     onReorder: (int oldIndex, int newIndex) {
                        //       final player = controller.draftPlayers
                        //           .removeAt(oldIndex);
                        //       controller.draftPlayers.insert(
                        //           newIndex > oldIndex
                        //               ? newIndex - 1
                        //               : newIndex,
                        //           player);
                        //     },
                        //   )
                        : SizedBox(
                            height: context.height * 0.2,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: context.width * 0.1),
                                child: const CustomTextWidget(
                                  text:
                                      'No Players Added\nAdd Players from Teams section to create your draftboard.',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
          child: Row(
            children: [
              const ProfileAvatar(),
              const SizedBox(width: 6.0),
              Expanded(
                  child: SizedBox(
                height: context.height * 0.06,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: CustomTextWidget(text: 'Write Draft Board Summary'),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColorHelper.primary)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColorHelper.primary)),
                    labelStyle: TextStyle(
                      fontSize: 14.0,
                      color: MyColorHelper.primary,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: MyColorHelper.primary,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )),
              const SizedBox(width: 6.0),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: MyColorHelper.primary,
                    borderRadius: BorderRadius.circular(8.0)),
                child: const CustomTextWidget(
                  text: 'Create Post',
                  textColor: Colors.white,
                  fontSize: 12.0,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
