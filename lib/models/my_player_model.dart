class MyPlayerModel {
  int? playerId;
  String? sportsDataId;
  String? status;
  int? teamId;
  String? team;
  int? jersey;
  String? positionCategory;
  String? position;
  String? firstName;
  String? lastName;
  int? height;
  int? weight;
  String? birthDate;
  String? birthCity;
  String? birthState;
  String? birthCountry;
  String? highSchool;
  String? college;
  int? salary;
  String? photoUrl;
  int? experience;
  String? sportRadarPlayerId;
  int? rotoworldPlayerId;
  int? rotoWirePlayerId;
  int? fantasyAlarmPlayerId;
  int? statsPlayerId;
  int? sportsDirectPlayerId;
  int? xmlTeamPlayerId;
  String? injuryStatus;
  String? injuryBodyPart;
  String? injuryStartDate;
  String? injuryNotes;
  int? fanDuelPlayerId;
  int? draftKingsPlayerId;
  int? yahooPlayerId;
  String? fanDuelName;
  String? draftKingsName;
  String? yahooName;
  String? depthChartPosition;
  int? depthChartOrder;
  int? globalTeamId;
  String? fantasyDraftName;
  int? fantasyDraftPlayerId;
  int? usaTodayPlayerId;
  String? usaTodayHeadshotUrl;
  String? usaTodayHeadshotNoBackgroundUrl;
  String? usaTodayHeadshotUpdated;
  String? usaTodayHeadshotNoBackgroundUpdated;
  int? nbaDotComPlayerId;

  MyPlayerModel({
    this.playerId,
    this.sportsDataId,
    this.status,
    this.teamId,
    this.team,
    this.jersey,
    this.positionCategory,
    this.position,
    this.firstName,
    this.lastName,
    this.height,
    this.weight,
    this.birthDate,
    this.birthCity,
    this.birthState,
    this.birthCountry,
    this.highSchool,
    this.college,
    this.salary,
    this.photoUrl,
    this.experience,
    this.sportRadarPlayerId,
    this.rotoworldPlayerId,
    this.rotoWirePlayerId,
    this.fantasyAlarmPlayerId,
    this.statsPlayerId,
    this.sportsDirectPlayerId,
    this.xmlTeamPlayerId,
    this.injuryStatus,
    this.injuryBodyPart,
    this.injuryStartDate,
    this.injuryNotes,
    this.fanDuelPlayerId,
    this.draftKingsPlayerId,
    this.yahooPlayerId,
    this.fanDuelName,
    this.draftKingsName,
    this.yahooName,
    this.depthChartPosition,
    this.depthChartOrder,
    this.globalTeamId,
    this.fantasyDraftName,
    this.fantasyDraftPlayerId,
    this.usaTodayPlayerId,
    this.usaTodayHeadshotUrl,
    this.usaTodayHeadshotNoBackgroundUrl,
    this.usaTodayHeadshotUpdated,
    this.usaTodayHeadshotNoBackgroundUpdated,
    this.nbaDotComPlayerId,
  });

  static MyPlayerModel fromJson(Map<String, dynamic> json) => MyPlayerModel(
        playerId: json["PlayerID"],
        sportsDataId: json["SportsDataID"],
        status: json["Status"],
        teamId: json["TeamID"],
        team: json["Team"],
        jersey: json["Jersey"],
        positionCategory: json["PositionCategory"],
        position: json["Position"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        height: json["Height"],
        weight: json["Weight"],
        birthDate: json["BirthDate"],
        birthCity: json["BirthCity"],
        birthState: json["BirthState"],
        birthCountry: json["BirthCountry"],
        highSchool: json["HighSchool"],
        college: json["College"],
        salary: json["Salary"],
        photoUrl: json["PhotoUrl"],
        experience: json["Experience"],
        sportRadarPlayerId: json["SportRadarPlayerID"],
        rotoworldPlayerId: json["RotoworldPlayerID"],
        rotoWirePlayerId: json["RotoWirePlayerID"],
        fantasyAlarmPlayerId: json["FantasyAlarmPlayerID"],
        statsPlayerId: json["StatsPlayerID"],
        sportsDirectPlayerId: json["SportsDirectPlayerID"],
        xmlTeamPlayerId: json["XmlTeamPlayerID"],
        injuryStatus: json["InjuryStatus"],
        injuryBodyPart: json["InjuryBodyPart"],
        injuryStartDate: json["InjuryStartDate"],
        injuryNotes: json["InjuryNotes"],
        fanDuelPlayerId: json["FanDuelPlayerID"],
        draftKingsPlayerId: json["DraftKingsPlayerID"],
        yahooPlayerId: json["YahooPlayerID"],
        fanDuelName: json["FanDuelName"],
        draftKingsName: json["DraftKingsName"],
        yahooName: json["YahooName"],
        depthChartPosition: json["DepthChartPosition"],
        depthChartOrder: json["DepthChartOrder"],
        globalTeamId: json["GlobalTeamID"],
        fantasyDraftName: json["FantasyDraftName"],
        fantasyDraftPlayerId: json["FantasyDraftPlayerID"],
        usaTodayPlayerId: json["UsaTodayPlayerID"],
        usaTodayHeadshotUrl: json["UsaTodayHeadshotUrl"],
        usaTodayHeadshotNoBackgroundUrl:
            json["UsaTodayHeadshotNoBackgroundUrl"],
        usaTodayHeadshotUpdated: json["UsaTodayHeadshotUpdated"],
        usaTodayHeadshotNoBackgroundUpdated:
            json["UsaTodayHeadshotNoBackgroundUpdated"],
        nbaDotComPlayerId: json["NbaDotComPlayerID"],
      );

  Map<String, dynamic> toJson() => {
        "PlayerID": playerId,
        "SportsDataID": sportsDataId,
        "Status": status,
        "TeamID": teamId,
        "Team": team,
        "Jersey": jersey,
        "PositionCategory": positionCategory,
        "Position": position,
        "FirstName": firstName,
        "LastName": lastName,
        "Height": height,
        "Weight": weight,
        "BirthDate": birthDate,
        "BirthCity": birthCity,
        "BirthState": birthState,
        "BirthCountry": birthCountry,
        "HighSchool": highSchool,
        "College": college,
        "Salary": salary,
        "PhotoUrl": photoUrl,
        "Experience": experience,
        "SportRadarPlayerID": sportRadarPlayerId,
        "RotoworldPlayerID": rotoworldPlayerId,
        "RotoWirePlayerID": rotoWirePlayerId,
        "FantasyAlarmPlayerID": fantasyAlarmPlayerId,
        "StatsPlayerID": statsPlayerId,
        "SportsDirectPlayerID": sportsDirectPlayerId,
        "XmlTeamPlayerID": xmlTeamPlayerId,
        "InjuryStatus": injuryStatus,
        "InjuryBodyPart": injuryBodyPart,
        "InjuryStartDate": injuryStartDate,
        "InjuryNotes": injuryNotes,
        "FanDuelPlayerID": fanDuelPlayerId,
        "DraftKingsPlayerID": draftKingsPlayerId,
        "YahooPlayerID": yahooPlayerId,
        "FanDuelName": fanDuelName,
        "DraftKingsName": draftKingsName,
        "YahooName": yahooName,
        "DepthChartPosition": depthChartPosition,
        "DepthChartOrder": depthChartOrder,
        "GlobalTeamID": globalTeamId,
        "FantasyDraftName": fantasyDraftName,
        "FantasyDraftPlayerID": fantasyDraftPlayerId,
        "UsaTodayPlayerID": usaTodayPlayerId,
        "UsaTodayHeadshotUrl": usaTodayHeadshotUrl,
        "UsaTodayHeadshotNoBackgroundUrl": usaTodayHeadshotNoBackgroundUrl,
        "UsaTodayHeadshotUpdated": usaTodayHeadshotUpdated,
        "UsaTodayHeadshotNoBackgroundUpdated":
            usaTodayHeadshotNoBackgroundUpdated,
        "NbaDotComPlayerID": nbaDotComPlayerId,
      };
}
