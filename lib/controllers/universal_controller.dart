import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/api/api_service.dart';
import 'package:nba_trade/helper/toast.dart';
import 'package:nba_trade/models/my_team_model.dart';
import 'package:nba_trade/models/my_player_model.dart';
import 'package:nba_trade/models/player_stats_model.dart';

class UniversalController extends GetxController {
  var isLoading = false.obs;
  var isError = false.obs;
  var isApiDataCalled = false.obs;

  var players = <MyPlayerModel>[].obs;
  var playersStatistics = <PlayerStatsModel>[].obs;
  var teams = <MyTeamModel>[].obs;

  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  @override
  void onInit() async {
    initConnectivity();
    await fetchPlayerList();
    await fetchAllTeams();
    await fetchAllPlayersStats();
    isApiDataCalled.value = true;
    debugPrint('All Apis called: ${isApiDataCalled.value}');
    debugPrint('players Length: ${players.length}');
    debugPrint('Total Teams length: ${teams.length}');
    debugPrint('Total Stats: ${playersStatistics.length}');
    super.onInit();
  }

  // List<MyPlayerModel> myTeamPlayers(MyTeamModel selectedTeam) {
  //   return selectedTeamPlayers
  //       .where((player) => player.teamId == selectedTeam.teamId)
  //       .toList();
  // }

  //Checking the Internet Connectivity
  void initConnectivity() {
    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result != ConnectivityResult.none) {
        // Internet connection is available, re-fetch data
        if (isError.value) {
          ToastMessage.showToastMessage(
              message: 'Internet Connection restored.',
              backgroundColor: Colors.green);
          debugPrint('Fetching Apis again After Internet reconnectivity.');
          await fetchPlayerList();
          await fetchAllTeams();
          isApiDataCalled.value = true;
          debugPrint(
              'All Apis called After Internet reconnectivity: ${isApiDataCalled.value}');
          debugPrint(
              'players Length After Internet reconnectivity: ${players.length}');
          debugPrint(
              'Total Teams length After Internet reconnectivity: ${teams.length}');
        }
      }
    });
  }

  Future<List<MyPlayerModel>> fetchPlayerList() async {
    try {
      debugPrint('Fetching Players');
      players.value = await ApiService.fetchAllPlayers();
      isError.value = false;
      return players;
    } catch (error) {
      debugPrint('Error fetching player list: $error');
      isError.value = true;
      ToastMessage.showToastMessage(
          message: 'Network Error.', backgroundColor: Colors.red);
      rethrow;
    }
  }

  Future<List<MyTeamModel>> fetchAllTeams() async {
    try {
      debugPrint('Fetching Teams');
      teams.value = await ApiService.fetchAllTeams();
      isError.value = false;
      return teams;
    } catch (error) {
      debugPrint('Error fetching teams list: $error');
      isError.value = true;
      ToastMessage.showToastMessage(
          message: 'Network Error.', backgroundColor: Colors.red);
      rethrow;
    }
  }

  Future<List<PlayerStatsModel>> fetchAllPlayersStats() async {
    try {
      debugPrint('Fetching Statistics');
      playersStatistics.value = await ApiService.fetchAllPlayersStatistics();
      isError.value = false;
      return playersStatistics;
    } catch (error) {
      debugPrint('Error fetching teams list: $error');
      isError.value = true;
      ToastMessage.showToastMessage(
          message: 'Network Error.', backgroundColor: Colors.red);
      rethrow;
    }
  }

  //For Searching Players.
  void filterPlayers(String query) {
    debugPrint('filter method called with query: $query');
    List<String> searchTerms = query.toLowerCase().split(' ');

    List<MyPlayerModel> filteredList = players.where((player) {
      String fullName = (player.firstName! + player.lastName!).toLowerCase();
      return searchTerms.every((term) => fullName.contains(term));
    }).toList();

    debugPrint('Filtered list: $filteredList');
  }

  //Refreshing the data within the application.
  // Future<void> refreshData() async {
  //   try {
  //     await Future.delayed(const Duration(seconds: 2));
  //     await fetchPlayerList();
  //   } catch (error) {
  //     debugPrint('Error during refresh: $error');
  //   }
  // }

  @override
  void onClose() {
    connectivitySubscription.cancel();
    super.onClose();
  }
}
