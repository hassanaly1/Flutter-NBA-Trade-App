import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/models/player_stats_model.dart';

class CompareDropdown extends StatelessWidget {
  final List<PlayerStatsModel> players;
  final void Function(PlayerStatsModel?)? onChanged;
  const CompareDropdown({
    super.key,
    required this.players,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      hint: const CustomTextWidget(
        text: 'Select Players',
        fontSize: 12.0,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w400,
        textColor: MyColorHelper.textSecondary,
      ),
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      style: const TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
      padding: EdgeInsets.zero,
      decoration: InputDecoration(
          fillColor: MyColorHelper.primaryBackground,
          filled: true,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          constraints: BoxConstraints(maxHeight: context.height * 0.08)),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12.0),
        topRight: Radius.circular(12.0),
      ),
      menuMaxHeight: context.height * 0.4,
      isExpanded: true,
      items: players
          .map((options) => DropdownMenuItem(
              value: options,
              child: CustomTextWidget(
                text: '${options.name} - ${options.team ?? ''}',
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              )))
          .toList(),
      onChanged: onChanged,
    );
  }
}
