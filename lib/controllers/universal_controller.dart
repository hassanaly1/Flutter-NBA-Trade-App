import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/api/api_service.dart';
import 'package:nba_trade/helper/toast.dart';
import 'package:nba_trade/models/my_team_modal.dart';
import 'package:nba_trade/models/my_player_model.dart';
import 'package:nba_trade/models/player_stats_model.dart';

class UniversalController extends GetxController {
  var isLoading = false.obs;
  var isError = false.obs;

  var visibleItemCount = 20.obs;
  ScrollController scrollController = ScrollController();

  var players = <MyPlayerModel>[].obs;
  var draftPlayers = <MyPlayerModel>[].obs;
  final filteredPlayers = <MyPlayerModel>[].obs;
  List<PlayerStats> playersStatistics = [];
  var teams = <MyTeamModel>[].obs;
  var selectedTeams = <MyTeamModel>[].obs;

  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  @override
  void onInit() async {
    initConnectivity();
    await fetchPlayerList();
    await fetchAllTeams();

    filteredPlayers.assignAll(players);
    debugPrint('players Length: ${players.length}');
    debugPrint('filteredPlayers: ${filteredPlayers.length}');
    debugPrint('Teams Length: ${teams.length}');
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  //Checking the Internet Connectivity
  void initConnectivity() {
    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result != ConnectivityResult.none) {
        // Internet connection is available, re-fetch data
        if (isError.value) {
          // AppHelperFunctions.showSnackBar(
          //     message: 'Internet Connection restored.',
          //     backgroundColor: Colors.green);
          ToastMessage.showToastMessage(
              message: 'Internet Connection restored.',
              backgroundColor: Colors.green);
          await fetchPlayerList();
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

  //For Searching Players.
  void filterPlayers(String query) {
    debugPrint('filter method called with query: $query');
    List<String> searchTerms = query.toLowerCase().split(' ');

    List<MyPlayerModel> filteredList = players.where((player) {
      String fullName = (player.firstName! + player.lastName!).toLowerCase();
      return searchTerms.every((term) => fullName.contains(term));
    }).toList();

    debugPrint('Filtered list: $filteredList');

    filteredPlayers.assignAll(filteredList);
  }

  //Add Players to Draftboard
  void addPlayersToDraftBoard(MyPlayerModel playerModel) {
    draftPlayers.add(playerModel);
    debugPrint('${draftPlayers.length}');
  }

  //Remove Players from Draftboard
  void removePlayersToDraftBoard(MyPlayerModel playerModel) {
    draftPlayers.remove(playerModel);
    debugPrint('${draftPlayers.length}');
  }

  //Refreshing the data within the application.
  Future<void> refreshData() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      await fetchPlayerList();
    } catch (error) {
      debugPrint('Error during refresh: $error');
    }
  }

  //Check the User reaches the end of the list.
  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      debugPrint('Data loading...');
      isLoading.value = true;
      visibleItemCount.value += 20;
      debugPrint('Data loaded...');
      Future.delayed(const Duration(seconds: 2), () {
        isLoading.value = false;
      });

      debugPrint('Data loaded end...');
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    connectivitySubscription.cancel();
    super.onClose();
  }
}
