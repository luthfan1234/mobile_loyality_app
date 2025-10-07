class JoinMission {
  final String id;
  final String title;
  final String points;
  final String description;

  const JoinMission({
    required this.id,
    required this.title,
    required this.points,
    this.description = 'No description available.',
  });
}
