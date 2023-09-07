class App {
  final String title;
  final String brief;
  final String type;
  final String description;
  final String image;
  final List<String> features;
  final Map<String, List<String>> team;
  final String url;

  App({
    required this.title,
    required this.brief,
    required this.type,
    required this.description,
    required this.image,
    required this.features,
    required this.team,
    required this.url,
  });
}
