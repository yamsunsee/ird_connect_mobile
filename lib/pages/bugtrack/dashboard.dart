import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ird_connect/providers/index.dart';
import 'package:ird_connect/services/index.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      BugTrackService.getDashboard(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BugTrackProvider>(
      builder: (context, bugtrack, child) {
        final total = bugtrack.dashboard.criticalFindings +
            bugtrack.dashboard.highFindings +
            bugtrack.dashboard.mediumFindings +
            bugtrack.dashboard.lowFindings;

        return Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.text_snippet),
                  title: const Text('Total projects'),
                  trailing: Text(bugtrack.dashboard.projects.toString()),
                ),
                ListTile(
                  leading: const Icon(Icons.text_snippet),
                  title: const Text('Total doing projects'),
                  trailing: Text(bugtrack.dashboard.doingProjects.toString()),
                ),
                ListTile(
                  leading: const Icon(Icons.text_snippet),
                  title: const Text('Total findings'),
                  trailing: Text(bugtrack.dashboard.findings.toString()),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  height: 320,
                  child: LineChart(
                    LineChartData(
                      gridData: const FlGridData(show: true),
                      titlesData: const FlTitlesData(
                        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: const Color(0xff37434d), width: 1),
                      ),
                      minX: 1,
                      maxX: 12,
                      minY: 0,
                      maxY: 50,
                      lineBarsData: [
                        LineChartBarData(
                          spots: bugtrack.dashboard.dataFindingLastYear.entries.map((entry) {
                            final x = double.parse(entry.key);
                            final y = entry.value.toDouble();
                            return FlSpot(x, y);
                          }).toList(),
                          isCurved: false,
                          barWidth: 8.0,
                          color: Colors.blue.shade400,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(show: false),
                        ),
                        LineChartBarData(
                          spots: bugtrack.dashboard.dataFindingInYear.entries.map((entry) {
                            final x = double.parse(entry.key);
                            final y = entry.value.toDouble();
                            return FlSpot(x, y);
                          }).toList(),
                          isCurved: false,
                          barWidth: 8.0,
                          color: Colors.red.shade400,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  height: 240,
                  child: PieChart(
                    PieChartData(
                      startDegreeOffset: -90,
                      sectionsSpace: 4,
                      sections: [
                        PieChartSectionData(
                          color: Colors.purple.shade400,
                          value: bugtrack.dashboard.criticalFindings.toDouble(),
                          title: '${(bugtrack.dashboard.criticalFindings / total * 100).toStringAsFixed(0)}%',
                          radius: 50,
                          titleStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        PieChartSectionData(
                          color: Colors.red.shade400,
                          value: bugtrack.dashboard.highFindings.toDouble(),
                          title: '${(bugtrack.dashboard.highFindings / total * 100).toStringAsFixed(0)}%',
                          radius: 50,
                          titleStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        PieChartSectionData(
                          color: Colors.orange.shade400,
                          value: bugtrack.dashboard.mediumFindings.toDouble(),
                          title: '${(bugtrack.dashboard.mediumFindings / total * 100).toStringAsFixed(0)}%',
                          radius: 50,
                          titleStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        PieChartSectionData(
                          color: Colors.yellow.shade400,
                          value: bugtrack.dashboard.lowFindings.toDouble(),
                          title: '${(bugtrack.dashboard.lowFindings / total * 100).toStringAsFixed(0)}%',
                          radius: 50,
                          titleStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const Text('Score board'),
                ...bugtrack.dashboard.scoreBoard.map((user) {
                  return ListTile(
                    title: Text('${user['user_information']['first_name']} ${user['user_information']['last_name']}'),
                    subtitle: Text(user['user_information']['email']),
                    trailing: Text(user['credit'].toString()),
                  );
                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
