import 'package:flutter/material.dart';
import 'package:ird_connect/models/index.dart';

class BugTrackProvider with ChangeNotifier {
  final _bugtrack = BugTrack();

  BugTrack get dashboard => _bugtrack;
  dynamic get projects => _bugtrack.projectsList;

  set setDashboard(Map<String, dynamic> newInformation) {
    _bugtrack.updateDashboard(newInformation);
    notifyListeners();
  }

  set setProjects(Map<String, dynamic> newInformation) {
    _bugtrack.updateProjects(newInformation);
    notifyListeners();
  }
}
