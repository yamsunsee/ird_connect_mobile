class UserInformation {
  late String uuid;
  late String email;
  late String firstName;
  late String lastName;

  UserInformation();

  factory UserInformation.fromJson(Map<String, dynamic> json) {
    final userInfo = UserInformation();
    userInfo.uuid = json['uuid'] ?? '';
    userInfo.email = json['email'] ?? '';
    userInfo.firstName = json['first_name'] ?? '';
    userInfo.lastName = json['last_name'] ?? '';
    return userInfo;
  }
}

class ScoreBoard {
  late String uuid;
  late UserInformation userInformation;
  late int credit;
  late int project;
  late int finding;
  late int criticalFinding;
  late int highFinding;
  late int mediumFinding;
  late int lowFinding;

  ScoreBoard();

  factory ScoreBoard.fromJson(Map<String, dynamic> json) {
    final scoreboard = ScoreBoard();
    scoreboard.uuid = json['uuid'] ?? '';
    scoreboard.userInformation = UserInformation.fromJson(json['user_information']);
    scoreboard.credit = json['credit'] ?? 0;
    scoreboard.project = json['project'] ?? 0;
    scoreboard.finding = json['finding'] ?? 0;
    scoreboard.criticalFinding = json['critical_finding'] ?? 0;
    scoreboard.highFinding = json['high_finding'] ?? 0;
    scoreboard.mediumFinding = json['medium_finding'] ?? 0;
    scoreboard.lowFinding = json['low_finding'] ?? 0;
    return scoreboard;
  }
}

class BugTrack {
  late int projects;
  late int findings;
  late int doingProjects;
  late int criticalFindings;
  late int highFindings;
  late int mediumFindings;
  late int lowFindings;
  late Map<String, int> dataFindingInYear;
  late Map<String, int> dataFindingLastYear;
  late List<ScoreBoard> scoreBoard = [];
  late dynamic projectsList = [];

  void updateDashboard(Map<String, dynamic> newInformation) {
    projects = newInformation['projects'] ?? 0;
    findings = newInformation['findings'] ?? 0;
    doingProjects = newInformation['doing_projects'] ?? 0;
    criticalFindings = newInformation['critical_findings'] ?? 0;
    highFindings = newInformation['high_findings'] ?? 0;
    mediumFindings = newInformation['medium_findings'] ?? 0;
    lowFindings = newInformation['low_findings'] ?? 0;
    dataFindingLastYear = Map<String, int>.from(newInformation['data_finding_last_year']);
    dataFindingInYear = Map<String, int>.from(newInformation['data_finding_in_year']);
    scoreBoard = (newInformation['score_board'] as List<dynamic>).map(
      (dynamic json) {
        return ScoreBoard.fromJson(json);
      },
    ).toList();
  }

  void updateProjects(Map<String, dynamic> newInformation) {
    projectsList = newInformation;
  }
}
