class MyTeamModel {
  String? key,
      city,
      name,
      conference,
      division,
      primaryColor,
      secondaryColor,
      tertiaryColor,
      quaternaryColor,
      wikipediaLogoUrl,
      wikipediaWordMarkUrl,
      headCoach;

  bool? active;
  int? teamId, leagueID, stadiumID, globalTeamID, nbaDotComTeamID;

  MyTeamModel(
      {this.key,
      this.name,
      this.city,
      this.conference,
      this.division,
      this.primaryColor,
      this.secondaryColor,
      this.tertiaryColor,
      this.quaternaryColor,
      this.wikipediaLogoUrl,
      this.wikipediaWordMarkUrl,
      this.headCoach,
      this.active,
      this.nbaDotComTeamID,
      this.globalTeamID,
      this.stadiumID,
      this.leagueID,
      this.teamId});

  static MyTeamModel fromMap(Map<String, dynamic> map) => MyTeamModel(
        teamId: map['TeamID'],
        key: map['Key'],
        name: map['Name'],
        city: map['City'],
        conference: map['Conference'],
        division: map['Division'],
        primaryColor: map['PrimaryColor'],
        secondaryColor: map['SecondaryColor'],
        tertiaryColor: map['TertiaryColor'],
        quaternaryColor: map['QuaternaryColor'],
        wikipediaWordMarkUrl: map['WikipediaWordMarkUrl'],
        wikipediaLogoUrl: map['WikipediaLogoUrl'],
        headCoach: map['HeadCoach'],
        active: map['Active'],
        nbaDotComTeamID: map['NbaDotComTeamID'],
        globalTeamID: map['GlobalTeamID'],
        stadiumID: map['StadiumID'],
        leagueID: map['LeagueID'],
      );

  Map<String, dynamic> toMap() => {
        'key': key,
        'name': name,
        'city': city,
        'conference': conference,
        'division': division,
        'primaryColor': primaryColor,
        'secondaryColor': secondaryColor,
        'tertiaryColor': tertiaryColor,
        'quaternaryColor': quaternaryColor,
        'wikipediaLogoUrl': wikipediaLogoUrl,
        'wikipediaWordMarkUrl': wikipediaWordMarkUrl,
        'headCoach': headCoach,
        'active': active,
        'nbaDotComTeamID': nbaDotComTeamID,
        'globalTeamID': globalTeamID,
        'stadiumID': stadiumID,
        'leagueID': leagueID,
        'teamId': teamId,
      };
}
