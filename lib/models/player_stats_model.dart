class PlayerStatsModel {
  int? statId;
  int? teamId;
  int? playerId;
  int? seasonType;
  int? season;
  String? name;
  String? team;
  String? position;
  int? started;
  int? globalTeamId;
  String? updated;
  int? games;
  double? fantasyPoints;
  int? minutes;
  int? seconds;
  double? fieldGoalsMade;
  double? fieldGoalsAttempted;
  double? fieldGoalsPercentage;
  double? effectiveFieldGoalsPercentage;
  double? twoPointersMade;
  double? twoPointersAttempted;
  double? twoPointersPercentage;
  double? threePointersMade;
  double? threePointersAttempted;
  double? threePointersPercentage;
  double? freeThrowsMade;
  double? freeThrowsAttempted;
  double? freeThrowsPercentage;
  double? offensiveRebounds;
  double? defensiveRebounds;
  double? rebounds;
  double? offensiveReboundsPercentage;
  double? defensiveReboundsPercentage;
  double? totalReboundsPercentage;
  double? assists;
  double? steals;
  double? blockedShots;
  double? turnovers;
  double? personalFouls;
  double? points;
  double? trueShootingAttempts;
  double? trueShootingPercentage;
  double? playerEfficiencyRating;
  double? assistsPercentage;
  double? stealsPercentage;
  double? blocksPercentage;
  double? turnOversPercentage;
  double? usageRatePercentage;
  double? fantasyPointsFanDuel;
  double? fantasyPointsDraftKings;
  double? fantasyPointsYahoo;
  double? plusMinus;
  double? doubleDoubles;
  double? tripleDoubles;
  double? fantasyPointsFantasyDraft;
  bool? isClosed;
  String? lineupConfirmed;
  String? lineupStatus;

  PlayerStatsModel({
    this.statId,
    this.teamId,
    this.playerId,
    this.seasonType,
    this.season,
    this.name,
    this.team,
    this.position,
    this.started,
    this.globalTeamId,
    this.updated,
    this.games,
    this.fantasyPoints,
    this.minutes,
    this.seconds,
    this.fieldGoalsMade,
    this.fieldGoalsAttempted,
    this.fieldGoalsPercentage,
    this.effectiveFieldGoalsPercentage,
    this.twoPointersMade,
    this.twoPointersAttempted,
    this.twoPointersPercentage,
    this.threePointersMade,
    this.threePointersAttempted,
    this.threePointersPercentage,
    this.freeThrowsMade,
    this.freeThrowsAttempted,
    this.freeThrowsPercentage,
    this.offensiveRebounds,
    this.defensiveRebounds,
    this.rebounds,
    this.offensiveReboundsPercentage,
    this.defensiveReboundsPercentage,
    this.totalReboundsPercentage,
    this.assists,
    this.steals,
    this.blockedShots,
    this.turnovers,
    this.personalFouls,
    this.points,
    this.trueShootingAttempts,
    this.trueShootingPercentage,
    this.playerEfficiencyRating,
    this.assistsPercentage,
    this.stealsPercentage,
    this.blocksPercentage,
    this.turnOversPercentage,
    this.usageRatePercentage,
    this.fantasyPointsFanDuel,
    this.fantasyPointsDraftKings,
    this.fantasyPointsYahoo,
    this.plusMinus,
    this.doubleDoubles,
    this.tripleDoubles,
    this.fantasyPointsFantasyDraft,
    this.isClosed,
    this.lineupConfirmed,
    this.lineupStatus,
  });

  static PlayerStatsModel fromMap(Map<String, dynamic> json) =>
      PlayerStatsModel(
        statId: json["StatID"],
        teamId: json["TeamID"],
        playerId: json["PlayerID"],
        seasonType: json["SeasonType"],
        season: json["Season"],
        name: json["Name"],
        team: json["Team"],
        position: json["Position"],
        started: json["Started"],
        globalTeamId: json["GlobalTeamID"],
        updated: json["Updated"],
        games: json["Games"],
        fantasyPoints: json["FantasyPoints"],
        minutes: json["Minutes"],
        seconds: json["Seconds"],
        fieldGoalsMade: json["FieldGoalsMade"],
        fieldGoalsAttempted: json["FieldGoalsAttempted"].toDouble(),
        fieldGoalsPercentage: json["FieldGoalsPercentage"].toDouble(),
        effectiveFieldGoalsPercentage:
            json["EffectiveFieldGoalsPercentage"].toDouble(),
        twoPointersMade: json["TwoPointersMade"].toDouble(),
        twoPointersAttempted: json["TwoPointersAttempted"].toDouble(),
        twoPointersPercentage: json["TwoPointersPercentage"],
        threePointersMade: json["ThreePointersMade"].toDouble(),
        threePointersAttempted: json["ThreePointersAttempted"].toDouble(),
        threePointersPercentage: json["ThreePointersPercentage"].toDouble(),
        freeThrowsMade: json["FreeThrowsMade"].toDouble(),
        freeThrowsAttempted: json["FreeThrowsAttempted"].toDouble(),
        freeThrowsPercentage: json["FreeThrowsPercentage"].toDouble(),
        offensiveRebounds: json["OffensiveRebounds"],
        defensiveRebounds: json["DefensiveRebounds"].toDouble(),
        rebounds: json["Rebounds"].toDouble(),
        offensiveReboundsPercentage: json["OffensiveReboundsPercentage"],
        defensiveReboundsPercentage:
            json["DefensiveReboundsPercentage"].toDouble(),
        totalReboundsPercentage: json["TotalReboundsPercentage"].toDouble(),
        assists: json["Assists"].toDouble(),
        steals: json["Steals"].toDouble(),
        blockedShots: json["BlockedShots"].toDouble(),
        turnovers: json["Turnovers"].toDouble(),
        personalFouls: json["PersonalFouls"],
        points: json["Points"].toDouble(),
        trueShootingAttempts: json["TrueShootingAttempts"].toDouble(),
        trueShootingPercentage: json["TrueShootingPercentage"].toDouble(),
        playerEfficiencyRating: json["PlayerEfficiencyRating"].toDouble(),
        assistsPercentage: json["AssistsPercentage"].toDouble(),
        stealsPercentage: json["StealsPercentage"].toDouble(),
        blocksPercentage: json["BlocksPercentage"].toDouble(),
        turnOversPercentage: json["TurnOversPercentage"].toDouble(),
        usageRatePercentage: json["UsageRatePercentage"].toDouble(),
        fantasyPointsFanDuel: json["FantasyPointsFanDuel"].toDouble(),
        fantasyPointsDraftKings: json["FantasyPointsDraftKings"].toDouble(),
        fantasyPointsYahoo: json["FantasyPointsYahoo"].toDouble(),
        plusMinus: json["PlusMinus"].toDouble(),
        doubleDoubles: json["DoubleDoubles"].toDouble(),
        tripleDoubles: json["TripleDoubles"],
        fantasyPointsFantasyDraft: json["FantasyPointsFantasyDraft"].toDouble(),
        isClosed: json["IsClosed"],
        lineupConfirmed: json["LineupConfirmed"],
        lineupStatus: json["LineupStatus"],
      );

  Map<String, dynamic> toJson() => {
        "StatID": statId,
        "TeamID": teamId,
        "PlayerID": playerId,
        "SeasonType": seasonType,
        "Season": season,
        "Name": name,
        "Team": team,
        "Position": position,
        "Started": started,
        "GlobalTeamID": globalTeamId,
        "Updated": updated,
        "Games": games,
        "FantasyPoints": fantasyPoints,
        "Minutes": minutes,
        "Seconds": seconds,
        "FieldGoalsMade": fieldGoalsMade,
        "FieldGoalsAttempted": fieldGoalsAttempted,
        "FieldGoalsPercentage": fieldGoalsPercentage,
        "EffectiveFieldGoalsPercentage": effectiveFieldGoalsPercentage,
        "TwoPointersMade": twoPointersMade,
        "TwoPointersAttempted": twoPointersAttempted,
        "TwoPointersPercentage": twoPointersPercentage,
        "ThreePointersMade": threePointersMade,
        "ThreePointersAttempted": threePointersAttempted,
        "ThreePointersPercentage": threePointersPercentage,
        "FreeThrowsMade": freeThrowsMade,
        "FreeThrowsAttempted": freeThrowsAttempted,
        "FreeThrowsPercentage": freeThrowsPercentage,
        "OffensiveRebounds": offensiveRebounds,
        "DefensiveRebounds": defensiveRebounds,
        "Rebounds": rebounds,
        "OffensiveReboundsPercentage": offensiveReboundsPercentage,
        "DefensiveReboundsPercentage": defensiveReboundsPercentage,
        "TotalReboundsPercentage": totalReboundsPercentage,
        "Assists": assists,
        "Steals": steals,
        "BlockedShots": blockedShots,
        "Turnovers": turnovers,
        "PersonalFouls": personalFouls,
        "Points": points,
        "TrueShootingAttempts": trueShootingAttempts,
        "TrueShootingPercentage": trueShootingPercentage,
        "PlayerEfficiencyRating": playerEfficiencyRating,
        "AssistsPercentage": assistsPercentage,
        "StealsPercentage": stealsPercentage,
        "BlocksPercentage": blocksPercentage,
        "TurnOversPercentage": turnOversPercentage,
        "UsageRatePercentage": usageRatePercentage,
        "FantasyPointsFanDuel": fantasyPointsFanDuel,
        "FantasyPointsDraftKings": fantasyPointsDraftKings,
        "FantasyPointsYahoo": fantasyPointsYahoo,
        "PlusMinus": plusMinus,
        "DoubleDoubles": doubleDoubles,
        "TripleDoubles": tripleDoubles,
        "FantasyPointsFantasyDraft": fantasyPointsFantasyDraft,
        "IsClosed": isClosed,
        "LineupConfirmed": lineupConfirmed,
        "LineupStatus": lineupStatus,
      };
}
