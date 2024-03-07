import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';

class PickTradePlayerCard extends StatelessWidget {
  const PickTradePlayerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.black54)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: '2024 Round 1',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomTextWidget(
                      text: 'via TOR, IND UTA OR CLE',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ],
                ),
              ),
            ),
            const VerticalDivider(color: Color(0xff860038), thickness: 6.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/svgs/76logo.svg',
                height: 60,
                color: MyColorHelper.primary,
              ),
            ),
            const VerticalDivider(color: Colors.black54, thickness: 2.0),
            const Icon(Icons.more_vert)

            // Icons and Button
          ],
        ),
      ),
    );
  }
}
