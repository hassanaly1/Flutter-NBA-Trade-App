import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const CustomSearchBar({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: context.height * 0.08,
        child: TextFormField(
          onChanged: onChanged,
          decoration: InputDecoration(
            fillColor: MyColorHelper.primaryBackground,
            filled: true,
            label: const CustomTextWidget(text: 'Search by Name'),
            suffixIcon:
                const Icon(CupertinoIcons.search, color: MyColorHelper.primary),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: MyColorHelper.primary),
                borderRadius: BorderRadius.circular(12.0)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: MyColorHelper.primary),
                borderRadius: BorderRadius.circular(12.0)),
            labelStyle: const TextStyle(
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
      ),
    );
  }
}
