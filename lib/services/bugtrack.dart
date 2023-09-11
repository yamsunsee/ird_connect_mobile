import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ird_connect/configs/index.dart';
import 'package:ird_connect/services/index.dart';
import 'package:ird_connect/providers/index.dart';

class BugTrackService {
  static Future<void> getDashboard(BuildContext context) async {
    final dashboard = Provider.of<BugTrackProvider>(context, listen: false);
    await Services.sendRequest(
      context: context,
      method: RequestMethod.getMethod,
      url: UrlsConfig.bugTrackDashboard,
      action: (data) => dashboard.setDashboard = data['data'],
    );
  }
}
