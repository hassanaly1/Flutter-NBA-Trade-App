import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    const CustomAppBar(title: 'NBA Contracts'),
                  ],
                ),
              ),
            ];
          },
          body: Expanded(child: PlayerTable())),
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
        columns: [
          const DataColumn(label: Text('Player')),
          const DataColumn(label: Text('Position')),
          const DataColumn(label: Text('Salary')),
          const DataColumn(label: Text('Category')),
          const DataColumn(label: Text('Experience')),
          const DataColumn(label: Text('Status')),
          const DataColumn(label: Text('Signed Using')),
          DataColumn(label: Text('Country')),
        ],
        rows: controller.players.map((player) {
          return DataRow(
            cells: [
              DataCell(Text(player.firstName ?? "")),
              DataCell(Text(player.position ?? "")),
              DataCell(Text(player.salary.toString() ?? "")),
              DataCell(Text(player.positionCategory ?? "")),
              DataCell(Text(player.experience.toString() ?? "")),
              DataCell(Text(player.status ?? "")),
              DataCell(Text(player.team ?? "")),
              DataCell(Text(player.birthCountry ?? "")),
            ],
          );
        }).toList(),
      ),
    );
    ;
  }
}
