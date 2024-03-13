import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/controllers/universal_controller.dart';
import 'package:nba_trade/helper/appbar.dart';
import 'package:nba_trade/helper/colors.dart';
import 'package:nba_trade/helper/text.dart';

class ContractScreen extends StatelessWidget {
  const ContractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyColorHelper.primaryBackground,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              stretch: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              forceMaterialTransparency: true,
              expandedHeight: context.height * 0.1,
              flexibleSpace: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  CustomAppBar(title: 'NBA Contracts'),
                ],
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: PlayerTable(),
        ),
      ),
    ));
  }
}

class PlayerTable extends StatelessWidget {
  PlayerTable({super.key});

  final UniversalController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // scrollDirection: Axis.horizontal,

      child: DataTable(
        headingTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        dataRowColor: MaterialStateColor.resolveWith(
            (states) => MyColorHelper.primaryBackground),
        columnSpacing: 20.0,
        headingRowColor:
            MaterialStateColor.resolveWith((states) => MyColorHelper.primary),
        columns: const [
          DataColumn(
              label: CustomTextWidget(
            text: 'Player',
            textColor: MyColorHelper.white,
          )),
          DataColumn(
              label: CustomTextWidget(
            text: 'Position',
            textColor: MyColorHelper.white,
          )),
          DataColumn(
              label: CustomTextWidget(
            text: 'Salary',
            textColor: MyColorHelper.white,
          )),
          DataColumn(
              label: CustomTextWidget(
            text: 'Category',
            textColor: MyColorHelper.white,
          )),
          DataColumn(
              label: CustomTextWidget(
            text: 'Experience',
            textColor: MyColorHelper.white,
          )),
          DataColumn(
              label: CustomTextWidget(
            text: 'Status',
            textColor: MyColorHelper.white,
          )),
          DataColumn(
              label: CustomTextWidget(
            text: 'Signed Using',
            textColor: MyColorHelper.white,
          )),
          DataColumn(
              label: CustomTextWidget(
            text: 'Country',
            textColor: MyColorHelper.white,
          )),
        ],
        rows: controller.players.map((player) {
          return DataRow(
            cells: [
              DataCell(CustomTextWidget(text: player.firstName ?? "")),
              DataCell(CustomTextWidget(text: player.position ?? "")),
              DataCell(CustomTextWidget(
                  text: '\$${player.salary.toString()}' ?? "")),
              DataCell(CustomTextWidget(text: player.positionCategory ?? "")),
              DataCell(
                  CustomTextWidget(text: player.experience.toString() ?? "")),
              DataCell(CustomTextWidget(text: player.status ?? "")),
              DataCell(CustomTextWidget(text: player.team ?? "")),
              DataCell(CustomTextWidget(text: player.birthCountry ?? "")),
            ],
          );
        }).toList(),
      ),
    );
  }
}
