import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';
import 'package:nba_trade/models/my_team_model.dart';

class TeamsDropdown extends StatelessWidget {
  const TeamsDropdown({super.key, required this.teams, required this.onChange});
  final List<MyTeamModel> teams;
  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
        hint: const CustomTextWidget(
          text: 'Select Team',
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        style: const TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
        padding: EdgeInsets.zero,
        decoration: InputDecoration(
            fillColor: MyColorHelper.primaryBackground,
            filled: true,
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            constraints: BoxConstraints(maxHeight: context.height * 0.08)),
        borderRadius: BorderRadius.circular(12.0),
        items: teams
            .map((options) => DropdownMenuItem(
                value: options,
                child: CustomTextWidget(
                  text: options.name ?? '',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                )))
            .toList(),
        onChanged: (value) => onChange(value),
      ),
    );
  }
}
