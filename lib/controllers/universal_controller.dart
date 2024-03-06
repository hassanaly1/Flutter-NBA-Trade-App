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

  List<MyTeamModel> teams = [];
  var players = <MyPlayerModel>[].obs;
  var draftPlayers = <MyPlayerModel>[].obs;
  final filteredPlayers = <MyPlayerModel>[].obs;
  List<PlayerStats> playersStatistics = [];

  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  @override
  void onInit() async {
    initConnectivity();
    await fetchPlayerList();
    filteredPlayers.assignAll(players);
    debugPrint('players Length: ${players.length}');
    debugPrint('filteredPlayers: ${filteredPlayers.length}');
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

  //Fetching Data from API.
  Future<List<MyPlayerModel>> fetchPlayerList() async {
    try {
      debugPrint('FETCH Player1');
      players.value = await ApiService.fetchAllPlayers();
      isError.value = false;
      return players;
    } catch (error) {
      debugPrint('Error fetching player list: $error');
      isError.value = true;
      ToastMessage.showToastMessage(
          message: 'Network Error.', backgroundColor: Colors.red);
      // AppHelperFunctions.showSnackBar(
      //     message: 'Network Error', backgroundColor: Colors.red);
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

  //This Method didn't handle spaces.
  // void filterPlayers(String query) {
  //   debugPrint('filter method called with query: $query');
  //   List<MyPlayerModel> filteredList = players
  //       .where((player) => (player.firstName! + player.lastName!)
  //           .toLowerCase()
  //           .contains(query.toLowerCase()))
  //       .toList();
  //   debugPrint('Filtered list: $filteredList');
  //   filteredPlayers.assignAll(filteredList);
  // }

  //Add Players to Draftboard
  void addPlayersToDraftBoard(MyPlayerModel playerModel) {
    draftPlayers.add(playerModel);
    debugPrint('${draftPlayers.length}');
  }

  //Remove Players to Draftboard
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
