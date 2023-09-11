import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ird_connect/configs/index.dart';
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
        final total = bugtrack.dashboard.criticalFindings +
            bugtrack.dashboard.highFindings +
            bugtrack.dashboard.mediumFindings +
            bugtrack.dashboard.lowFindings;
        final maxPage = (bugtrack.dashboard.scoreBoard.length / _numberPerPage).ceil();

        return Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total'.toUpperCase(),
                  style: StylesConfig.getTextStyle('h6'),
                ),
                ListTile(
                  horizontalTitleGap: -8,
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.article),
                  title: const Text('Projects'),
                  trailing: Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: Text(
                      bugtrack.dashboard.projects.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.indigo.shade400,
                  ),
                ),
                ListTile(
                  horizontalTitleGap: -8,
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.document_scanner),
                  title: const Text('Doing projects'),
                  trailing: Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: Text(
                      bugtrack.dashboard.doingProjects.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.purple.shade300,
                  ),
                ),
                ListTile(
                  horizontalTitleGap: -8,
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.bug_report),
                  title: const Text('Findings'),
                  trailing: Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: Text(
                      bugtrack.dashboard.findings.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.red.shade300,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Chart'.toUpperCase(),
                  style: StylesConfig.getTextStyle('h6'),
                ),
                const SizedBox(height: 16),
                buildBarChart(bugtrack),
                const SizedBox(height: 32),
                buildPieChart(bugtrack, total),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Score board'.toUpperCase(),
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

  Widget buildBarChart(BugTrackProvider bugtrack) {
    return SizedBox(
      height: 320,
      child: Column(
        children: [
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: true),
                titlesData: const FlTitlesData(
                  leftTitles: AxisTitles(sideTitles: SideTitles(reservedSize: 32, showTitles: true)),
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
                // maxY: 50,
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
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildIndicator(Colors.red.shade400, 'Findings In Year'),
              buildIndicator(Colors.blue.shade400, 'Findings Last Year'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPieChart(BugTrackProvider bugtrack, int total) {
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
                    color: Colors.amber.shade400,
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
    bugtrack.dashboard.scoreBoard.sort((a, b) => b['credit'].compareTo(a['credit']));

    final List<Map<String, dynamic>> topRanking =
        bugtrack.dashboard.scoreBoard.skip(currentPage * numberPerPage).take(numberPerPage).toList();

    return Column(
      children: topRanking.asMap().entries.map((entry) {
        final int rank = entry.key + currentPage * numberPerPage + 1;
        final Map<String, dynamic> user = entry.value;

        return ListTile(
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
                  '${user['user_information']['first_name'][0]}${user['user_information']['last_name'][0]}',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          title: Text('${user['user_information']['first_name']} ${user['user_information']['last_name']}'),
          subtitle: Text(user['user_information']['email']),
          trailing: Chip(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  user['credit'].toString(),
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
        );
      }).toList(),
    );
  }
}
