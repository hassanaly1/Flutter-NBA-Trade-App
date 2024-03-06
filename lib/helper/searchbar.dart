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
        height: context.height * 0.05,
        child: TextFormField(
          onChanged: onChanged,
          decoration: const InputDecoration(
            label: CustomTextWidget(text: 'Search by Name'),
            suffixIcon: Icon(
              CupertinoIcons.search,
              color: MyColorHelper.primary,
            ),
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
      ),
    );
  }
}
