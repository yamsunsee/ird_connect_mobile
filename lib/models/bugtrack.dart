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
  late List<Map<String, dynamic>> scoreBoard;

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
    scoreBoard = List<Map<String, dynamic>>.from(newInformation['score_board']);
  }
}
