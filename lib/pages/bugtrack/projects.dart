import 'package:flutter/material.dart';
import 'package:ird_connect/components/index.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      // BugTrackService.getProjects(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomText(
        text: 'Projects',
        isUpperCase: true,
        color: ColorType.primary,
        type: TextType.largeTitle,
      ),
    );
  }
}
