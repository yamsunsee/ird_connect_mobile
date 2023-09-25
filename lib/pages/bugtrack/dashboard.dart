import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ird_connect/configs/index.dart';
import 'package:ird_connect/models/bugtrack.dart';
import 'package:ird_connect/providers/index.dart';
import 'package:ird_connect/services/index.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final int _numberPerPage = 5;
  late int _currentPage = 0;

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
        if (bugtrack.dashboard.scoreBoard.isEmpty) {
          return const Text('');
        }

        final maxPage = (bugtrack.dashboard.scoreBoard.length / _numberPerPage).ceil();

        return Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Statistics'.toUpperCase(),
                  style: StylesConfig.getTextStyle('h6'),
                ),
                buildCard(
                  'Projects',
                  bugtrack.dashboard.projects,
                  Icons.article,
                  Colors.indigo.shade400,
                ),
                buildCard(
                  'Doing projects',
                  bugtrack.dashboard.doingProjects,
                  Icons.document_scanner,
                  Colors.purple.shade400,
                ),
                buildCard(
                  'Findings',
                  bugtrack.dashboard.findings,
                  Icons.bug_report,
                  Colors.red.shade400,
                ),
                const SizedBox(height: 32),
                Text(
                  'Charts'.toUpperCase(),
                  style: StylesConfig.getTextStyle('h6'),
                ),
                const SizedBox(height: 16),
                buildBarChart(bugtrack),
                const SizedBox(height: 32),
                buildPieChart(bugtrack.dashboard),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Scoreboard'.toUpperCase(),
                      style: StylesConfig.getTextStyle('h6'),
                    ),
                    Row(
                      children: [
                        IconButton(
                          color: _currentPage < 1 ? Colors.grey : null,
                          onPressed: () {
                            setState(() {
                              if (_currentPage > 0) {
                                _currentPage--;
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.chevron_left,
                            size: 24,
                          ),
                          padding: const EdgeInsets.only(right: 16),
                          constraints: const BoxConstraints(),
                        ),
                        Text(
                          '${_currentPage + 1} / $maxPage',
                          style: StylesConfig.getTextStyle('p'),
                        ),
                        IconButton(
                          color: _currentPage >= maxPage - 1 ? Colors.grey : null,
                          onPressed: () {
                            setState(() {
                              if (_currentPage < maxPage - 1) {
                                _currentPage++;
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.chevron_right,
                            size: 24,
                          ),
                          padding: const EdgeInsets.only(left: 12),
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ],
                ),
                buildScoreBoard(bugtrack, _currentPage, _numberPerPage),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildIndicator(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(text),
      ],
    );
  }

  Widget buildCard(String title, int value, IconData icon, Color color) {
    return ListTile(
      horizontalTitleGap: -8,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
      trailing: Chip(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        label: Text(
          value.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: color,
      ),
    );
  }

  Widget buildBarChart(BugTrackProvider bugtrack) {
    final maxValueLastYear =
        bugtrack.dashboard.dataFindingLastYear.values.reduce((value, element) => value > element ? value : element);
    final maxValueInYear =
        bugtrack.dashboard.dataFindingInYear.values.reduce((value, element) => value > element ? value : element);
    final maxValue = max(maxValueLastYear, maxValueInYear);
    final maxY = (maxValue / 10).ceil() * 10 + 10;

    return SizedBox(
      height: 320,
      child: Column(
        children: [
          Expanded(
            child: LineChart(
              LineChartData(
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(sideTitles: SideTitles(reservedSize: 32, showTitles: true)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        switch (value.toInt()) {
                          case 1:
                            return const Text('Jan');
                          case 2:
                            return const Text('Feb');
                          case 3:
                            return const Text('Mar');
                          case 4:
                            return const Text('Apr');
                          case 5:
                            return const Text('May');
                          case 6:
                            return const Text('Jun');
                          case 7:
                            return const Text('Jul');
                          case 8:
                            return const Text('Aug');
                          case 9:
                            return const Text('Sep');
                          case 10:
                            return const Text('Oct');
                          case 11:
                            return const Text('Nov');
                          case 12:
                            return const Text('Dec');
                          default:
                            return const Text('');
                        }
                      },
                    ),
                  ),
                ),
                minX: 1,
                maxX: 12,
                minY: 0,
                maxY: maxY.toDouble(),
                lineBarsData: [
                  LineChartBarData(
                    spots: bugtrack.dashboard.dataFindingLastYear.entries.map((entry) {
                      final x = double.parse(entry.key);
                      final y = entry.value.toDouble();
                      return FlSpot(x, y);
                    }).toList(),
                    barWidth: 8.0,
                    color: Colors.blue.shade400,
                    dotData: const FlDotData(show: false),
                  ),
                  LineChartBarData(
                    spots: bugtrack.dashboard.dataFindingInYear.entries.map((entry) {
                      final x = double.parse(entry.key);
                      final y = entry.value.toDouble();
                      return FlSpot(x, y);
                    }).toList(),
                    barWidth: 8.0,
                    color: Colors.red.shade400,
                    dotData: const FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildIndicator(Colors.blue.shade400, 'Findings Last Year'),
              buildIndicator(Colors.red.shade400, 'Findings In Year'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPieChart(dynamic data, {bool isDetails = false}) {
    late int critical = 0;
    late int high = 0;
    late int medium = 0;
    late int low = 0;

    if (isDetails) {
      critical = data.criticalFinding;
      high = data.highFinding;
      medium = data.mediumFinding;
      low = data.lowFinding;
    } else {
      critical = data.criticalFindings;
      high = data.highFindings;
      medium = data.mediumFindings;
      low = data.lowFindings;
    }

    if (critical + high + medium + low < 1) {
      return const Center(
        child: Text(
          'No data available',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      );
    }

    return SizedBox(
      height: 240,
      child: Column(
        children: [
          Expanded(
            child: PieChart(
              PieChartData(
                startDegreeOffset: -90,
                sectionsSpace: 4,
                sections: [
                  PieChartSectionData(
                    color: Colors.purple.shade400,
                    value: critical.toDouble(),
                    title: critical.toString(),
                    radius: 50,
                    titleStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.red.shade400,
                    value: high.toDouble(),
                    title: high.toString(),
                    radius: 50,
                    titleStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.orange.shade400,
                    value: medium.toDouble(),
                    title: medium.toString(),
                    radius: 50,
                    titleStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.amber.shade400,
                    value: low.toDouble(),
                    title: low.toString(),
                    radius: 50,
                    titleStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildIndicator(Colors.purple.shade400, 'Critical'),
              buildIndicator(Colors.red.shade400, 'High'),
              buildIndicator(Colors.orange.shade400, 'Medium'),
              buildIndicator(Colors.amber.shade400, 'Low'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildScoreBoard(BugTrackProvider bugtrack, int currentPage, int numberPerPage) {
    bugtrack.dashboard.scoreBoard.sort((a, b) => b.credit.compareTo(a.credit));

    final List<ScoreBoard> topRanking =
        bugtrack.dashboard.scoreBoard.skip(currentPage * numberPerPage).take(numberPerPage).toList();

    return Column(
      children: topRanking.asMap().entries.map(
        (entry) {
          final int rank = entry.key + currentPage * numberPerPage + 1;
          final ScoreBoard scoreBoard = entry.value;

          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              scoreBoard.userInformation.fullName,
                              style: StylesConfig.getTextStyleWithColor(context, 'h5', 'primary'),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.workspace_premium,
                                  color: Colors.amber.shade400,
                                  size: 32,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  rank.toString(),
                                  style: TextStyle(
                                    color: Colors.amber.shade400,
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          scoreBoard.userInformation.email,
                          style: StylesConfig.getTextStyleWithColor(context, 'p', 'secondary', isItalic: true),
                        ),
                        buildCard(
                          'Credits',
                          scoreBoard.credit,
                          Icons.monetization_on,
                          Colors.green.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Statistics'.toUpperCase(),
                          style: StylesConfig.getTextStyle('h6'),
                        ),
                        buildCard(
                          'Projects',
                          scoreBoard.project,
                          Icons.article,
                          Colors.indigo.shade400,
                        ),
                        buildCard(
                          'Findings',
                          scoreBoard.finding,
                          Icons.bug_report,
                          Colors.red.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Charts'.toUpperCase(),
                          style: StylesConfig.getTextStyle('h6'),
                        ),
                        buildPieChart(scoreBoard, isDetails: true),
                      ],
                    ),
                  );
                },
              );
            },
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    rank.toString(),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(width: 16),
                  CircleAvatar(
                    backgroundColor: StylesConfig.getColor(context, 'primary'),
                    child: Text(
                      scoreBoard.userInformation.shortName,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              title: Text(scoreBoard.userInformation.fullName),
              subtitle: Text(scoreBoard.userInformation.email),
              trailing: Chip(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      scoreBoard.credit.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.monetization_on,
                      size: 16,
                      color: Colors.white,
                    )
                  ],
                ),
                backgroundColor: Colors.green.shade300,
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
